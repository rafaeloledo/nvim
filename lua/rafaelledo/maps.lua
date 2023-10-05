local keymap = vim.keymap

--- !Insert mode mappings

-- mixed
keymap.set({ 'n', 'v', 'x' }, 'x', '"_x')
keymap.set({ 'n', 'v', 'x' }, 'd', '"_d')
keymap.set({ 'n', 'v', 'x' }, '<Delete>', '"_d')
keymap.set({ 'n', 'v', 'x' }, '<kDel>', '<Delete>') -- Key Pad Delete

-- normal
keymap.set('n', 'y', 'vy')
keymap.set('n', '.', '<nop>')
-- Prevent creating a new line before pasting
keymap.set({ 'n', 'v', 'x' }, 'p', 'P')
-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')
-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- New tab
keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', 'q', ':tabclose<Return>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<leader>w', '<C-w>w')
keymap.set('n', '<leader>h', '<C-w>h')
keymap.set('n', '<leader>k', '<C-w>k')
keymap.set('n', '<leader>j', '<C-w>j')
keymap.set('n', '<leader>l', '<C-w>l')
-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
-- Allow remove line break without changing cursor position
keymap.set('n', 'J', "mzJ`z")
-- Jump page with cursor in middle
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
-- Search with cursor in middle
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')
keymap.set("n", "<S-f>", vim.lsp.buf.format)
keymap.set('n', '<leader>ec', ':e ~/.config/nvim<Return>')
keymap.set('n', '<leader>r', ':w<Return>:so<Return>')
keymap.set('n', '<C-b>', function()
  vim.cmd('NvimTreeToggle')
end)
keymap.set('n', '<C-z>', 'u')

-- visual
-- Indenting remaps
keymap.set('v', '<TAB>', '>gv')
keymap.set('v', '<S-TAB>', '<gv')
-- Allow moving selected lines in visual mode
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

--- Insert mode mappings

keymap.set('i', '<C-z>', '<Esc>u')
keymap.set('i', '<C-c>', '<Esc>')
keymap.set('i', '<kDel>', '<Delete>')
