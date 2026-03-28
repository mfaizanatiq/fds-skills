# Flow Design System — Claude Code Skills

Qatar Airways Flow Design System (FDS) skills for Claude Code.

## Skills

| Skill | Description |
|-------|-------------|
| `flow-design-system` | FDS reference — components, tokens, typography, colors, spacing, patterns, content guidelines |
| `fds-presentations` | FDS presentation deck system — dark/light themes, slide layouts, 1920×1080 canvas |

## Setup on a new machine

Clone the repo and run the setup script:

```bash
git clone https://github.com/mfaizanatiq/fds-skills.git ~/Projects/fds-skills
cd ~/Projects/fds-skills
chmod +x setup.sh
./setup.sh
```

The setup script creates symlinks from `~/.claude/skills/` to this repo. After that, any `git pull` updates the live skills instantly.

## Updating skills

1. Edit files in this repo
2. Changes are live immediately (symlinked)
3. Commit and push when ready

```bash
git add -A && git commit -m "Update FDS tokens"
git push
```

## Syncing on another machine

```bash
cd ~/Projects/fds-skills
git pull
```

Skills update instantly via symlinks.
