vim.opt.shell = "/bin/sh"
vim.opt.clipboard = "unnamed"
vim.opt.encoding = "utf-8"
vim.opt.laststatus = 2

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.history = 1000
vim.opt.list = false
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.visualbell = true
vim.opt.autoread = true
vim.opt.ruler = true
vim.opt.lazyredraw = true
vim.opt.cursorline = true

if vim.fn.has("termguicolors") == 1 then vim.opt.termguicolors = true end

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.textwidth = 120
vim.opt.colorcolumn = "+1"

vim.opt.hidden = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 4

vim.opt.scrolloff = 16
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.completeopt = { "longest", "menuone" }

vim.o.grepprg = "rg --vimgrep"

vim.g.loaded_perl_provider = 0

vim.g.python_host_prog = vim.fn.expand("~/.pyenv/versions/2.7.16/bin/python")
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.10.13/bin/python")

vim.g.llama_config = { show_info = 0 }

vim.g.airline_section_c = ""
vim.g.airline_section_y = ""
vim.g.airline_section_z = "L: %l/%L C: %v"

vim.g.airline_extensions = { "branch", "tabline", "nvimlsp" }
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#show_tab_count"] = 0
vim.g["airline#extensions#tabline#formatter"] = "short_path"
vim.g["airline#extensions#tabline#show_close_button"] = 0
vim.g["airline#extensions#tabline#buffer_idx_mode"] = 1
vim.g["airline#extensions#nvimlsp#show_line_numbers"] = 0

vim.g.rainbow_active = 1

vim.g["test#strategy"] = "vimux"
vim.g.VimuxRunnerName = "vimuxout"
vim.g.VimuxOrientation = "v"

vim.g["pandoc#filetypes#handled"] = { "markdown" }
vim.g["pandoc#modules#disabled"] = { "folding" }
vim.g["pandoc#biblio#bibs"] = "/Users/steven/Dropbox/0-LITERATURE/bib.bib"
vim.g["pandoc#biblio#use_bibtool"] = 1
vim.g["pandoc#command#autoexec_on_writes"] = 0
vim.g["pandoc#command#autoexec_command"] = "Pandoc latex --biblatex"

vim.g.tex_flavor = "latex"

vim.fn.setenv("FZF_BIBTEX_CACHEDIR", "/Users/steven/Dropbox/0-LITERATURE/bibtex_cache")
vim.fn.setenv("FZF_BIBTEX_SOURCES", "/Users/steven/Dropbox/0-LITERATURE/bib.bib")
vim.g.fzf_tags_command = "ctags -Ra -f tags ."
