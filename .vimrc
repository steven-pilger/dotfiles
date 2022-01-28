" INIT
" ========================================
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
set textwidth=88
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


" ========================================
" VIM PLUGIN CONFIGURATION
" ========================================
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.local/share/nvim/plugged')

" Utilities
Plug 'tpope/vim-eunuch' "eunuch.vim: Helpers for UNIX
Plug 'mhinz/vim-signify'  " Show a diff using Vim its sign column.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion' "Vim motions on speed!
Plug 'xolox/vim-misc' "Miscellaneous auto-load Vim scripts
Plug 'junegunn/goyo.vim' "Distraction-free writing in Vim.
Plug 'christoomey/vim-tmux-navigator' "Seamless navigation between tmux panes and vim splits
Plug 'tpope/vim-surround' "quoting/parenthesizing made simple
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair
Plug 'andymass/matchup.vim' "highlight, navigate, and operate on sets of matching text
Plug 'tpope/vim-sleuth' "detect indentation
Plug 'tpope/vim-fugitive'  "A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-dispatch'  "A Git wrapper so awesome, it should be illegal
Plug 'jreybert/vimagit' "Ease your git workflow within vim.
Plug 'vimwiki/vimwiki' "A Personal Wiki For Vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'vifm/vifm.vim' "Vi based file-manager

" Commenting
Plug 'tyru/caw.vim' "Vim comment plugin: supported operator/non-operator mappings, repeatable by dot-command, 300+ filetypes
Plug 'kana/vim-repeat' "Vim plugin: Enable to repeat last change by non built-in commands
Plug 'shougo/context_filetype.vim' "Context filetype library for Vim script

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
Plug 'dense-analysis/ale' "Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plug 'SirVer/ultisnips' "snippet engine
Plug 'honza/vim-snippets' "snippet plugin
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " Dark powered asynchronous completion framework for neovim/Vim8
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind-nvim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'ivan-krukov/vim-snakemake'

" Style
Plug 'vim-airline/vim-airline' "lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
Plug 'dawikur/base16-vim-airline-themes'
Plug 'edkolev/tmuxline.vim' "Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration
" Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons' "Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'luochen1990/rainbow' "Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.

call plug#end()

" set node.js path
" let g:node_host_prog = '/usr/local/bin/neovim-node-host'

syntax on
" onehalf dark/light
"Change theme depending on the time of day
let hr = (strftime('%H'))
if hr >= 19
let g:airline_theme='base16_onedark'
colorscheme base16-onedark
elseif hr >= 8
let g:airline_theme='base16_one_light'
colorscheme base16-one-light
elseif hr >= 0
let g:airline_theme='base16_onedark'
colorscheme base16-onedark
endif

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
" one dark
" colorscheme onedark
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" highlight Comment cterm=italic gui=italic
" autocmd ColorScheme * highlight Normal ctermbg=none
" autocmd ColorScheme * highlight NonText ctermbg=none

map <c-c> :bd<CR>

" ========================================
" PLUGIN CONFIGURATION
" ========================================
"
"

" UltiSnips
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"
"
"
" YouCompleteMe
" let g:ycm_python_binary_path = 'python'
" let g:ycm_autoclose_preview_window_after_completion=1
" if !exists('g:ycm_semantic_triggers')
"     let g:ycm_semantic_triggers = {}
"   endif
" let g:ycm_semantic_triggers.tex = ['@']

" Deoplete
" Python nvim environment
let g:python_host_prog = '~/.pyenv/versions/2.7.16/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/3.8.12/bin/python'
"
" let g:deoplete#enable_at_startup = 1
" " remap keys for up/down in list to j/k when popup is visible
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"
" call deoplete#custom#option({
"\ 'max_list': 30,
"\ 'auto_complete_delay': 200,
"\ })
"
" call deoplete#custom#var('around', {
"\ 'range_above': 20,
"\ 'range_below': 20,
"\ 'mark_above': '[↑]',
"\ 'mark_below': '[↓]',
"\ 'mark_changes': '[*]',
"\})
"
" " call deoplete#custom#var('omni', 'input_patterns', {
" "  \ 'pandoc': '@',
" "\})


" Indent Guides
"let g:indent_guides_enable_on_vim_startup = 1
"set ts=2 sw=4 et
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1

" pandoc
let g:pandoc#filetypes#handled = ["markdown"]
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#biblio#bibs = '/Users/steven/Dropbox/0-LITERATURE/bib.bib'
let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = "Pandoc latex --biblatex"

" latex
let g:tex_flavor = 'latex'


" ALE
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
\   'javascriptreact': ['eslint'],
\   'vue': ['eslint', 'vls'],
\   'typescript': ['tsserver', 'tslint'],
\   'python': ['flake8'],
\   'markdown': ['writegood']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'html': ['prettier'],
\   'scss': ['prettier'],
\   'css': ['prettier'],
\   'ts': ['prettier'],
\   'python': ['black'],
\}

" Do not fix these files and projects
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\ 'protwis': {'ale_linters': [], 'ale_fixers': []},
\}

let b:ale_python_flake8_executable = '/usr/local/bin/flake8'
let b:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options='
  \--ignore E203, E266, E501, W503 \
  \--max-line-length 88 \
  \--max-complexity 18 \
  \--select B,C,E,F,W,T4,B9'

let g:ale_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_signs=1
let g:ale_set_highlights=1
" Combine ALE with CoC
let g:ale_disable_lsp = 1

" when to lint
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_lint_delay=10000

" let g:ale_open_list = 1
let g:airline#extensions#ale#enabled = 0

" Typescript
" Disable Syntax/Semantics checks from this plugin (ALE is used for that)
let g:nvim_typescript#diagnostics_enable = 0

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'yarn lint'

" GitGutter
set updatetime=100

" Vifm
map <c-b> :EditVifm<CR>


" Tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
            \'a'    : '#S',
            \'b'    : ['#(whoami)', "#(ifconfig en0 | grep 'inet ' | awk '{print $2}')", '#(curl ipinfo.io/ip)'],
            \'win'  : ['#I', '#W'],
            \'cwin' : ['#I', '#W', '#F'],
            \'y'    : ['%R', '#(date +"%d-%m-%y")'],
            \'z'    : '#H'}
let g:tmuxline_theme = 'airline'

"Rainbow Parentheses
let g:rainbow_active = 1

"Emmet
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall

"Easy Motion
"Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Airline / Tmuxline
let g:airline_section_c = ''
" let g:airline_theme='onedark'
" let g:airline_theme='onehalfdark'
" let g:airline_theme='onehalflight'
let g:airline#extensions#tmuxline#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tagbar#enabled = 1

" CTRL-P
"let g:ctrlp_working_path_mode = 'ra'

" Spell Check
" let g:SpellCheck_DefineQuickfixMappings = 0

" fzf
nnoremap <silent> <leader>f :ProjectFiles<CR>
nnoremap <silent> <leader><space> :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>l :BLines<CR>
" nnoremap <silent> <leader>o :BTags<CR>
" nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>s :Rg<CR>

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

" DetectIndent
" autocmd BufReadPost * :DetectIndent

" Goyo
function! s:goyo_enter()
  " if executable('tmux') && strlen($TMUX)
  "   silent !tmux set status off
  "   silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  " endif
  " set noshowmode
  " set noshowcmd
  " set scrolloff=999
  set nonumber norelativenumber
endfunction

function! s:goyo_leave()
  " if executable('tmux') && strlen($TMUX)
  "   silent !tmux set status on
  "   silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  " endif
  " set showmode
  " set showcmd
  " set scrolloff=5
  set number relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" Ctags
" let g:autotagTagsFile="tags"
" let g:autotagDisabled=0

" unlet b:easytags_auto_highlight
" let g:easytags_async = 1
" set tags=./tags;
" let g:easytags_dynamic_files = 1
" let g:easytags_resolve_links = 1

" TagBar
nmap <F8> :TagbarToggle<CR>

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

nmap <leader>wn <Plug>VimwikiNextLink
nmap <leader>wp <Plug>VimwikiPrevLink
let g:vimwiki_table_mappings=0

" LSP Completion
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ge    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>F    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>


set completeopt=longest,menuone

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        with_text = false
      }),
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
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
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
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

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pylsp'].setup {
    capabilities = capabilities
  }
EOF
