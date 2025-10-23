-- stp/plugins.lua (placeholder)
-- Will use vim.pack.add(specs, { load = true, confirm = false }) with Git URLs.

-- Install mini.nvim: https://nvim-mini.org/mini.nvim
-- local path_package = vim.fn.stdpath('data') .. '/site'
-- local mini_path = path_package .. '/pack/deps/start/mini.nvim'
-- if not vim.loop.fs_stat(mini_path) then
--   vim.cmd('echo "Installing `mini.nvim`" | redraw')
--   local clone_cmd = {
--     'git', 'clone', '--filter=blob:none',
--     -- Uncomment next line to use 'stable' branch
--     -- '--branch', 'stable',
--     'https://github.com/nvim-mini/mini.nvim', mini_path
--   }
--   vim.fn.system(clone_cmd)
--   vim.cmd('packadd mini.nvim | helptags ALL')
--   vim.cmd('echo "Installed `mini.nvim`" | redraw')
-- end

local M = {}
local site = vim.fn.stdpath('data') .. '/site'
if not vim.tbl_contains(vim.opt.packpath:get(), site) then
  vim.opt.packpath:append(site)
end

function M.setup()
  local specs = {
    'https://github.com/tpope/vim-eunuch',
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/tpope/vim-surround',
    'https://github.com/andymass/vim-matchup',
    'https://github.com/jiangmiao/auto-pairs',
    'https://github.com/tpope/vim-sleuth',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/tpope/vim-dispatch',
    { src = 'https://github.com/NeogitOrg/neogit', name = 'neogit' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim', name = 'gitsigns.nvim' },
    { src = 'https://github.com/folke/trouble.nvim', name = 'trouble.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons', name = 'nvim-web-devicons' },
    { src = 'https://github.com/nvim-lua/plenary.nvim', name = 'plenary.nvim' },
    { src = 'https://github.com/iamcco/markdown-preview.nvim', name = 'markdown-preview.nvim' },
    { src = 'https://github.com/vifm/vifm.vim', name = 'vifm.vim' },
    { src = 'https://github.com/nyngwang/NeoZoom.lua', name = 'NeoZoom.lua' },
    { src = 'https://github.com/numToStr/Comment.nvim', name = 'Comment.nvim' },
    { src = 'https://github.com/lervag/vimtex', name = 'vimtex' },
    { src = 'https://github.com/vim-pandoc/vim-pandoc', name = 'vim-pandoc' },
    { src = 'https://github.com/vim-pandoc/vim-pandoc-syntax', name = 'vim-pandoc-syntax' },
    { src = 'https://github.com/vim-pandoc/vim-rmarkdown', name = 'vim-rmarkdown' },
    { src = 'https://github.com/rhysd/vim-grammarous', name = 'vim-grammarous' },
    { src = 'https://github.com/mattn/emmet-vim', name = 'emmet-vim' },
    { src = 'https://github.com/ap/vim-css-color', name = 'vim-css-color' },
    { src = 'https://github.com/williamboman/mason.nvim', name = 'mason.nvim' },
    { src = 'https://github.com/williamboman/mason-lspconfig.nvim', name = 'mason-lspconfig.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig', name = 'nvim-lspconfig' },
    { src = 'https://github.com/j-hui/fidget.nvim', name = 'fidget.nvim' },
    { src = 'https://github.com/hrsh7th/nvim-cmp', name = 'nvim-cmp' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp', name = 'cmp-nvim-lsp' },
    { src = 'https://github.com/hrsh7th/cmp-buffer', name = 'cmp-buffer' },
    { src = 'https://github.com/hrsh7th/cmp-path', name = 'cmp-path' },
    { src = 'https://github.com/hrsh7th/cmp-cmdline', name = 'cmp-cmdline' },
    { src = 'https://github.com/onsails/lspkind-nvim', name = 'lspkind-nvim' },
    { src = 'https://github.com/huggingface/llm.nvim', name = 'llm.nvim' },
    { src = 'https://github.com/gsuuon/model.nvim', name = 'model.nvim' },
    { src = 'https://github.com/ggml-org/llama.vim', name = 'llama.vim' },
    { src = 'https://github.com/aznhe21/actions-preview.nvim', name = 'actions-preview.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim', name = 'telescope.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', name = 'telescope-fzf-native.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope-live-grep-args.nvim', name = 'telescope-live-grep-args.nvim' },
    { src = 'https://github.com/neanias/telescope-lines.nvim', name = 'telescope-lines.nvim' },
    { src = 'https://github.com/stevearc/aerial.nvim', name = 'aerial.nvim' },
    { src = 'https://github.com/mfussenegger/nvim-dap', name = 'nvim-dap' },
    { src = 'https://github.com/mfussenegger/nvim-dap-python', name = 'nvim-dap-python' },
    { src = 'https://github.com/jay-babu/mason-nvim-dap.nvim', name = 'mason-nvim-dap.nvim' },
    { src = 'https://github.com/rcarriga/nvim-dap-ui', name = 'nvim-dap-ui' },
    { src = 'https://github.com/nvim-neotest/nvim-nio', name = 'nvim-nio' },
    { src = 'https://github.com/vim-test/vim-test', name = 'vim-test' },
    { src = 'https://github.com/preservim/vimux', name = 'vimux' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', name = 'nvim-treesitter' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context', name = 'nvim-treesitter-context' },
    { src = 'https://github.com/vim-airline/vim-airline', name = 'vim-airline' },
    { src = 'https://github.com/chriskempson/base16-vim', name = 'base16-vim' },
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
    { src = 'https://github.com/ryanoasis/vim-devicons', name = 'vim-devicons' },
    { src = 'https://github.com/luochen1990/rainbow', name = 'rainbow' },
    { src = 'https://github.com/folke/zen-mode.nvim', name = 'zen-mode.nvim' },
    { src = 'https://github.com/RRethy/vim-illuminate', name = 'vim-illuminate' },
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim', name = 'indent-blankline.nvim' },
    { src = 'https://github.com/junegunn/fzf', name = 'fzf' },
    { src = 'https://github.com/ibhagwan/fzf-lua', name = 'fzf-lua' },
    'https://github.com/folke/which-key.nvim',
  }
  vim.pack.add(specs, { load = true, confirm = false })
  pcall(function()
    if vim.fn.exists('*mkdp#util#install') == 1 then
      vim.fn['mkdp#util#install']()
    end
  end)
end

return M
