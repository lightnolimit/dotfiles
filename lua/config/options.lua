-- Basic vim options
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Enable filetype detection and plugins
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- Custom keymaps for common operations
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- Better buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Visual mode enhancements
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Better line joins
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Center cursor when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Quick window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Quick substitution
vim.keymap.set("x", "<leader>s", ":s///g<Left><Left><Left>", { desc = "Substitute in selection" })
vim.keymap.set("n", "<leader>S", ":%s///g<Left><Left><Left>", { desc = "Substitute in file" })