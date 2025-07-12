return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                                              ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠤⠖⠋⠉⠉⠉⠉⠙⠓⠶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡞⠉⠀⠀⠀⠀⣠⡤⠤⠤⣤⣄⠀⠈⠻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⣠⠎⠁⠀⠀⠀⠀⠈⠙⢦⡀⠘⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⢰⠇⠀⠀⠀⠀⠀⠀⣀⡀⢄⣙⢦⡈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⠀⡿⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠈⢳⠸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⢠⠀⠀⢰⡧⠊⠉⠀⠀⠀⠀⠀⣠⣾⣛⡷⢦⢸⡄⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⣿⠀⠀⢸⠁⣠⣴⣦⡀⠀⠀⠀⠉⣿⣹⣧⠀⢸⠇⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀⣿⠀⠀⢸⣾⠋⣿⢿⣧⠀⠀⠀⠀⠻⠧⠿⠀⠘⣷⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⢹⠀⠀⢸⣇⠀⢿⣿⣻⠇⠀⠀⠀⠀⠀⠀⠀⠀⣸⠂⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⢸⡀⠀⢸⣿⡆⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠋⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠄⠸⡇⠀⠈⡟⣷⣀⠀⠀⠀⠀⠀⠈⢀⣠⠴⢺⡇⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⣷⠀⠀⣷⠀⠉⠛⠒⠒⠒⣺⠿⠛⣷⢀⣸⡇⠀⣸⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠸⣇⠀⢸⡏⠉⠉⠹⡟⠚⠋⠀⠀⠉⠉⣿⠃⣠⠏⠹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢻⣆⠀⢻⣄⠀⠀⢿⠀⠀⠀⠀⠀⠒⠗⣎⠁⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠈⣟⠳⣄⣙⣷⠶⣾⡀⠀⠀⠀⠀⠀⠀⠘⣶⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⢸⡄⠀⠀⢿⡀⠀⠀⠀⠀⠹⡇⠀⠀⠀⢦⠀⠀⠀⠹⣦⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣼⣟⣦⡀⠉⣷⡀⠀⠀⠀⠀⢿⠀⠀⠀⠈⢷⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⠀⢸⣧⠀⠀⠀⠀⠘⣧⠀⠀⠀⢸⡄⠀⣰⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠾⣏⣀⣸⠘⣧⡀⠀⠀⠀⣿⣷⣄⣀⣼⣁⣴⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣼⠀⠸⣷⠀⠀⠀⠸⡿⠿⠛⠛⣻⠛⠉⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠖⠋⠉⠉⠉⠀⠀⠀⠀⠘⣧⠀⠀⠀⠹⡄⠀⣴⠿⣇⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣆⠀⠀⠀⢻⡾⠃⠀⣿⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⡄⠀⠀⠀⣿⠉⠉⢹⡆⠀⠀⢹⡦⠤⣄⡀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⣸⠋⠁⠀⠉⠙⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⣿⡀⠀⠀⢸⡄⠀⠀⣷⠀⠀⠸⡇⠀⠀⠙⢢⣄⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⠛⠓⠒⠒⠶⠤⣄⣀⣀⣠⣴⠏⢷⡀⠀⠀⢷⠀⠀⠸⣆⠀⠀⣷⠀⠀⠀⠀⠹⡆⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢥⣀⠈⢷⡀⠀⠸⡆⠀⠀⠻⡆⠀⢹⠀⠀⠀⠀⢠⡟⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⢀⡴⠖⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⡌⢷⡀⠀⢻⡄⠀⠀⢻⠀⠸⢧⣀⠀⣠⡿⠁⠀⠀          ",
      "          ⠀⠀⣀⣠⠴⠋⠀⠀⠀⠘⢷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡶⢷⠀⠀⠻⣶⠶⢾⡄⠀⢀⣈⠙⠿⠷⢖⣦⣄          ",
      "          ⣠⡾⠉⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⢸⡆⠀⠀⣙⢧⡈⠛⠒⠒⠻⠽⠟⠉⠉⠉⠀          ",
      "          ⢿⣞⡤⠴⠖⠚⠛⠛⠛⠛⠓⠢⠤⢄⣉⠛⠓⠦⠤⢤⣄⣀⣀⣀⣀⡀⠀⠀⣾⠃⡼⡥⡤⣠⠸⡷⠽⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠒⠶⠤⣤⣀⣈⣉⣁⣀⣤⠞⠁⢮⣺⣼⣱⢻⣇⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⢀⡉⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
      "                                                                              ",
      "                             Light Without Limit                              ",
      "                                                                              ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "󰙅  File tree", ":NvimTreeToggle <CR>"),
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("s", "󰊄  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "󰒓  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("w", "󰌌  Keymaps", ":e ~/.config/nvim/KEYMAPS.md <CR>"),
      dashboard.button("p", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("m", "󱌣  Mason", ":Mason<CR>"),
      dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
    }

    -- Set footer
    local function footer()
      local total_plugins = #vim.tbl_keys(require("lazy").plugins())
      local datetime = os.date("  %d-%m-%Y   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

      return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}