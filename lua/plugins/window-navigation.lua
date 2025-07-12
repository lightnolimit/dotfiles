-- Window navigation keymaps - not a plugin, just keymaps
-- Ctrl+W for cycling through windows (next window)
vim.keymap.set("n", "<C-w>", "<C-w>w", { desc = "Cycle to next window" })

-- Ctrl+H/J/K/L for directional window navigation  
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Additional useful window commands
vim.keymap.set("n", "<C-w>|", "<C-w>|", { desc = "Maximize window width" })
vim.keymap.set("n", "<C-w>_", "<C-w>_", { desc = "Maximize window height" })
vim.keymap.set("n", "<C-w>=", "<C-w>=", { desc = "Equalize window sizes" })

-- Return empty table since this file doesn't define a plugin
return {}