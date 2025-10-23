require('gitsigns').setup()
require('neogit').setup({ disable_hint = true, disable_context_highlighting = true })
vim.keymap.set("", "<leader>ng", "<cmd>Neogit kind=replace<CR>", { remap = false })
