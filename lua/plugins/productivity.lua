return {
  -- Terminal management
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]], -- Ctrl+\ to toggle
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float", -- "vertical" | "horizontal" | "tab" | "float"
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
      
      -- Additional keymaps
      vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle terminal" })
      vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
      vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })
      vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Floating terminal" })
      
      -- Multiple terminals with IDs
      vim.keymap.set("n", "<leader>t1", ":1ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal 1" })
      vim.keymap.set("n", "<leader>t2", ":2ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal 2" })
      vim.keymap.set("n", "<leader>t3", ":3ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal 3" })
      vim.keymap.set("n", "<leader>t4", ":4ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal 4" })
      
      -- Navigate between terminals
      vim.keymap.set("n", "<leader>tn", function()
        local terms = require("toggleterm.terminal").get_all()
        if #terms == 0 then return end
        
        local current_id = vim.b.toggle_number or 0
        local next_id = current_id % #terms + 1
        vim.cmd(next_id .. "ToggleTerm")
      end, { desc = "Next terminal" })
      
      vim.keymap.set("n", "<leader>tp", function()
        local terms = require("toggleterm.terminal").get_all()
        if #terms == 0 then return end
        
        local current_id = vim.b.toggle_number or 0
        local prev_id = current_id > 1 and current_id - 1 or #terms
        vim.cmd(prev_id .. "ToggleTerm")
      end, { desc = "Previous terminal" })
      
      -- Show all terminals
      vim.keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<CR>", { desc = "Toggle all terminals" })
      
      -- Kill/close terminal
      vim.keymap.set("n", "<leader>tk", function()
        local ok, _ = pcall(vim.cmd, "TermExec cmd='exit'")
        if not ok then
          -- If no terminal is open or TermExec fails, try to close the current buffer if it's a terminal
          if vim.bo.buftype == "terminal" then
            vim.cmd("bdelete!")
          end
        end
      end, { desc = "Kill/close terminal" })
      
      -- Terminal mode escape
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
      vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], { desc = "Close terminal" })
    end,
  },
  
  -- Better diagnostics list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        position = "bottom",
        height = 10,
        width = 50,
        icons = true,
        mode = "workspace_diagnostics",
        severity = nil,
        fold_open = "",
        fold_closed = "",
        group = true,
        padding = true,
        cycle_results = true,
        action_keys = {
          close = "q",
          cancel = "<esc>",
          refresh = "r",
          jump = { "<cr>", "<tab>" },
          open_split = { "<c-x>" },
          open_vsplit = { "<c-v>" },
          open_tab = { "<c-t>" },
          jump_close = { "o" },
          toggle_mode = "m",
          switch_severity = "s",
          toggle_preview = "P",
          hover = "K",
          preview = "p",
          close_folds = { "zM", "zm" },
          open_folds = { "zR", "zr" },
          toggle_fold = { "zA", "za" },
          previous = "k",
          next = "j"
        },
        multiline = true,
        indent_lines = true,
        win_config = { border = "single" },
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { "lsp_definitions" },
        include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
        signs = {
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "",
        },
        use_diagnostic_signs = false
      })
      
      -- Keymaps
      vim.keymap.set("n", "<leader>xx", ":Trouble<CR>", { desc = "Toggle Trouble" })
      vim.keymap.set("n", "<leader>xw", ":Trouble workspace_diagnostics<CR>", { desc = "Workspace diagnostics" })
      vim.keymap.set("n", "<leader>xd", ":Trouble document_diagnostics<CR>", { desc = "Document diagnostics" })
      vim.keymap.set("n", "<leader>xl", ":Trouble loclist<CR>", { desc = "Location list" })
      vim.keymap.set("n", "<leader>xq", ":Trouble quickfix<CR>", { desc = "Quickfix list" })
      vim.keymap.set("n", "gR", ":Trouble lsp_references<CR>", { desc = "LSP references" })
    end,
  },
  
  -- Quick file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      
      -- Keymaps
      vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
      vim.keymap.set("n", "<leader>H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle harpoon menu" })
      
      -- Quick access to files with Ctrl+number
      vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
      vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
      vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
      vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
      vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end, { desc = "Harpoon file 5" })
      vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end, { desc = "Harpoon file 6" })
      vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end, { desc = "Harpoon file 7" })
      vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end, { desc = "Harpoon file 8" })
      vim.keymap.set("n", "<C-9>", function() harpoon:list():select(9) end, { desc = "Harpoon file 9" })
      
      -- Navigate between files
      vim.keymap.set("n", "[h", function() harpoon:list():prev() end, { desc = "Previous harpoon file" })
      vim.keymap.set("n", "]h", function() harpoon:list():next() end, { desc = "Next harpoon file" })
    end,
  },
}