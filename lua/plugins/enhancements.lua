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
  
}