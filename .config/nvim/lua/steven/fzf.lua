vim.cmd([[
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
]])
local function find_git_root()
  local res = vim.fn.system('git rev-parse --show-toplevel 2> /dev/null')
  return res:gsub('%s+$', '')
end

vim.api.nvim_create_user_command('ProjectFiles', function()
  local root = find_git_root()
  if root ~= '' then
    require('telescope.builtin').find_files({ cwd = root })
  else
    require('telescope.builtin').find_files()
  end
end, {})
