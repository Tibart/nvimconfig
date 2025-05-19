return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      --"nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      --"theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text'
    },
    event = "VeryLazy",
    config = function()

      local dap, dapui = require('dap'), require('dapui')
      dapui.setup({
        -- Customize UI lauout
        layout = {{
          elements = {
            { id = "breakpoint", size = 0.50 }
          }
        }},
      })

      require("nvim-dap-virtual-text").setup()
      require("mason-nvim-dap").setup()

      -- Auto open/close UI
      dap.listeners.after.event_initialized.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg='#ff0000' })
      vim.fn.sign_define('DapBreakpoint', { text='' , texthl='DapBreakpoint' })

      vim.api.nvim_set_hl(0, 'DapStopped', { fg='#ffe500' })
      vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped' })

      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })

    end
  }
}
