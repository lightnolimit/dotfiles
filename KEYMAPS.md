# Neovim Keymaps Reference

## Leader Key: `<space>`

## Custom Keymaps

### File Tree (Nvim-tree)
- `<space>e` - Toggle file tree
- `<space>o` - Focus file tree  
- `<space>fe` - Find current file in tree

### Telescope
- `<space>ff` - Find files
- `<space>fg` - Live grep (search in files)
- `<space>fb` - Find buffers
- `<space>fh` - Help tags
- `<space>b` - Quick file browser (popup)

#### File Browser Navigation
- `h` - Go to parent directory
- `l` - Enter directory/open file
- `<CR>` - Open file
- Auto-hides: node_modules, dist, build, .git, etc.

### LSP (once attached to buffer)
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `<space>D` - Go to type definition
- `<space>ds` - Document symbols
- `<space>ws` - Workspace symbols
- `<space>rn` - Rename
- `<space>ca` - Code action
- `K` - Hover documentation
- `<C-k>` - Signature help
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<space>e` - Show diagnostic float
- `<space>q` - Diagnostic list

### Claude Code
- `<C-,>` - Toggle Claude Code terminal (from any mode)
- `<space>cc` - Toggle Claude Code terminal
- `<space>cs` - Open Claude Code as right sidebar (40% width)
- `<space>cC` - Continue previous Claude conversation
- `<space>cV` - Claude Code verbose mode

#### In Claude Terminal
- `<C-,>` - Close Claude terminal
- `<Esc>` - Exit insert mode in terminal

### Comments
- `gcc` - Toggle line comment
- `gc` - Toggle comment (visual mode)

### Theme Switching
- `<space>tl` - Switch to light theme
- `<space>td` - Switch to dim theme
- `<space>tc` - Toggle between light/dim themes
- `:CosmicLatteLight` - Switch to light theme (command)
- `:CosmicLatteDim` - Switch to dim theme (command)

### Terminal (ToggleTerm)
- `<C-\>` - Toggle floating terminal
- `<space>tt` - Toggle terminal
- `<space>th` - Horizontal terminal
- `<space>tv` - Vertical terminal
- `<space>tf` - Floating terminal
- `<Esc>` - Exit terminal mode

### Diagnostics (Trouble)
- `<space>xx` - Toggle Trouble
- `<space>xw` - Workspace diagnostics
- `<space>xd` - Document diagnostics
- `<space>xl` - Location list
- `<space>xq` - Quickfix list
- `gR` - LSP references (in Trouble)

### Quick Navigation (Harpoon)
- `<space>a` - Add file to harpoon
- `<C-e>` - Toggle harpoon menu
- `<C-h>` - Jump to harpoon file 1
- `<C-j>` - Jump to harpoon file 2
- `<C-k>` - Jump to harpoon file 3
- `<C-l>` - Jump to harpoon file 4
- `<C-S-P>` - Previous harpoon file
- `<C-S-N>` - Next harpoon file

### Surround Text (Mini.surround)
- `sa` - Add surrounding (Normal/Visual)
- `sd` - Delete surrounding
- `sr` - Replace surrounding
- `sf` - Find surrounding (right)
- `sF` - Find surrounding (left)
- `sh` - Highlight surrounding
- `sn` - Update n_lines

### Debug Adapter Protocol (DAP)
- `<space>db` - Toggle breakpoint
- `<space>dB` - Set conditional breakpoint
- `<space>dc` - Continue debugging
- `<space>dC` - Run to cursor
- `<space>di` - Step into
- `<space>do` - Step over
- `<space>dO` - Step out
- `<space>dt` - Terminate debugging
- `<space>du` - Toggle DAP UI
- `<space>de` - Evaluate expression
- `<space>dr` - Toggle REPL

## Essential Vim Commands

### Navigation
- `h/j/k/l` - Left/Down/Up/Right
- `w/b` - Next/Previous word
- `e` - End of word
- `0/$` - Start/End of line
- `gg/G` - First/Last line
- `<C-u>/<C-d>` - Page up/down
- `<C-f>/<C-b>` - Full page forward/back
- `%` - Jump to matching bracket

### Editing
- `i/a` - Insert before/after cursor
- `I/A` - Insert at start/end of line
- `o/O` - New line below/above
- `x/X` - Delete char forward/backward
- `dd` - Delete line
- `yy` - Yank (copy) line
- `p/P` - Paste after/before
- `u/<C-r>` - Undo/Redo
- `ciw` - Change inside word
- `diw` - Delete inside word
- `viw` - Select inside word
- `.` - Repeat last command

### Visual Mode
- `v` - Character visual mode
- `V` - Line visual mode
- `<C-v>` - Block visual mode
- `y` - Yank selection
- `d` - Delete selection
- `>/<` - Indent/Unindent

### Search
- `/pattern` - Search forward
- `?pattern` - Search backward
- `n/N` - Next/Previous match
- `*/#` - Search word under cursor forward/back

### Windows
- `<C-w>` - Cycle to next window
- `<C-h>` - Move to left window
- `<C-j>` - Move to window below  
- `<C-k>` - Move to window above
- `<C-l>` - Move to right window
- `<C-w>v` - Split vertically
- `<C-w>s` - Split horizontally
- `<C-w>q` - Close window
- `<C-w>=` - Equal size windows
- `<C-w>|` - Maximize window width
- `<C-w>_` - Maximize window height

### Buffers
- `:bnext` or `:bn` - Next buffer
- `:bprev` or `:bp` - Previous buffer
- `:bd` - Delete buffer
- `:ls` - List buffers

### Files
- `:w` - Save
- `:q` - Quit
- `:wq` - Save and quit
- `:q!` - Quit without saving
- `:e filename` - Edit file
