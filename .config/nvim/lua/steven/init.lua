-- steven/init.lua scaffold

-- Set leaders early
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Core options
pcall(require, "steven.options")

-- Plugins (native vim.pack)
local ok, plugins = pcall(require, "steven.plugins")
if ok and type(plugins) == "table" and type(plugins.setup) == "function" then
  plugins.setup()
end

-- Load remaining modules safely
local modules = {
  "steven.keymaps",
  "steven.autocmds",
  "steven.ui",
  "steven.treesitter",
  "steven.telescope",
  "steven.git",
  "steven.trouble",
  "steven.aerial",
  "steven.indent",
  "steven.illuminate",
  "steven.comment",
  "steven.cmp",
  "steven.lsp",
  "steven.dap",
  "steven.neozoom",
  "steven.zenmode",
  "steven.fzf",
  "steven.testing",
  "steven.ai",
  "steven.which-key",
}

for _, m in ipairs(modules) do
  pcall(require, m)
end
