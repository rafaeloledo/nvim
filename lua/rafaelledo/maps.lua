local keymap = vim.keymap

keymap.set({ 'n', 'v', 'x' }, 'x', '"_x')
keymap.set({ 'n', 'v', 'x' }, 'd', '"_d')
keymap.set({ 'n', 'v', 'x' }, '<Delete>', '"_d')
keymap.set({ 'n', 'v', 'x' }, 'p', 'P')

keymap.set({ 'n', 'v', 'x' }, '<kDel>', '<Delete>') -- Key Pad Delete
keymap.set('i', '<kDel>', '<Delete>')

keymap.set('n', 'y', 'vy')
keymap.set('n', '.', '<nop>')

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', 'dw', 'vb"_d')
keymap.set('n', '<C-a>', 'gg<S-v>G')

keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', 'ss', ':vsplit<Return><C-w>w')

keymap.set('n', '<leader>w', '<C-w>w')
keymap.set('n', '<leader>h', '<C-w>h')
keymap.set('n', '<leader>k', '<C-w>k')
keymap.set('n', '<leader>j', '<C-w>j')
keymap.set('n', '<leader>l', '<C-w>l')

keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

keymap.set('n', 'J', "mzJ`z")

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set("n", "<S-f>", vim.lsp.buf.format)
keymap.set('n', '<C-z>', 'u')

keymap.set('v', '<TAB>', '>gv')
keymap.set('v', '<S-TAB>', '<gv')

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('i', '<C-z>', '<Esc>u')
keymap.set('i', '<C-c>', '<Esc>')
