#!/usr/bin/env bash
set -e

# init.sh - SOTA Engine injector
# Usage: ./src/init.sh [target-dir]

TARGET_DIR="${1:-.}"
ENGINE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Initializing SOTA engine in $TARGET_DIR..."

# 1. Resolve target dir
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"
TARGET_DIR_ABS="$(pwd)"

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
