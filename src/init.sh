#!/usr/bin/env bash
set -e

# init.sh - SOTA Engine injector
# Usage:
#   ./src/init.sh [target-dir]            initialize (empty scaffold or existing inject)
#   ./src/init.sh --update [target-dir]   in-place engine upgrade (skills + router + workflow)

UPDATE=0
TARGET_DIR="."
for arg in "$@"; do
  case "$arg" in
    --update) UPDATE=1 ;;
    *) TARGET_DIR="$arg" ;;
  esac
done

ENGINE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Resolve target dir
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"
TARGET_DIR_ABS="$(pwd)"

# Numeric semver compare: returns 0 if $1 > $2, 1 otherwise
version_gt() {
  local a=(${1//./ }) b=(${2//./ })
  for i in 0 1 2; do
    local av="${a[$i]:-0}" bv="${b[$i]:-0}"
    if [ "$av" -gt "$bv" ]; then return 0; fi
    if [ "$av" -lt "$bv" ]; then return 1; fi
  done
  return 1
}

# --- --update path: in-place engine upgrade ---
if [ "$UPDATE" = "1" ]; then
  if [ ! -d ".sota" ]; then
    echo "Error: not an SOTA-managed project (no .sota marker). Run ./src/init.sh <dir> first."
    exit 1
  fi
  MARKER_VERSION="$(sed -n 's/^Engine Version: //p' .sota/info)"
  ENTRY_MODE="$(sed -n 's/^Entry Mode: //p' .sota/info)"
  ENGINE_VERSION="$(cat "$ENGINE_ROOT/engine/VERSION")"

  echo "Checking SOTA engine version in $TARGET_DIR_ABS ..."
  if [ -z "$MARKER_VERSION" ] || [ -z "$ENTRY_MODE" ]; then
    echo "Error: .sota/info is malformed (missing version or entry mode). Re-init instead."
    exit 1
  fi
  if [ "$MARKER_VERSION" = "$ENGINE_VERSION" ]; then
    echo "up to date (engine $ENGINE_VERSION) — nothing to do"
    exit 0
  fi
  if version_gt "$MARKER_VERSION" "$ENGINE_VERSION"; then
    echo "warning: project ($MARKER_VERSION) is newer than engine ($ENGINE_VERSION) — skipping"
    exit 0
  fi

  echo "Updating $TARGET_DIR_ABS: $MARKER_VERSION → $ENGINE_VERSION"

  # 1. skills — engine-reserved, overwrite-to-repair
  echo "Syncing skills..."
  mkdir -p .agents/skills
  if [ -d "$ENGINE_ROOT/engine/skills" ] && [ "$(ls -A "$ENGINE_ROOT/engine/skills")" ]; then
    cp -r "$ENGINE_ROOT/engine/skills/"* .agents/skills/
  fi

  # 2. workflow template + seeds + scripts (current.yaml untouched)
  echo "Syncing workflow..."
  mkdir -p workflow
  if [ -d "$ENGINE_ROOT/engine/workflow" ] && [ "$(ls -A "$ENGINE_ROOT/engine/workflow")" ]; then
    cp -r "$ENGINE_ROOT/engine/workflow/"* workflow/
  fi

  # 3. router — surgical replace of the BEGIN/END block; fresh append if absent
  echo "Replacing router block in AGENTS.md..."
  if grep -q "sota-workflow" AGENTS.md; then
    awk '
      /BEGIN:sota-workflow/ { inblock=1; next }
      /END:sota-workflow/   { inblock=0; next }
      !inblock              { print }
    ' AGENTS.md > AGENTS.md.tmp
    cat "$ENGINE_ROOT/engine/AGENTS-router.md" >> AGENTS.md.tmp
    mv AGENTS.md.tmp AGENTS.md
  else
    cat "$ENGINE_ROOT/engine/AGENTS-router.md" >> AGENTS.md
  fi

  # 4. validate — build must pass before the marker is bumped
  if [ -f "package.json" ]; then
    echo "Running npm run build to validate..."
    npm run build
  fi

  # 5. re-mark, preserving entry mode
  echo "Engine Version: $ENGINE_VERSION" > .sota/info
  date > .sota/init_date
  echo "Entry Mode: $ENTRY_MODE" >> .sota/info
  echo "✅ updated to engine $ENGINE_VERSION"
  exit 0
fi

# --- normal init path ---
echo "Initializing SOTA engine in $TARGET_DIR..."

# 3. Re-run safe
if [ -d ".sota" ]; then
    echo "already initialized"
    exit 0
fi

# Branch A — target empty (or no package.json)
if [ ! -f "package.json" ]; then
    if [ -d ".git" ] || [ -f "README.md" ] || [ -f "README" ] || [ -d "src" ]; then
        echo "Error: target dir must be truly empty (no .git/README/src)."
        exit 1
    fi
    ENTRY_MODE="empty"
    echo "Target is empty or missing package.json. Scaffolding Next.js app..."
    
    # 2. Check node + npm exist
    if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
        echo "Error: node and npm are required to scaffold a new project."
        exit 1
    fi

    # Scaffold Next.js into a lowercase temp subdir
    TEMP_DIR="$(basename "$TARGET_DIR_ABS" | tr '[:upper:]' '[:lower:]')-temp"
    
    echo "Running create-next-app..."
    # non-interactive create-next-app
    npx -y create-next-app@latest "$TEMP_DIR" --typescript --tailwind --eslint --app --src-dir --import-alias "@/*" --use-npm --disable-git

    echo "Moving scaffolded files to target root..."
    shopt -s dotglob
    mv "$TEMP_DIR"/* .
    shopt -u dotglob
    rmdir "$TEMP_DIR"
else
    ENTRY_MODE="existing"
    echo "Existing project detected. Injecting SOTA engine..."
fi

# Assemble AGENTS.md
echo "Assembling AGENTS.md..."
if [ ! -f "AGENTS.md" ]; then
    echo "# SOTA-Managed Project" > AGENTS.md
    echo "" >> AGENTS.md
fi

cat "$ENGINE_ROOT/engine/AGENTS-router.md" >> AGENTS.md

# Copy skills and workflow
echo "Copying skills and workflow..."
mkdir -p .agents/skills
if [ -d "$ENGINE_ROOT/engine/skills" ] && [ "$(ls -A "$ENGINE_ROOT/engine/skills")" ]; then
    cp -r "$ENGINE_ROOT/engine/skills/"* .agents/skills/
fi

mkdir -p workflow
if [ -d "$ENGINE_ROOT/engine/workflow" ] && [ "$(ls -A "$ENGINE_ROOT/engine/workflow")" ]; then
    cp -r "$ENGINE_ROOT/engine/workflow/"* workflow/
fi

# Generate current.yaml
echo "Generating current.yaml..."
TARGET_NAME="$(basename "$TARGET_DIR_ABS")"

if [ -f "workflow/workflow.yaml" ]; then
    cat "workflow/workflow.yaml" | sed "s/name: # filled by init + DIRECTION phase per project/name: $TARGET_NAME/" > workflow/current.yaml
else
    # Fallback
    cat <<EOF > workflow/current.yaml
project:
  name: $TARGET_NAME
  mode: null
  audience: null
EOF
fi

# Touch PRODUCT.md and DESIGN.md
touch PRODUCT.md DESIGN.md

# Validate
if [ "$ENTRY_MODE" = "empty" ]; then
    echo "Running npm run build to validate..."
    npm run build
fi

# Write .sota marker AFTER build validation
echo "Writing .sota marker..."
mkdir -p .sota
ENGINE_VERSION=$(cat "$ENGINE_ROOT/engine/VERSION")
echo "Engine Version: $ENGINE_VERSION" > .sota/info
date > .sota/init_date
echo "Entry Mode: $ENTRY_MODE" >> .sota/info

echo ""
echo "Summary:"
echo "✅ SOTA Engine initialized in $TARGET_DIR_ABS"
echo "👉 open this folder in Antigravity and type: new site: <your one-liner>. run the workflow."
