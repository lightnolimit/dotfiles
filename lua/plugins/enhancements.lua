return {
  -- Extended text objects
  {
    "echasnovski/mini.ai",
    version = "*",
    config = function()
      require("mini.ai").setup({
        -- Table with textobject id as fields, textobject specification as values.
        custom_textobjects = nil,
        
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Main textobject prefixes
          around = "a",
          inside = "i",
          
          -- Next/last variants
          around_next = "an",
          inside_next = "in",
          around_last = "al",
          inside_last = "il",
          
          -- Move cursor to corresponding edge of `a` textobject
          goto_left = "g[",
          goto_right = "g]",
        },
        
        -- Number of lines within which textobject is searched
        n_lines = 50,
        
        -- How to search for object (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'prev', 'nearest'.
        search_method = "cover_or_next",
      })
    end,
  },
  
  -- Better navigation with [ and ]
  {
    "echasnovski/mini.bracketed",
    version = "*",
    config = function()
      require("mini.bracketed").setup({
        -- First-level elements are tables describing behavior of a target:
        -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
        -- - <options> - table overriding target options.
        buffer = { suffix = "b", options = {} },
        comment = { suffix = "c", options = {} },
        conflict = { suffix = "x", options = {} },
        diagnostic = { suffix = "d", options = {} },
        file = { suffix = "f", options = {} },
        indent = { suffix = "i", options = {} },
        jump = { suffix = "j", options = {} },
        location = { suffix = "l", options = {} },
        oldfile = { suffix = "o", options = {} },
        quickfix = { suffix = "q", options = {} },
        treesitter = { suffix = "t", options = {} },
        undo = { suffix = "u", options = {} },
        window = { suffix = "w", options = {} },
        yank = { suffix = "y", options = {} },
      })
    end,
  },
  
  -- Move lines and selections
  {
    "echasnovski/mini.move",
    version = "*",
    config = function()
      require("mini.move").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = "<M-h>",
          right = "<M-l>",
          down = "<M-j>",
          up = "<M-k>",
          
          -- Move current line in Normal mode
          line_left = "<M-h>",
          line_right = "<M-l>",
          line_down = "<M-j>",
          line_up = "<M-k>",
        },
        
        -- Options which control moving behavior
        options = {
          -- Automatically reindent selection during linewise vertical move
          reindent_linewise = true,
        },
      })
    end,
  },
  
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
  
  -- Show indent scope
  {
    "echasnovski/mini.indentscope",
    version = "*",
    config = function()
      require("mini.indentscope").setup({
        -- Draw options
        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          delay = 100,
          
          -- Animation rule for scope's first drawing. A function which, given
          -- next and total step numbers, returns wait time (in ms). See
          -- |MiniIndentscope.gen_animation| for builtin options. To disable
          -- animation, use `require('mini.indentscope').gen_animation.none()`.
          animation = require("mini.indentscope").gen_animation.none(),
        },
        
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Textobjects
          object_scope = "ii",
          object_scope_with_border = "ai",
          
          -- Motions (jump to respective border line; if not present - body line)
          goto_top = "[i",
          goto_bottom = "]i",
        },
        
        -- Which character to use for drawing scope indicator
        symbol = "│",
      })
    end,
  },
  
  -- Align text
  {
    "echasnovski/mini.align",
    version = "*",
    config = function()
      require("mini.align").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          start = "ga",
          start_with_preview = "gA",
        },
        
        -- Modifiers changing alignment steps and/or options
        modifiers = {
          -- Main option modifiers
          ["s"] = function(steps, opts)
            opts.split_pattern = " "
            table.insert(steps.pre_split, "merge_delimiter")
          end,
          ["="] = function(steps, opts)
            opts.split_pattern = "="
            table.insert(steps.pre_split, "merge_delimiter")
          end,
          [":"] = function(steps, opts)
            opts.split_pattern = ":"
            table.insert(steps.pre_split, "merge_delimiter")
          end,
          [","] = function(steps, opts)
            opts.split_pattern = ","
            table.insert(steps.pre_split, "merge_delimiter")
          end,
          ["|"] = function(steps, opts)
            opts.split_pattern = "|"
            table.insert(steps.pre_split, "merge_delimiter")
          end,
        },
      })
    end,
  },
  
  -- Jump anywhere on screen
  {
    "echasnovski/mini.jump2d",
    version = "*",
    config = function()
      require("mini.jump2d").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          start_jumping = "<leader>j",
        },
      })
    end,
  },
}