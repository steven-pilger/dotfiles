require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "html", "css", "python", "javascript", "tsx", "svelte" },
  highlight = { enable = true },
  indent = { enable = true },
})

require('treesitter-context').setup({ enable = true })
