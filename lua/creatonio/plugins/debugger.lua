return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dapgo = require("dap-go")

    dapgo.setup()
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      -- dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      -- dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>dt", dapui.toggle, { desc = "[D]ebugger [T]oggle" })
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebugger [B]reakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "[D]ebugger [C]ontinue" })
    vim.keymap.set("n", "<Leader>dgt", dapgo.debug_test, { desc = "[D]ebugger [G]o [T]est" })
    vim.keymap.set("n", "<Leader>dgl", dapgo.debug_last_test, { desc = "[D]ebugger [Go] [L]ast Test" })
    vim.keymap.set("n", "<Leader>dx", dap.close, { desc = "[D]ebugger e[X]it" })
    vim.keymap.set("n", "<Leader>ds", dap.step_over, { desc = "[D]ebugger [S]tep over" })
    vim.keymap.set("n", "<Leader>dsi", dap.step_into, { desc = "[D]ebugger [S]tep [I]n" })

    -- Set breakpoint coler to red
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#ffffff", bg = "#48b569" })
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "•", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define("DapStopped", { texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
  end,
}
