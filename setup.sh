#!/bin/bash
# Flow Design System Skills — Setup Script
# Run this after cloning on a new machine to symlink skills into Claude Code.

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

SKILLS=("flow-design-system" "fds-presentations")

echo "Setting up FDS skills..."
echo "Repo:   $REPO_DIR"
echo "Target: $SKILLS_DIR"
echo ""

# Ensure skills directory exists
mkdir -p "$SKILLS_DIR"

for skill in "${SKILLS[@]}"; do
    target="$SKILLS_DIR/$skill"

    if [ -L "$target" ]; then
        echo "  ✓ $skill — symlink already exists, updating..."
        rm "$target"
    elif [ -d "$target" ]; then
        echo "  ! $skill — existing folder found, backing up to ${target}.bak"
        mv "$target" "${target}.bak"
    fi

    ln -s "$REPO_DIR/$skill" "$target"
    echo "  ✓ $skill → linked"
done

echo ""
echo "Done! Skills are live. Any git pull will update them instantly."
