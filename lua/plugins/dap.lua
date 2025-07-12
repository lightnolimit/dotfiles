return {
  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      
      -- Mason DAP setup
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "js", -- JavaScript/TypeScript debugger
        },
        automatic_installation = true,
      })
      
      -- DAP UI setup
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            position = "bottom",
            size = 10,
          },
        },
      })
      
      -- Virtual text setup
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = '<module',
        virt_text_pos = 'eol',
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil
      })
      
      -- Auto-open DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      
      -- JavaScript/TypeScript/React configuration
      local mason_registry = require("mason-registry")
      local js_debug_adapter
      if mason_registry.is_installed("js") then
        js_debug_adapter = mason_registry.get_package("js"):get_install_path()
      end
      
      if js_debug_adapter then
        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              js_debug_adapter .. "/js-debug-adapter",
              "${port}",
            },
          },
        }
        
        -- Chrome/Edge debugging for React
        dap.adapters["pwa-chrome"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              js_debug_adapter .. "/js-debug-adapter",
              "${port}",
            },
          },
        }
      end
      
      -- Configurations for JavaScript/TypeScript
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          -- Debug Node.js applications
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Node.js Program",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          -- Debug Node.js applications with npm scripts
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch via npm",
            runtimeExecutable = "npm",
            runtimeArgs = {
              "run-script",
              "dev", -- Change this to your npm script
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
          -- Attach to running Node.js process
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Node.js",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          -- Debug React applications in Chrome
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch React App (Chrome)",
            url = "http://localhost:3000", -- Default React dev server
            webRoot = "${workspaceFolder}/src",
            userDataDir = false,
          },
          -- Attach to running Chrome instance
          {
            type = "pwa-chrome",
            request = "attach",
            name = "Attach to Chrome",
            port = 9222,
            webRoot = "${workspaceFolder}",
          },
        }
      end
      
      -- Keymaps
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Set conditional breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue debugging" })
      vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
      vim.keymap.set("n", "<leader>dg", dap.goto_, { desc = "Go to line (no execute)" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
      vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Down" })
      vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Up" })
      vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
      vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
      vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "Pause" })
      vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
      vim.keymap.set("n", "<leader>ds", dap.session, { desc = "Session" })
      vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
      vim.keymap.set("n", "<leader>dw", require("dap.ui.widgets").hover, { desc = "Widgets" })
      
      -- DAP UI keymaps
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
      vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Evaluate expression" })
      
      -- Visual mode evaluate
      vim.keymap.set("v", "<leader>de", dapui.eval, { desc = "Evaluate selection" })
    end,
  },
}