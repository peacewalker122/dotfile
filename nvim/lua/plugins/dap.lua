return {
  {
    "leoluz/nvim-dap-go",
    config = true,
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dc", "<cmd> DapContinue <cr>", desc = "Start Or Continue Debugger" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
