vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.nf",
  callback = function() vim.bo.filetype = "groovy" end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set({ "n", "v" }, "gca", require("actions-preview").code_actions, opts)
    vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format({ async = true }) end, opts)
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("FloatBufEnter", {}),
  pattern = "*",
  callback = function()
    local buftype = vim.bo.buftype
    local is_floating = vim.api.nvim_win_get_config(0).relative ~= ""
    if is_floating or buftype == "prompt" or buftype == "nofile" or buftype == "popup" then
      vim.opt_local.completeopt = { "menu", "menuone", "noselect" }
      vim.opt_local.complete = ""
      pcall(vim.cmd, "LlamaDisable")
    else
      vim.opt_local.completeopt = { "menu", "menuone", "noselect", "noinsert" }
      vim.opt_local.complete = ".,w,b,u,t,i"
      pcall(vim.cmd, "LlamaEnable")
    end
  end,
})
