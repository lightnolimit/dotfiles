# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive Neovim configuration built with `lazy.nvim` as the plugin manager. The configuration follows a modular architecture with plugins organized by functionality. The setup includes a custom colorscheme called "Cosmic Latte" which is developed as a standalone plugin within this configuration.

## Architecture

### Core Structure
- `init.lua` - Entry point that loads options first, then lazy.nvim
- `lua/config/` - Core configuration files (options, lazy setup)  
- `lua/plugins/` - Modular plugin configurations, one file per plugin/feature
- `cosmic-latte.nvim/` - Custom colorscheme plugin (can be open-sourced)
- `KEYMAPS.md` - Comprehensive reference for all keybindings

### Plugin Organization
- **essentials.lua** - Core functionality (mini.pairs, comments, gitsigns, lualine)
- **lsp.lua** - Language server protocol with Mason auto-installation
- **telescope.lua** - Fuzzy finder and file browser with custom ignore patterns
- **nvim-tree.lua** - File tree sidebar with git integration
- **productivity.lua** - Enhanced workflow tools (toggleterm, trouble, harpoon, mini.surround)
- **dap.lua** - Debug adapter protocol for TypeScript/JavaScript/React
- **treesitter.lua** - Syntax highlighting and parsing
- **alpha.lua** - Dashboard with custom ASCII art
- **claude-code.lua** - Claude Code integration with custom sidebar
- **cosmic-latte.lua** - Custom theme plugin loader

### Key Design Principles
- **Leader key**: Space (`<space>`)
- **Lightweight**: Minimal plugins while maintaining IDE functionality
- **Git-aware**: File tree and status indicators throughout
- **TypeScript/React focused**: LSP and DAP specifically configured for modern JS/TS development
- **Dual themes**: Light and dim variants of cosmic latte theme
- **Navigation-friendly**: Dashboard hotkeys don't conflict with vim navigation (no `k`, `g`, etc.)

## Development Commands

### Theme Development
```lua
-- Switch themes
:CosmicLatteLight  -- Switch to light theme
:CosmicLatteDim    -- Switch to dim theme
```

### Plugin Management
```vim
:Lazy              -- Open lazy.nvim interface
:Mason             -- Open Mason LSP installer
:checkhealth       -- Verify Neovim health and plugin status
```

### File Operations
- File tree: `<space>e` (toggle), `<space>o` (focus)
- Quick file browser: `<space>b`
- Find files: `<space>ff`
- Live grep: `<space>fg`

### Development Workflow
- LSP diagnostics: `<space>xx` (Trouble), `[d`/`]d` (navigate)
- Debug: `<space>db` (breakpoint), `<space>dc` (continue), `<space>du` (UI)
- Terminal: `<C-\>` (floating), `<space>tt` (toggle)
- Claude Code: `<space>cs` (40% sidebar), `<space>cc` (toggle)

## Custom Colorscheme

The Cosmic Latte theme is a standalone plugin that can be open-sourced. It's solarized-inspired with a cosmic coral accent (`#ff8e7f`). The theme includes:
- Light variant (`cosmic-latte`)
- Dim variant (`cosmic-latte-dim`) - default theme
- Full LSP, Treesitter, and plugin support
- Git status colors and diagnostic highlighting

## File Patterns to Ignore

The configuration automatically filters out common build artifacts and dependencies:
- `node_modules/`, `dist/`, `build/`, `target/`
- Git files, cache directories, compiled binaries
- Media files (videos, archives)

## Important Notes

- Netrw is disabled in favor of nvim-tree
- The configuration expects Nerd Fonts for proper icon display
- DAP is configured for JavaScript/TypeScript debugging with Chrome/Node
- Harpoon is set up for quick file switching (Ctrl+h/j/k/l for files 1-4)
- Terminal integration allows both floating and sidebar Claude Code access