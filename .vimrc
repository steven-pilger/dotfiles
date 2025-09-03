set shell=/bin/sh
set nocompatible
filetype off

set clipboard=unnamed
set encoding=utf8
set laststatus=2

set number relativenumber       "Line numbers are good with relative numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set nolist                      "don't render special chars (tabs, trails, ...)
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set showmatch                   "highlight matching brackets
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ruler                       "show the cursot position the whole time
set ttyfast                     " fast terminal
set lazyredraw
set cursorline

"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Make it obvious where 88 characters is
set textwidth=120
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"Performance improvments
" if has("mac")
"   set nocursorline
"
"   if exists("+relativenumber")
"     set norelativenumber
"   endif
"
"   set foldlevel=0
"   set foldmethod=manual
" endif

"disable the arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" remap escape key to jk
inoremap jk <Esc>

"https://www.reddit.com/r/vim/comments/avlf18/i_just_got_into_vim_but_two_things_would_really/ehg7g3m
nnoremap <silent> <leader>p       "*p
nnoremap <silent> <leader>P       "*P
xnoremap <silent> <leader>p       "*p

nnoremap <silent> <leader>y       "*y
nmap     <silent> <leader>Y       "*Y
xnoremap <silent> <leader>y       "*y

nnoremap          Y               y$


" https://jeffkreeftmeijer.com/vim-number/
" augroup numbertoggle
"     autocmd!
"     autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"     autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" leader
let mapleader=" "
let maplocalleader = ","

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

let $M="~/.vimrc"
map <leader>re :execute "edit " . $M<CR>
map <leader>rs :execute "source " . $M<CR>

nnoremap <silent> <leader>t :tabnext<CR>
nnoremap <silent> <leader>T :tabprevious<CR>

" ========================================
" TURN OFF SWAPFILES
" ========================================
set noswapfile
set nobackup
set nowb


" ================ Indentation ======================
" filetype specific indentation is managed via tpope/vim-sleuth
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Auto indent pasted text
"nnoremap p p=`]<C-o>
"nnoremap P P=`]<C-o>

set nowrap       "Don't wrap lines
" set linebreak    "Wrap lines at convenient points

" ================ Folding  ========================
set foldmethod=syntax
set foldlevel=4

" ================ Scrolling ========================
set scrolloff=16        "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
nnoremap <silent> <leader>/ :noh<CR> " remove search highlightin until next searhc


" ========================================
" PYTHON CHECK
" ========================================
" check whether py2 or py3 should be used
" py3 is now default
" py2 can be started with vim --cmd 'let py2 = 1'
"if exists('py2') && has('python')
"elseif has('python3')
"endif

let g:loaded_perl_provider = 0

" llama.vim
let g:llama_config = {'show_info': 0}


" ========================================
" VIM PLUGIN CONFIGURATION
" ========================================
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.local/share/nvim/plugged')
" call plug#begin('/vim/plugged')

" Utilities
Plug 'tpope/vim-eunuch' "eunuch.vim: Helpers for UNIX
" Plug 'mhinz/vim-signify'  " Show a diff using Vim its sign column.
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" Plug 'xolox/vim-misc' "Miscellaneous auto-load Vim scripts
" Plug 'junegunn/goyo.vim' "Distraction-free writing in Vim.
Plug 'christoomey/vim-tmux-navigator' "Seamless navigation between tmux panes and vim splits
Plug 'tpope/vim-surround' "quoting/parenthesizing made simple
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair
" Plug 'cohama/lexima.vim'
Plug 'andymass/matchup.vim' "highlight, navigate, and operate on sets of matching text
Plug 'tpope/vim-sleuth' "detect indentation
Plug 'tpope/vim-fugitive'  "A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-dispatch'  "A Git wrapper so awesome, it should be illegal
Plug 'NeogitOrg/neogit'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
" Plug 'vimwiki/vimwiki' "A Personal Wiki For Vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'vifm/vifm.vim' "Vi based file-manager
Plug 'nyngwang/NeoZoom.lua'

" Commenting
" Plug 'tyru/caw.vim' "Vim comment plugin: supported operator/non-operator mappings, repeatable by dot-command, 300+ filetypes
" Plug 'kana/vim-repeat' "Vim plugin: Enable to repeat last change by non built-in commands
" Plug 'shougo/context_filetype.vim' "Context filetype library for Vim script
Plug 'numToStr/Comment.nvim'

" Tex
Plug 'lervag/vimtex' "A modern vim plugin for editing LaTeX files.

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" R
Plug 'vim-pandoc/vim-rmarkdown'

" Spelling
Plug 'rhysd/vim-grammarous'

" HTML
Plug 'mattn/emmet-vim' "the essential toolkit for web-developers
Plug 'ap/vim-css-color' " A very fast, multi-syntax context-sensitive color name highlighter

" Javascript/Typescript

" Completion / Snippets
Plug 'williamboman/mason.nvim' "lsp management
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'SirVer/ultisnips' "snippet engine
Plug 'honza/vim-snippets' "snippet plugin
Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind-nvim'
Plug 'huggingface/llm.nvim'
Plug 'gsuuon/model.nvim'
Plug 'ggml-org/llama.vim'

" FZF / Code Actions / etc
Plug 'aznhe21/actions-preview.nvim'
" Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'neanias/telescope-lines.nvim'
Plug 'stevearc/aerial.nvim'

" Debug
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'jay-babu/mason-nvim-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" Syntax
" Plug 'sheerun/vim-polyglot'
" Plug 'ivan-krukov/vim-snakemake'

" Style
Plug 'vim-airline/vim-airline' "lean & mean status/tabline for vim that's light as air
"Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
"Plug 'dawikur/base16-vim-airline-themes'
"Plug 'edkolev/tmuxline.vim' "Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration
Plug 'chriskempson/base16-vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin', 'do': 'git config fetch.pruneTags false' }
Plug 'ryanoasis/vim-devicons' "Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'luochen1990/rainbow' "Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 'folke/zen-mode.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

" set node.js path
" let g:node_host_prog = '/usr/local/bin/neovim-node-host'

syntax on
" onehalf dark/light
"Change theme depending on the time of day
let hr = (strftime('%H'))
if hr >= 17
let g:airline_theme = 'catppuccin'
colorscheme catppuccin-frappe
elseif hr >= 8
let g:airline_theme = 'catppuccin'
colorscheme catppuccin-latte
elseif hr >= 0
let g:airline_theme = 'catppuccin'
colorscheme catppuccin-frappe
endif

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

map <c-c> :bd<CR>

" ========================================
" PLUGIN CONFIGURATION
" ========================================
"
" vim-test
let test#strategy = "vimux"
let g:VimuxRunnerName = "vimuxout"
let g:VimuxOrientation = "v"

nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tF :TestFile<CR>
nmap <silent> <leader>tC :TestClass<CR>

" UltiSnips
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
" let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Python nvim environment
let g:python_host_prog = '~/.pyenv/versions/2.7.16/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/3.10.13/bin/python'

" pandoc
let g:pandoc#filetypes#handled = ["markdown"]
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#biblio#bibs = '/Users/steven/Dropbox/0-LITERATURE/bib.bib'
let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = "Pandoc latex --biblatex"

" latex
let g:tex_flavor = 'latex'

" let b:ale_python_flake8_executable = '/usr/local/bin/flake8'
" let b:ale_python_flake8_use_global = 1
" let g:ale_python_flake8_options='
"  \--ignore E203, E266, E501, W503 \
"  \--max-line-length 88 \
"  \--max-complexity 18 \
"  \--select B,C,E,F,W,T4,B9'

" Vifm
map <c-b> :EditVifm<CR>

" Tmuxline
" let g:tmuxline_powerline_separators = 0
" let g:tmuxline_preset = {
"            \'a'    : '#S',
"            \'b'    : ['#(whoami)', "#(ifconfig en0 | grep 'inet ' | awk '{print $2}')", '#(curl ipinfo.io/ip)'],
"            \'win'  : ['#I', '#W'],
"            \'cwin' : ['#I', '#W', '#F'],
"            \'y'    : ['%R', '#(date +"%d-%m-%y")'],
"            \'z'    : '#H'}
" let g:tmuxline_theme = 'airline'

"Rainbow Parentheses
let g:rainbow_active = 1

" airline
" hide filename
let g:airline_section_c = ''
" hide file encoding
let g:airline_section_y = ''
let g:airline_section_z = 'L: %l/%L C: %v'

let g:airline_extensions = ['branch', 'tabline', 'nvimlsp']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#nvimlsp#show_line_numbers = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" fzf + telescope
 noremap <silent> <leader>f :Telescop find_files<CR>
nnoremap <silent> <leader><space> :Telescope buffers<CR>
" nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>l :Telescope lines<CR>
" nnoremap <silent> <leader>o :BTags<CR>
" nnoremap <silent> <leader>t :FzfLua tags<Ct>
" nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>s :Telescope live_grep_args<CR>
" nnoremap <silent> <leader>F     :Telescope lsp_document_symbols symbols=function,class<CR>
nnoremap <silent> <leader>A     :AerialToggle left<CR>
nnoremap <silent> <leader>xx     :Trouble diagnostics toggle<CR>

let g:fzf_tags_command = 'ctags -Ra -f tags .'
set grepprg=rg\ --vimgrep

" Citing with fzf
let $FZF_BIBTEX_CACHEDIR = '/Users/steven/Dropbox/0-LITERATURE/bibtex_cache'
let $FZF_BIBTEX_SOURCES = '/Users/steven/Dropbox/0-LITERATURE/bib.bib'

function! s:bibtex_cite_sink(lines)
    let r=system("bibtex-cite -mode=pandocnoauthor ", a:lines)
    execute ':normal! i' . r
endfunction

function! s:bibtex_cite_sink_insert(lines)
    let r=system("bibtex-cite -mode=pandocnoauthor ", a:lines)
    execute ':normal! i' . r
    call feedkeys('a', 'n')
endfunction

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
                        \ 'down': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

nnoremap <silent> <leader>c :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink'),
                        \ 'down': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({ 'source': suggestions,
                 \ 'sink': function("FzfSpellSink"),
                 \ 'down': '40%',
                 \ 'options': '--ansi --layout=reverse-list --multi --prompt "Change to> "'})
endfunction

nnoremap <silent> z= :call FzfSpell()<CR>


" Search project root
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" LSP Completion
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ge    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

set completeopt=longest,menuone

lua <<EOF

  -- Key Bindings
  vim.keymap.set("", "<leader>ng", "<cmd>:Neogit kind=replace<CR>", { remap = false })

  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.nf",
    command = "set filetype=groovy"
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set({'n', 'v'}, 'gca', require("actions-preview").code_actions)
      vim.keymap.set('n', '<leader>F', function()
        vim.lsp.buf.format { 
          async = true,
        }
      end, opts)
    end,
  })

  -- Detect floating windows on BufEnter
  vim.api.nvim_create_autocmd("BufEnter", {
      group = augroup,
      pattern = "*",
      callback = function()
          -- Check if the buffer is in a floating window
          local buftype = vim.bo.buftype
          local is_floating = vim.api.nvim_win_get_config(0).relative ~= ""
          if is_floating or buftype == "prompt" or buftype == "nofile" or buftype == "popup" then
              -- Disable completion (affects plugins like llama.vim if they use completion)
              vim.opt_local.completeopt = { "menu", "menuone", "noselect" }
              vim.opt_local.complete = "" -- Disable completion sources
              vim.cmd("LlamaDisable")

              -- Hypothetical: Disable specific plugins using buffer-local variables
              -- Optionally, remove plugin-specific keymaps (e.g., if plugin uses <Tab>)
          else
              -- Restore settings for non-floating windows
              vim.opt_local.completeopt = { "menu", "menuone", "noselect", "noinsert" }
              vim.opt_local.complete = ".,w,b,u,t,i"
            vim.cmd("LlamaEnable")
          end
      end,
  })


  require('aerial').setup {
    layout = {
      max_width = {60, 0.33},
      width = 30,
      min_width = 30
    }
  }

  require("ibl").setup{ scope = { enabled = false }}

  require('illuminate').configure({
    delay  = 10,
    providers = {
        'treesitter',
        'regex',
    }
    })

  local actions = require("telescope.actions")
  local lga_actions = require("telescope-live-grep-args.actions")

  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      },
      live_grep_args = {
        auto_quoting = true, -- enable/disable auto-quoting
        mappings = { -- extend mappings
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
            -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            -- freeze the current list and start a fuzzy search in the frozen list
            ["<C-r>"] = actions.to_fuzzy_refine,
          },
        },
      },
    },
    defaults = {
      mappings = {
        i = {
          ["<C-q>"] = actions.send_selected_to_qflist,
        },
      },
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        width = 0.8,
        height = 0.8,
        mirror = true, prompt_position = "top", preview_cutoff = 20,
        preview_height = function(_, _, max_lines)
          return max_lines - 15
        end,
      }
   }
  }

  require("telescope").load_extension("lines")
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("live_grep_args")

  require("actions-preview").setup {
    telescope = {
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        width = 0.8,
        height = 0.6,
        mirror = true,
        prompt_position = "top",
        preview_cutoff = 20,
        preview_height = function(_, _, max_lines)
          return max_lines - 15
        end,
      },
    },
  }

  local neogit = require('neogit')
  neogit.setup {
      disable_hint = true,
      disable_context_highlighting = true,
  }

  require('gitsigns').setup()
  require('trouble').setup({
    modes = {
      diagnostics_split_in_buffer = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3,
        },
        filter = { buf = 0 }, -- filter diagnostics to the current buffer
      },
    }
  })

  require("catppuccin").setup({
    integrations = {
        barbar = true,
        mason = true,
        lsp_trouble = true,
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        }
    }
  })

  -- Setup nvim-cmp.
  local cmp = require'cmp'
  -- symbols in the completion window
  local lspkind = require('lspkind')
  require("fidget").setup()

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        with_text = false
      }),
    },
    -- snippet = {
    --   -- REQUIRED - you must specify a snippet engine
    --   expand = function(args)
    --     vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --   end,
    -- },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- elseif luasnip.expand_or_jumpable() then
          -- luasnip.expand_or_jump()
        else
          fallback()
        end
    end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        -- elseif luasnip.jumpable(-1) then
          -- luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  require'nvim-treesitter.configs'.setup {
     -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "html", "css", "python", "javascript", "tsx", "svelte"},
      highlight = {
          enable = true,
      },
      indent = {
          enable = true
      },
  }
  require'treesitter-context'.setup{ enable = true }
  require('Comment').setup()

  -- -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['pylsp'].setup {
    capabilities = capabilities,
    settings = {
      pylsp = {
        configurationSources = {"flake8"},
        plugins = {
          ruff = {
            enabled = true,
            -- lineLength = '120',
            -- format = { "I" },  -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
            -- extendSelect = { "F", "E", "W", "PL", "N", "COM", "TRY" },
            -- extendIgnore = { "I", "E501" },
          },
          pylsp_mypy = {
            enabled = false
          },
          flake8 = {
            enabled = false
          },
          rope_autoimport = {
              enabled = false
          },
          }
        },
      }
    }
  require('lspconfig')['ts_ls'].setup{}

  vim.api.nvim_create_user_command(
    'LspInstallDependencies',
    function(pkg)
      -- remove the next three lines if ruff or other dependecies dont install
      if pkg.name ~= "python-lsp-server" then
        return
      end
      local venv = vim.fn.stdpath("data") .. "/mason/packages/python-lsp-server/venv"
      -- local venv = "/Users/stpi/.pyenv/versions/3.10.13"
      local job = require("plenary.job")

      job:new({
          command = venv .. "/bin/pip",
          args = {
              "install",
              "-U",
              "--disable-pip-version-check",
              "pylsp-mypy",
              "python-lsp-ruff",
              "rope",
              "flake8",
          },
          cwd = venv,
          env = { VIRTUAL_ENV = venv },
          on_exit = function()
              print("Finished installing pylsp modules.")
          end,
          on_start = function()
              vim.notify("Installing pylsp modules...")
          end,
      }):start()
    end,
    {}
  )


  require('mason').setup({
      ui = {
          icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
          }
      }
  })
  require("mason-registry"):on("package:install:success", vim.cmd.LspInstallDependencies())

  require('mason-lspconfig').setup({
      -- A list of servers to automatically install if they're not already installed
      ensure_installed = { 'pylsp', 'ts_ls', 'svelte'},
  })

  local function mason_package_path(package)
      local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
      return path
  end

  -- depends on package manager / language
  -- this command might need to be changed such that the pip from the venv is used
  -- e.g. ./venv/bin/pip
  local command = "pip"
  local args = { "install", "pylsp-rope", "python-lsp-ruff", "pylsp-mypy", "pyls-isort" }

  require("plenary.job")
    :new({
        command = command,
        args = args,
        cwd = mason_package_path("python-lsp-server"),
    })
    :start()


  require("mason-nvim-dap").setup({
      ensure_installed = { "python", "js", "firefox"}
  })

  local dap, dapui = require("dap"), require("dapui")
  require('dap-python').setup('$HOME/.pyenv/versions/3.10.13/bin/python')
  require("dapui").setup()
  require('dap.ext.vscode').load_launchjs()

  vim.keymap.set('n', '<leader>d', function()
      vim.cmd 'colorscheme catppuccin'
      return require('dapui').toggle({reset=true})
  end)
  vim.keymap.set('n', '<C-w>z', function()
      return require('zen-mode').toggle({window={width=0.95}})
  end)

  require('neo-zoom').setup({
      winopts = {
        offset = {
          -- NOTE: omit `top`/`left` to center the floating window vertically/horizontally.
          -- top = 0,
          -- left = 0.17,
          width = 0.8,
          height = 0.75,
        },
        -- NOTE: check :help nvim_open_win() for possible border values.
        border = 'thicc', -- this is a preset, try it :)
      },
  })
  vim.keymap.set('n', '<C-w>o', function () vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
  vim.keymap.set('n', '<C-w><C-o>', function () vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({reset=true})
    -- vim.cmd 'colorscheme catppuccin'
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.fn.sign_define('DapBreakpointCondition', { text ='⬤ ', texthl ='', linehl ='', numhl =''})
  vim.fn.sign_define('DapBreakpoint', { text ='⬤ ', texthl ='', linehl ='', numhl =''})
  vim.fn.sign_define('DapStopped', { text ='⮕ ', texthl ='', linehl ='', numhl =''})

  vim.keymap.set('n', '<F5>', require 'dap'.continue)
  vim.keymap.set('n', '<F6>', require 'dap'.restart)
  vim.keymap.set('n', '<F10>', require 'dap'.step_over)
  vim.keymap.set('n', '<F11>', require 'dap'.step_into)
  vim.keymap.set('n', '<F12>', require 'dap'.step_out)
  vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

  local system_prompt = ' \
      You are an expert software developer. \
      You only respond with code snippets. \
      The code snippets you write are concise and readable. \
  '

  local lmstudio_provider = require('model.providers.openai')
  local lmstudio_options = {
      url = 'http://127.0.0.1:1234/v1',
      authorization = 'not-needed'
  }

  local lmstudio_prompt = {
    provider = lmstudio_provider,
    options = lmstudio_options,
    builder = function(input)
      return {
        model = "stable-code-3b",
        temperature = 0.2,
        n_predict = -1,
        top_k = 40,
        repeat_penalty = 1.1,
        min_p = 0.05,
        top_p = 0.9,
        max_tokens = 400,
        messages = {
            {
                role = "system",
                content = system_prompt,
            },
            { role = "user", content = input },
        },
      }
      end,
  }

  function prompt(callback, initial_content, title)
      local bufnr = vim.api.nvim_create_buf(true, true)
      vim.api.nvim_buf_set_option(bufnr, 'buftype', 'prompt')

      vim.cmd(':b ' .. bufnr)

      vim.api.nvim_set_option_value('winbar', title or 'Prompt', { scope = 'local' })

      if initial_content ~= nil then
        if type(initial_content) == "string" then
          initial_content = vim.fn.split(initial_content, '\n')
        end
        vim.api.nvim_buf_set_text(bufnr, 0, 0, 0, 0, initial_content)
      end

      vim.fn.prompt_setcallback(bufnr, function(user_input)
        local buf_content = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -3, false), '\n')
        local success, result = pcall(callback, user_input, buf_content)

        if not success then
          vim.notify(result, vim.log.levels.ERROR)
        end

        -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true)
        vim.cmd(':bd! ' .. bufnr)
      end)

      vim.cmd.startinsert()
  end

  function user_prompt(callback, input, title)
      return function(resolve)
        prompt(function(user_input, buffer_content)
          resolve(callback(user_input, buffer_content))
        end, input, title)
      end
  end

  local lmstudio_ask = {
    provider = lmstudio_provider,
    options = lmstudio_options,
    mode = 'buffer',
    builder = function(input)
      local messages = {
        {
          role = 'user',
          content = input
        }
      }
      return user_prompt(
        function(input)
            if #input > 0 then
              table.insert(messages, {
                role = 'user',
                content = input
              })
            end

            return {
              messages = messages
            }
          end,
          input
      )
    end
  }

  local lmstudio_commit_message = {
    provider = lmstudio_provider,
    options = lmstudio_options,
    mode = 'insert',
    builder = function()
      local git_diff = vim.fn.system {'git', 'diff', '--staged'}
      return {
        messages = {
          {
            role = 'system',
            content = '\
              You are a helpful coding assistant that only returns a single commit message.\
              Write a short commit message according to the Conventional Commits specification\
              Do not explain yourself.\
              Do not include the scope, body or footter.\
              Here is an example structure of your response: "<type>: <description>"\
              Use the following git diff:\
              ```\n' .. git_diff .. '```\
            '
          }
        }
      }
    end,
  }
  local function input_if_selection(input, context)
    return context.selection and input or ''
  end
  local lmstudio_chat = {
    provider = lmstudio_provider,
    options = lmstudio_options,
    create = input_if_selection,
    system = system_prompt,
    run = function(messages, config)
      if config.system then
        table.insert(messages, 1, {
          role = 'system',
          content = config.system
        })
      end
      return { messages = messages }
    end
  }

  local ollama_provider = require('model.providers.ollama')

  local ollama_chat = {
    provider = ollama_provider,
    create = input_if_selection,
    params = {
      model = 'codegemma:7b'
    },
    system = system_prompt,
    run = function(messages, config)
      if config.system then
        table.insert(messages, 1, {
          role = 'system',
          content = config.system
        })
      end
      return { messages = messages }
    end
  }

  local ollama_ask = {
    provider = ollama_provider,
    params = {
      model = 'codegemma:7b'
    },
    mode = 'buffer',
    system = system_prompt,
    builder = function(input)
      local messages = {
        {
          role = 'user',
          content = input
        }
      }
      return user_prompt(
        function(input)
            if #input > 0 then
              table.insert(messages, {
                role = 'user',
                content = input
              })
            end

            return {
              messages = messages
            }
          end,
          input
      )
    end
  }


  require('model').setup({
    prompts = {
      lmstudio = lmstudio_prompt,
      commit = lmstudio_commit_message,
      ask = lmstudio_ask,
      oask = ollama_ask,
    },
    default_prompt = lmstudio_prompt,
    chats = {
        lmstudio = lmstudio_chat,
        ollama = ollama_chat,
    },
  })

EOF

