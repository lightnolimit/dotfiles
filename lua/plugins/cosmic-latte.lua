return {
  {
    "lightnolimit/cosmic-latte-theme-nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.opt.termguicolors = true
      -- Set default variant to light (Cosmic Latte)
      vim.g.cosmic_latte_variant = "light"
      -- Load the colorscheme
      vim.cmd("colorscheme cosmic-latte")
      
      -- Set cursor colors for better contrast in light theme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "cosmic-latte",
        callback = function()
          if vim.g.cosmic_latte_variant == "light" then
            -- Black cursor for light theme with white text
            vim.api.nvim_set_hl(0, "Cursor", { bg = "#000000", fg = "#ffffff" })
            vim.api.nvim_set_hl(0, "lCursor", { bg = "#000000", fg = "#ffffff" })
            vim.api.nvim_set_hl(0, "CursorIM", { bg = "#000000", fg = "#ffffff" })
            vim.api.nvim_set_hl(0, "TermCursor", { bg = "#000000", fg = "#ffffff" })
            -- Override guicursor to ensure our cursor colors are used
            vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,o:hor50-Cursor/lCursor"
          else
            -- White cursor for dim theme with black text
            vim.api.nvim_set_hl(0, "Cursor", { bg = "#ffffff", fg = "#000000" })
            vim.api.nvim_set_hl(0, "lCursor", { bg = "#ffffff", fg = "#000000" })
            vim.api.nvim_set_hl(0, "CursorIM", { bg = "#ffffff", fg = "#000000" })
          end
        end
      })
      
      -- Apply cursor colors immediately for current variant
      if vim.g.cosmic_latte_variant == "light" then
        vim.api.nvim_set_hl(0, "Cursor", { bg = "#000000", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "lCursor", { bg = "#000000", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "CursorIM", { bg = "#000000", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "TermCursor", { bg = "#000000", fg = "#ffffff" })
        -- Override guicursor to ensure our cursor colors are used
        vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,o:hor50-Cursor/lCursor"
      end
      
      -- Quick hotkeys for theme switching
      vim.keymap.set("n", "<leader>tl", function()
        vim.cmd("CosmicLatte")
        vim.notify("Switched to Light theme (Cosmic Latte)", vim.log.levels.INFO)
        -- Apply light theme cursor colors
        vim.api.nvim_set_hl(0, "Cursor", { bg = "#000000", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "lCursor", { bg = "#000000", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "CursorIM", { bg = "#000000", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "TermCursor", { bg = "#000000", fg = "#ffffff" })
        -- Override guicursor to ensure our cursor colors are used
        vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,o:hor50-Cursor/lCursor"
      end, { desc = "Switch to light theme" })
      
      vim.keymap.set("n", "<leader>td", function()
        vim.cmd("CosmicLatteDim") 
        vim.notify("Switched to Dim theme (Cosmic Mocha Latte)", vim.log.levels.INFO)
        -- Apply dim theme cursor colors
        vim.api.nvim_set_hl(0, "Cursor", { bg = "#ffffff", fg = "#000000" })
        vim.api.nvim_set_hl(0, "lCursor", { bg = "#ffffff", fg = "#000000" })
        vim.api.nvim_set_hl(0, "CursorIM", { bg = "#ffffff", fg = "#000000" })
      end, { desc = "Switch to dim theme" })
      
      vim.keymap.set("n", "<leader>tc", function()
        -- Toggle between light and dim
        if vim.g.colors_name == "cosmic-latte-dim" then
          vim.cmd("CosmicLatte")
          vim.notify("Switched to Light theme (Cosmic Latte)", vim.log.levels.INFO)
          -- Apply light theme cursor colors
          vim.api.nvim_set_hl(0, "Cursor", { bg = "#000000", fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "lCursor", { bg = "#000000", fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "CursorIM", { bg = "#000000", fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "TermCursor", { bg = "#000000", fg = "#ffffff" })
          -- Override guicursor to ensure our cursor colors are used
          vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,o:hor50-Cursor/lCursor"
        else
          vim.cmd("CosmicLatteDim")
          vim.notify("Switched to Dim theme (Cosmic Mocha Latte)", vim.log.levels.INFO)
          -- Apply dim theme cursor colors
          vim.api.nvim_set_hl(0, "Cursor", { bg = "#ffffff", fg = "#000000" })
          vim.api.nvim_set_hl(0, "lCursor", { bg = "#ffffff", fg = "#000000" })
          vim.api.nvim_set_hl(0, "CursorIM", { bg = "#ffffff", fg = "#000000" })
        end
      end, { desc = "Toggle between light/dim themes" })
    end,
  }
}