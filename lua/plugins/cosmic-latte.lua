return {
  {
    "cosmic-latte.nvim",
    dir = vim.fn.stdpath("config") .. "/cosmic-latte.nvim",
    name = "cosmic-latte",
    priority = 1000,
    lazy = false,
    config = function()
      vim.opt.termguicolors = true
      -- Default to dim theme, use :colorscheme cosmic-latte for light version
      vim.cmd("colorscheme cosmic-latte-dim")
      
      -- Add commands to switch between themes
      vim.api.nvim_create_user_command("CosmicLatteDim", function()
        vim.cmd("colorscheme cosmic-latte-dim")
      end, { desc = "Switch to Cosmic Latte Dim theme" })
      
      vim.api.nvim_create_user_command("CosmicLatteLight", function()
        vim.cmd("colorscheme cosmic-latte")
      end, { desc = "Switch to Cosmic Latte Light theme" })
      
      -- Quick hotkeys for theme switching
      vim.keymap.set("n", "<leader>tl", function()
        vim.cmd("colorscheme cosmic-latte")
        vim.notify("Switched to Light theme", vim.log.levels.INFO)
      end, { desc = "Switch to light theme" })
      
      vim.keymap.set("n", "<leader>td", function()
        vim.cmd("colorscheme cosmic-latte-dim") 
        vim.notify("Switched to Dim theme", vim.log.levels.INFO)
      end, { desc = "Switch to dim theme" })
      
      vim.keymap.set("n", "<leader>tc", function()
        -- Toggle between light and dim
        if vim.g.colors_name == "cosmic-latte-dim" then
          vim.cmd("colorscheme cosmic-latte")
          vim.notify("Switched to Light theme", vim.log.levels.INFO)
        else
          vim.cmd("colorscheme cosmic-latte-dim")
          vim.notify("Switched to Dim theme", vim.log.levels.INFO)
        end
      end, { desc = "Toggle between light/dim themes" })
    end,
  }
}