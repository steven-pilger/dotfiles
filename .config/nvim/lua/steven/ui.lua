require("catppuccin").setup({
  integrations = {
    barbar = true,
    mason = true,
    lsp_trouble = true,
    dap = { enabled = true, enable_ui = true },
  }
})

local hr = tonumber(os.date("%H"))
vim.g.airline_theme = "catppuccin"
if hr >= 17 then
  vim.cmd.colorscheme("catppuccin-frappe")
elseif hr >= 8 then
  vim.cmd.colorscheme("catppuccin-latte")
else
  vim.cmd.colorscheme("catppuccin-frappe")
end

vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "NONE" })
