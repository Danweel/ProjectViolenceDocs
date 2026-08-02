#!/bin/bash
# live_preview.sh - Start Sphinx autobuild with live reload
# Usage: ./live_preview.sh

PROJECT_DIR="$HOME/Documents/VSCodiumFiles/ProjectViolenceDocs"

cd "$PROJECT_DIR" || { echo "❌ Project directory not found"; exit 1; }

# Let Poetry resolve the venv automatically
echo "🔍 Locating Poetry environment..."
VENV_PATH=$(poetry env info --path 2>/dev/null)

if [ -z "$VENV_PATH" ]; then
    echo "❌ No Poetry environment found. Run 'poetry install' first."
    exit 1
fi

source "$VENV_PATH/bin/activate"
echo "✅ Activated: $(basename "$VENV_PATH")"

# Check if sphinx-autobuild is installed
if ! command -v sphinx-autobuild &> /dev/null; then
    echo "⚠️  sphinx-autobuild not found. Installing..."
    poetry add sphinx-autobuild --group docs
fi

echo ""
echo "📚 Starting Sphinx autobuild..."
echo "   Open your browser to: http://127.0.0.1:8001"
echo "   Press Ctrl+C to stop."
echo ""

sphinx-autobuild docs/source docs/_build/html --host 127.0.0.1