# Documentation project instructions

## About this project

- This is the UseZombie documentation site built on [Mintlify](https://mintlify.com)
- Pages are MDX files with YAML frontmatter
- Configuration lives in `docs.json`
- Run `mint dev` to preview locally on port 3000
- Run `mint broken-links` to check links
- Deploys automatically on push to the default branch (Mintlify GitHub integration)

## Terminology

- Use "spec" not "specification" or "ticket"
- Use "run" not "job" or "task"
- Use "workspace" not "project"
- Use "gate loop" not "CI pipeline" or "validation loop"
- Use "scorecard" not "report" or "metrics"
- Use "agent" not "bot" or "AI"
- Use "PR" not "pull request" (except on first mention per page)
- Use "zombiectl" in code formatting when referring to CLI commands
- Use "zombied" in code formatting when referring to server processes
- Use "Mission Control" for the web dashboard (app.usezombie.com)

## Style preferences

- Use active voice and second person ("you")
- Keep sentences concise — one idea per sentence
- Use sentence case for headings
- Bold for UI elements: Click **Settings**
- Code formatting for file names, commands, paths, and code references
- Mermaid for all sequence and architecture diagrams
- Do not use time estimates or effort ratings in user-facing docs
- Mark future features with `<Note>` callout: "This feature is coming soon."

## Content boundaries

- Do not document internal deployment playbooks (those live in the main repo)
- Do not expose credential values, vault paths, or 1Password references
- Do not document internal agent pipeline internals (NullClaw config details, executor RPC protocol) — keep operator docs at the operational level
- Do not reference specific cloud provider pricing or account details

## Design system colors

{/* SYNC SOURCE: ~/Projects/usezombie/ui/packages/design-system/src/tokens.css
     When touching colors in this repo (docs.json, logos, custom CSS), always
     verify values against the canonical design-system tokens first.
     Run: grep -E "^  --z-(orange|bg|text|green|cyan|red|amber)" ~/Projects/usezombie/ui/packages/design-system/src/tokens.css */}

Primary brand color: `#d96b2b` (`--z-orange`). Use this for emphasis and CTAs.
Primary bright/hover: `#e78a3c` (`--z-orange-bright`).
Background dark: `#05080d` (`--z-bg-0`). Surface: `#0f1520` (`--z-surface-0`).
Text primary: `#e8f2ff` (`--z-text-primary`). Text muted: `#8b97a8` (`--z-text-muted`).
Status colors: green `#39ff85` (`--z-green`, done), cyan `#5ed4ec` (`--z-cyan`, running), red `#ff4d6a` (`--z-red`, failed), amber `#c99232` (`--z-amber`, queued).
