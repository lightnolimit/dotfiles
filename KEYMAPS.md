Neovim Keymaps Reference

## Leader Key: `<space>`

## Custom Keymaps

### File Operations
- `<space>w` - Save file
- `<space>q` - Quit
- `<space>Q` - Quit all

### Buffer Management
- `<Tab>` - Next buffer
- `<S-Tab>` - Previous buffer
- `<space>bd` - Delete buffer (preserves window)
- `<space>bD` - Force delete buffer

### File Tree (Nvim-tree)
- `<space>e` - Toggle file tree
- `<space>o` - Focus file tree  
- `<space>fe` - Find current file in tree
- `s` - Open file with system default application (in nvim-tree)

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
- `<space>t1` - Toggle floating terminal 1
- `<space>t2` - Toggle floating terminal 2
- `<space>t3` - Toggle floating terminal 3
- `<space>t4` - Toggle floating terminal 4
- `<space>tn` - Next terminal
- `<space>tp` - Previous terminal
- `<space>ta` - Toggle all terminals
- `<Esc>` - Exit terminal mode
- `<C-q>` - Close terminal (from terminal mode)

### Diagnostics (Trouble)
- `<space>xx` - Toggle Trouble
- `<space>xw` - Workspace diagnostics
- `<space>xd` - Document diagnostics
- `<space>xl` - Location list
- `<space>xq` - Quickfix list
- `gR` - LSP references (in Trouble)

### Quick Navigation (Harpoon)
- `<space>h` - Add file to harpoon
- `<space>hm` - Toggle harpoon menu
- `<space>h1` - Jump to harpoon file 1
- `<space>h2` - Jump to harpoon file 2
- `<space>h3` - Jump to harpoon file 3
- `<space>h4` - Jump to harpoon file 4
- `<space>h5` - Jump to harpoon file 5
- `<space>h6` - Jump to harpoon file 6
- `<space>h7` - Jump to harpoon file 7
- `<space>h8` - Jump to harpoon file 8
- `<space>h9` - Jump to harpoon file 9
- `[h` - Previous harpoon file
- `]h` - Next harpoon file


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

### Image Clipboard (img-clip.nvim)
- `<space>p` - Paste image from clipboard (prompts for filename)
- Drag & drop images directly into files
- Auto-formats as `![alt](path)` in markdown files

### Multiline Editing (vim-visual-multi)
- `<C-d>` - Select word under cursor (repeat to select more instances)
- `<C-n>` - Start visual multi-cursor mode
- `<C-Up>/<C-Down>` - Add cursor above/below current line
- `<C-x>` - Add cursor at position or skip current region
- `<C-q>` - Remove current region from selection
- Mouse clicks to add cursors (when enabled)
- `<Esc>` - Exit multi-cursor mode

#### Multiline Editing Workflow:
1. Position cursor on a word
2. Press `<C-d>` to select it  
3. Keep pressing `<C-d>` to select more instances
4. Type to edit all selected words simultaneously
5. Press `<Esc>` to exit multi-cursor mode

### Enhanced Navigation (Flash.nvim)
- `<space>s` - Flash jump (quick navigation to any visible text)
- `<space>S` - Flash treesitter (jump to code structures)
- `r` - Remote flash (in operator-pending mode)
- `R` - Treesitter search (in visual/operator-pending mode)
- `<C-s>` - Toggle flash search (in command mode)

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
- `<C-d>` - Page down and center cursor
- `<C-u>` - Page up and center cursor
- `<C-a>` - Select all

### Editing
- `i/a` - Insert before/after cursor
- `I/A` - Insert at start/end of line
- `o/O` - New line below/above/
- `x/X` - Delete char forward/backward
- `dd` - Delete line
- `yy` - Yank (copy) line
- `p/P` - Paste after/before
- `u/<C-r>` - Undo/Redo
- `ciw` - Change inside word
- `diw` - Delete inside word
- `viw` - Select inside word
- `.` - Repeat last command
- `J` - Join lines without moving cursor

### Visual Mode
- `v` - Character visual mode
- `V` - Line visual mode
- `<C-v>` - Block visual mode
- `y` - Yank selection
- `d` - Delete selection
- `>/<` - Indent/Unindent
- `<` - Indent left and reselect
- `>` - Indent right and reselect
- `p` - Paste without yanking replaced text
- `<space>s` - Substitute in selection

### Search
- `/pattern` - Search forward
- `?pattern` - Search backward
- `n/N` - Next/Previous match
- `*/#` - Search word under cursor forward/back
- `<Esc>` - Clear search highlight
- `n` - Next match and center
- `N` - Previous match and center
- `<space>S` - Substitute in file

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
- `<C-Up>` - Increase window height
- `<C-Down>` - Decrease window height
- `<C-Left>` - Decrease window width
- `<C-Right>` - Increase window width

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
