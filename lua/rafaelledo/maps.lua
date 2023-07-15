local keymap = vim.keymap
local wk = require("which-key")

keymap.set('n', 'x', '"_x') -- no overwrite system clipboard
keymap.set('n', 'd', '"_d')
keymap.set('n', 'y', 'vy')
keymap.set('n', '.', '<nop>')

keymap.set('v', 'd', '"_d')
keymap.set('v', '<Del>', '"_d')
keymap.set('i', '<C-z>', '<Esc>u')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', 'q', ':tabclose<Return>')

-- Split window
wk.register({
  ["ss"] = { ":split<Return><C-w>w", "Horizontal Split" },
  ["sv"] = { ":vsplit<Return><C-w>w", "Vertical Split" },
  -- Move window
  ["sh"] = { "<C-w>h", "Move Window to Left" },
  ["sk"] = { "<C-w>h", "Move Window Up" },
  ["sj"] = { "<C-w>h", "Move Window Down" },
  ["sl"] = { "<C-w>h", "Move Window to Right" },
  -- Resize window
  ["<C-w><left>"] = { "<C-w><", "Reduce width" },
  ["<C-w><up>"] = { "<C-w>+", "Increase height" },
  ["<C-w><down>"] = { "<C-w>-", "Reduce height" },
  ["<C-w><right>"] = { "<C-w>>", "Reduce width" }
})

keymap.set('n', '<C-w><', '<nop>')

-- Indenting remaps
keymap.set('v', '<TAB>', '>gv')
keymap.set('v', '<S-TAB>', '<gv')

-- Allow moving selected lines in visual mode
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Allow remove line break without changing cursor position
keymap.set('n', 'J', "mzJ`z")

-- Jump page with cursor in middle
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- Search with cursor in middle
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- nha
keymap.set('i', '<C-c>', '<Esc>')

keymap.set("n", "<C-f>", vim.lsp.buf.format)
