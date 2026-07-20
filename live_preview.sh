#!/bin/bash
# live_preview.sh - Start Sphinx autobuild with live reload
# Usage: ./live_preview.sh

PROJECT_DIR="$HOME/Documents/VSCodiumFiles/ProjectViolenceDocs"
ENV_NAME="projectviolencedocs-CjdI7n0o-py3.12"

cd "$PROJECT_DIR" || { echo "❌ Project directory not found"; exit 1; }

# Activate the virtual environment
if [ -d "$PROJECT_DIR/$ENV_NAME" ]; then
    source "$PROJECT_DIR/$ENV_NAME/bin/activate"
    echo "✅ Activated: $ENV_NAME"
else
    echo "❌ Virtual environment not found at $PROJECT_DIR/$ENV_NAME"
    echo "   Looking for alternatives..."
    # Try to find any matching venv
    FOUND_ENV=$(find "$PROJECT_DIR" -maxdepth 1 -type d -name "projectviolencedocs-*-py*" | head -n 1)
    if [ -n "$FOUND_ENV" ]; then
        source "$FOUND_ENV/bin/activate"
        echo "✅ Activated: $(basename $FOUND_ENV)"
    else
        echo "❌ No virtual environment found. Run 'poetry install' first."
        exit 1
    fi
fi

# Check if sphinx-autobuild is installed
if ! command -v sphinx-autobuild &> /dev/null; then
    echo "⚠️  sphinx-autobuild not found. Installing..."
    pip install sphinx-autobuild
fi

echo ""
echo "📚 Starting Sphinx autobuild..."
echo "   Open your browser to: http://127.0.0.1:8000"
echo "   Press Ctrl+C to stop."
echo ""

# Run sphinx-autobuild (no --open-browser to avoid Qt errors)
sphinx-autobuild docs/source docs/_build/html --host 127.0.0.1
