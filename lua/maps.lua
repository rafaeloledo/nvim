local set = vim.keymap.set

set('n', 'x', '"_x')
set('n', '<C-v>', '"+p')
set('n', 'y', '"+y')
set({ 'n', 'v', 'x' }, 'd', '"_d')
set({ 'n', 'v', 'x' }, '<kDel>', '<Delete>')
set({ 'n', 'v', 'x' }, '<Delete>', '"_d')
set('i', '<kDel>', '<Delete>')
set({ 'n', 'v', 'x' }, 'p', 'P')


set('n', 'y', 'vy')
set('n', '.', '<nop>')

set('n', '+', '<C-a>')
set('n', '-', '<C-x>')

set('n', 'dw', 'vb"_d')
set('n', '<C-a>', 'gg<S-v>G')

set('n', 'H', '^')
set('n', 'L', '$')

set('n', 'te', ':tabedit<Return>')
set('n', 'sv', ':vsplit<Return><C-w>w')
set('n', 'ss', ':split<cr><C-w>w')

set('n', '<leader>w', '<C-w>w')
set('n', '<leader>h', '<C-w>h')
set('n', '<leader>k', '<C-w>k')
set('n', '<leader>j', '<C-w>j')
set('n', '<leader>l', '<C-w>l')


set('n', '<C-w><left>', '<C-w><')
set('n', '<C-w><right>', '<C-w>>')
set('n', '<C-w><up>', '<C-w>+')
set('n', '<C-w><down>', '<C-w>-')

set('n', 'J', "mzJ`z")

set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

set("n", "<S-f>", vim.lsp.buf.format)
set('n', '<C-z>', 'u')

set('v', '<TAB>', '>gv')
set('v', '<S-TAB>', '<gv')

set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

set('i', '<C-z>', '<Esc>u')
set('i', '<C-c>', '<Esc>')
