local map = vim.keymap.set
local keymap = vim.api.nvim_set_keymap -- Shortcut for setting keymaps
local opts = { noremap = true, silent = true } -- Default options
local builtin = require('telescope.builtin')

for _, m in ipairs({ "n", "i" }) do
  map(m, "<Up>", "<nop>")
  map(m, "<Down>", "<nop>")
  map(m, "<Left>", "<nop>")
  map(m, "<Right>", "<nop>")
end

map("i", "jk", "<Esc>")

map("n", "<leader>re", ":edit ~/.config/nvim/init.vim<CR>", { silent = true })
map("n", "<leader>rs", ":restart<CR>", { silent = true })

map("n", "<C-c>", ":bd<CR>", { silent = true })

map("n", "<leader>t", ":tabnext<CR>", { silent = true })
map("n", "<leader>T", ":tabprevious<CR>", { silent = true })

map("n", "<leader>p", '"*p', { silent = true })
map("n", "<leader>P", '"*P', { silent = true })
map("x", "<leader>p", '"*p', { silent = true })

map("n", "<leader>y", '"*y', { silent = true })
map("n", "<leader>Y", '"*Y', { silent = true })
map("x", "<leader>y", '"*y', { silent = true })

map("n", "Y", "y$")

for i = 1, 9 do
  map("n", "<leader>" .. i, "<Plug>AirlineSelectTab" .. i)
end

local aider_bindings = function()
  local pane_target_cmd = [[tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index} #{pane_title}" | grep "aider" | awk '{print $1}']]
  local keymap_func_cmd = ":silent !tmux send-keys -t $(" .. pane_target_cmd .. ") '/add " .. vim.fn.expand("%:p") .. "' Enter<CR>"

  -- The <Leader>af command
  keymap('n', '<Leader>af', ':' .. keymap_func_cmd .. '<CR>', opts)
end
aider_bindings()

map("n", "<leader>f", builtin.find_files, { silent = true })
map("n", "<leader><space>", "<cmd>Telescope buffers<CR>", { silent = true })
map("n", "<leader>l", "<cmd>Telescope lines<CR>", { silent = true })
map("n", "<leader>s", "<cmd>Telescope live_grep_args<CR>", { silent = true })
map("n", "<leader>/", ":noh<CR>", { silent = true })
map("n", "<leader>A", "<cmd>AerialToggle left<CR>", { silent = true })
map("n", "<leader>x", "<cmd>Trouble diagnostics toggle<CR>", { silent = true })

map("n", "<C-b>", ":EditVifm<CR>", { silent = true })

map("n", "<C-w>z", function()
  require('zen-mode').toggle({ window = { width = 0.95 } })
end, { silent = true })

map("n", "<C-w>o", function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
map("n", "<C-w><C-o>", function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })

map("n", "gd", vim.lsp.buf.definition, { silent = true })
map("n", "gi", vim.lsp.buf.implementation, { silent = true })
map("n", "gr", vim.lsp.buf.references, { silent = true })
map("n", "gD", vim.lsp.buf.declaration, { silent = true })
map("n", "K", vim.lsp.buf.hover, { silent = true })

map("n", "<leader>tt", "<cmd>TestNearest<CR>", { silent = true })
map("n", "<leader>tF", "<cmd>TestFile<CR>", { silent = true })
map("n", "<leader>tC", "<cmd>TestClass<CR>", { silent = true })
