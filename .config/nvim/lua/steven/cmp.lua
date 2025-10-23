local cmp = require('cmp')
local lspkind = require('lspkind')
require('fidget').setup()

cmp.setup({
  formatting = { format = lspkind.cmp_format({ maxwidth = 50, with_text = false }) },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ['<Tab>'] = function(fallback) if cmp.visible() then cmp.select_next_item() else fallback() end end,
    ['<S-Tab>'] = function(fallback) if cmp.visible() then cmp.select_prev_item() else fallback() end end,
  },
  sources = cmp.config.sources({ { name = 'nvim_lsp' } }, { { name = 'buffer' } }),
})

cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
cmp.setup.cmdline(':', { sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }) })
