require("mason-nvim-dap").setup({ ensure_installed = { "python", "js", "firefox" } })

local dap, dapui = require("dap"), require("dapui")

require('dap-python').setup(vim.fn.expand("$HOME/.pyenv/versions/3.10.13/bin/python"))
dapui.setup()
require('dap.ext.vscode').load_launchjs()

vim.fn.sign_define('DapBreakpointCondition', { text ='⬤ ', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapBreakpoint', { text ='⬤ ', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped', { text ='⮕ ', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<leader>d', function() vim.cmd('colorscheme catppuccin'); dapui.toggle({ reset = true }) end)
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F6>', dap.restart)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({ reset = true }) end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
