# Super Builder Agent for OpenCode

[อ่านภาษาไทย](README.th.md)

`super-builder` is an OpenCode agent profile designed for teams and solo developers who want a strict, Superpowers-driven development workflow. It acts as a lazy senior engineer with strong taste, enforcing minimal changes, strict planning, and Karpathy-style engineering discipline.

## What This Project Provides

- `agent.md`: The core OpenCode agent profile that orchestrates the workflow.
- **Core Workflow Enforcement**: Automatically loads essential skills (`caveman`, `ponytail`, `brainstorming`, `guidelines`) at the start of every task.
- **Model Selection Gate**: Intelligently routes simple tasks to fast models and asks for model selection on complex planning/implementation tasks.
- **Strict Planning**: Enforces the creation and approval of implementation plans before writing code.
- **Context Management**: Integrates with CodeGraph for project context and Headroom MCP for context compression.

## Requirements

- [OpenCode](https://opencode.ai/) must be installed.
- On macOS, Linux, or Git Bash, the installer requires either `curl` or `wget`.
- On Windows, run the installer with PowerShell.
- The following skills must be installed in your OpenCode environment:
  - `caveman`
  - `ponytail`
  - `brainstorming`
  - `guidelines`
  - `grill-design`
  - `create-plan`
  - `subagent-driven-development`

## Installation

### macOS, Linux, or Git Bash

```sh
curl -fsSL https://raw.githubusercontent.com/nathakrit-neighborsoft/super-builder-opencode/main/install.sh | sh
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/nathakrit-neighborsoft/super-builder-opencode/main/install.ps1 | iex
```

## Install Location

By default, the installer writes files to the global OpenCode config directory for your operating system:

- macOS, Linux, or Git Bash: `~/.config/opencode`
- Windows PowerShell: `%APPDATA%\opencode`

OpenCode loads global agents from `agents/` inside this config directory. The installer will save the agent as `super-builder.md`.

## Updating

Run the same installation command again to update the files. The installer downloads the selected git ref and overwrites the existing files immediately. It does not create backups.

## Usage

Once installed, you can select the `super-builder` agent in OpenCode. The agent will automatically guide you through its structured workflow:

1. **Brainstorming & Clarification**: Asks targeted questions to understand the goal.
2. **Model Selection**: Asks which models to use for planning and implementation.
3. **Planning**: Creates a detailed plan for your approval.
4. **Implementation**: Executes the plan using subagents or direct minimal changes.
5. **Verification**: Ensures the code works before completing the task.

## License

This project is distributed under the MIT License.
