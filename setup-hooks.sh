#!/bin/bash
# setup-hooks.sh - Install Git hooks from the hooks/ directory

echo "🔧 Installing Git hooks..."

# Copy hooks to .git/hooks/
cp hooks/commit-msg .git/hooks/
cp hooks/post-commit .git/hooks/
cp hooks/post-release .git/hooks/
cp hooks/pre-commit .git/hooks/
cp hooks/pre-push .git/hooks/
cp hooks/prepare-commit-msg .git/hooks/

# Make them executable
chmod +x .git/hooks/commit-msg
chmod +x .git/hooks/post-commit
chmod +x .git/hooks/post-release
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/pre-push
chmod +x .git/hooks/prepare-commit-msg .git/hooks

echo "✅ Hooks installed successfully!"
echo "   Run './setup-hooks.sh' again if you update any hooks."
