return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          -- Hide clutter files from all telescope searches
          file_ignore_patterns = {
            "node_modules/.*",
            "%.git/.*",
            "%.DS_Store",
            "dist/.*",
            "build/.*",
            "target/.*",
            "%.o",
            "%.a",
            "%.out",
            "%.class",
            "%.pdf",
            "%.mkv",
            "%.mp4",
            "%.zip",
            "%.tar",
            "%.tar%.gz",
            "%.rar",
            "%.7z",
          },
          layout_config = {
            horizontal = {
              preview_width = 0.55,
            },
          },
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              ["n"] = {
                ["h"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
                ["l"] = require("telescope._extensions.file_browser.actions").change_cwd,
              },
            },
            -- Clean file browser settings
            hidden = { file_browser = false, folder_browser = false },
            respect_gitignore = true,
            grouped = true,
            files = true,
            add_dirs = true,
            depth = 1,
            auto_depth = false,
            select_buffer = false,
            hidden_files = false,
            follow_symlinks = false,
            -- Show directories first, then files
            dir_icon = " ",
            dir_icon_hl = "Default",
            display_stat = { date = false, size = false, mode = false },
            use_fd = true,
            git_status = false,
          }
        }
      })
      
      require("telescope").load_extension("file_browser")
      
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      
      -- Clean file browser keymaps
      vim.keymap.set("n", "<leader>fe", function()
        require("telescope").extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = vim.fn.getcwd(),
          respect_gitignore = true,
          hidden = false,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 0.8 }
        })
      end, { desc = "File browser (current dir)" })
      
      -- Root directory browser
      vim.keymap.set("n", "<leader>fE", function()
        require("telescope").extensions.file_browser.file_browser({
          cwd = vim.fn.getcwd(),
          respect_gitignore = true,
          hidden = false,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 0.8 }
        })
      end, { desc = "File browser (project root)" })
      
      -- Quick file browser access - starts from current working directory
      vim.keymap.set("n", "<leader>b", function()
        require("telescope").extensions.file_browser.file_browser({
          cwd = vim.fn.getcwd(),
          respect_gitignore = true,
          hidden = false,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 0.8 }
        })
      end, { desc = "Quick file browser" })
    end,
  },
}