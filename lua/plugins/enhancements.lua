return {
  -- Better buffer deletion
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = function()
      require("mini.bufremove").setup()
      -- Keymaps
      vim.keymap.set("n", "<leader>bd", function() require("mini.bufremove").delete(0, false) end, { desc = "Delete buffer" })
      vim.keymap.set("n", "<leader>bD", function() require("mini.bufremove").delete(0, true) end, { desc = "Delete buffer (force)" })
    end,
  },
  
  -- Highlight word under cursor
  {
    "echasnovski/mini.cursorword",
    version = "*",
    config = function()
      require("mini.cursorword").setup({
        -- Delay (in ms) between when cursor moved and when highlighting appeared
        delay = 100,
      })
    end,
  },
  
  -- Show indent scope (commented out to disable indent lines)
  -- {
  --   "echasnovski/mini.indentscope",
  --   version = "*",
  --   config = function()
  --     require("mini.indentscope").setup({
  --       -- Draw options
  --       draw = {
  --         -- Delay (in ms) between event and start of drawing scope indicator
  --         delay = 100,
  --         
  --         -- Animation rule for scope's first drawing. A function which, given
  --         -- next and total step numbers, returns wait time (in ms). See
  --         -- |MiniIndentscope.gen_animation| for builtin options. To disable
  --         -- animation, use `require('mini.indentscope').gen_animation.none()`.
  --         animation = require("mini.indentscope").gen_animation.none(),
  --       },
  --       
  --       -- Module mappings. Use `''` (empty string) to disable one.
  --       mappings = {
  --         -- Textobjects
  --         object_scope = "",
  --         object_scope_with_border = "",
  --         
  --         -- Motions (jump to respective border line; if not present - body line)
  --         goto_top = "",
  --         goto_bottom = "",
  --       },
  --       
  --       -- Which character to use for drawing scope indicator
  --       symbol = "│",
  --     })
  --   end,
  -- },

  -- Flash.nvim for enhanced navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy", 
    opts = {
      search = {
        mode = "exact",
        incremental = false,
        max_length = false, -- Allow typing full words without flash exiting
        exclude = {
          "notify",
          "noice", 
          "cmp_menu",
          "flash_prompt",
          "NvimTree",
        },
      },
      jump = {
        jumplist = true,
        pos = "start",
        history = true,
        register = false,
        nohlsearch = false,
        autojump = false,
      },
      label = {
        uppercase = true,
        exclude = "",
        current = true,
        after = true,
        before = false,
        style = "overlay",
        reuse = "lowercase",
        distance = true,
        min_pattern_length = 0,
      },
      highlight = {
        backdrop = true,
        matches = true,
        priority = 5000,
        groups = {
          match = "FlashMatch",
          current = "FlashCurrent", 
          backdrop = "FlashBackdrop",
          label = "FlashLabel",
        },
      },
      modes = {
        search = {
          enabled = true,
        },
        char = {
          enabled = true,
          jump_labels = true,
          multi_line = true,
          label = { exclude = "hjkl" },
          keys = { "f", "F", "t", "T", ";", "," },
        },
        treesitter = {
          labels = "abcdefghijklmnopqrstuvwxyz",
          jump = { pos = "range" },
          label = { before = true, after = true, style = "inline" },
        },
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)
      
      -- Disable flash in nvim-tree 
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        callback = function()
          vim.keymap.set("n", "s", function()
            local api = require("nvim-tree.api")
            api.node.run.system()
          end, { buffer = true, desc = "System Open" })
        end,
      })
    end,
    keys = {
      { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- Image clipboard functionality
  {
    "hakonharnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = true,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = false,
      },
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
        },
      },
    },
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
    },
  },

  -- Multiline editing made easy
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Select Cursor Down"] = "<M-C-Down>",
        ["Select Cursor Up"] = "<M-C-Up>",
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-Up>",
        ["Add Cursor At Pos"] = "<C-x>",
        ["Visual Cursors"] = "<C-n>",
        ["Skip Region"] = "<C-x>",
        ["Remove Region"] = "<C-q>",
      }
      vim.g.VM_mouse_mappings = 1
      vim.g.VM_highlight_matches = "underline"
    end,
  },
  
}