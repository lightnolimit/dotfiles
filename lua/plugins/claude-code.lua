return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        split_ratio = 0.4,      -- 40% width for sidebar
        position = "botright",  -- Changed back to botright to avoid modifiable error
        enter_insert = true,    -- Enter insert mode when opening
        
        float = {
          width = "80%",        -- Floating window width
          height = "80%",       -- Floating window height
          border = "rounded"    -- Floating window border style
        },
      },
      refresh = {
        enable = true,          -- File change detection
        updatetime = 100,       -- Update interval
      },
      keymaps = {
        toggle = {
          normal = "<C-,>",     -- Default toggle key
          terminal = "<C-,>",   -- Terminal mode toggle key
        }
      }
    })
    
    -- Additional keymaps
    vim.keymap.set("n", "<leader>cc", ":ClaudeCode<CR>", { desc = "Toggle Claude Code" })
    vim.keymap.set("n", "<leader>cC", ":ClaudeCodeContinue<CR>", { desc = "Continue Claude conversation" })
    vim.keymap.set("n", "<leader>cV", ":ClaudeCodeVerbose<CR>", { desc = "Claude Code verbose" })
    
    -- Dedicated sidebar keymap - create a vertical split manually
    vim.keymap.set("n", "<leader>cs", function()
      -- Create a 40% width vertical split on the right
      vim.cmd("vertical rightbelow split")
      vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.4))
      -- Open terminal in the new split
      vim.cmd("terminal claude")
      -- Set buffer options to make it modifiable
      vim.bo.modifiable = true
      vim.bo.readonly = false
      -- Enter insert mode
      vim.cmd("startinsert")
    end, { desc = "Claude Code sidebar (right)" })
  end,
}