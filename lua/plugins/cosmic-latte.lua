return {
  {
    "lightnolimit/cosmic-latte-theme-nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.opt.termguicolors = true
      -- Set default variant to dim (Cosmic Mocha Latte)
      vim.g.cosmic_latte_variant = "dim"
      -- Load the colorscheme
      vim.cmd("colorscheme cosmic-latte")
      
      -- Quick hotkeys for theme switching
      vim.keymap.set("n", "<leader>tl", function()
        vim.cmd("CosmicLatteLight")
        vim.notify("Switched to Light theme", vim.log.levels.INFO)
      end, { desc = "Switch to light theme" })
      
      vim.keymap.set("n", "<leader>td", function()
        vim.cmd("CosmicLatteDim") 
        vim.notify("Switched to Dim theme (Cosmic Mocha Latte)", vim.log.levels.INFO)
      end, { desc = "Switch to dim theme" })
      
      vim.keymap.set("n", "<leader>tc", function()
        -- Toggle between light and dim
        if vim.g.colors_name == "cosmic-latte-dim" then
          vim.cmd("CosmicLatteLight")
          vim.notify("Switched to Light theme", vim.log.levels.INFO)
        else
          vim.cmd("CosmicLatteDim")
          vim.notify("Switched to Dim theme (Cosmic Mocha Latte)", vim.log.levels.INFO)
        end
      end, { desc = "Toggle between light/dim themes" })
    end,
  }
}