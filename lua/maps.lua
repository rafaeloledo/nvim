local set = vim.keymap.set

-- Cut and delete maps
set('n', 'x', '"_x')
set({ 'n', 'v', 'x' }, 'd', '"_d')
set({ 'n', 'v', 'x' }, '<Delete>', '"_d')

-- Yank and paste maps
set('n', '<C-v>', '"+p')
set({ 'n', 'v' }, 'y', '"+y')

-- Keypad delete (for if are any conflicts)
set({ 'n', 'v', 'x' }, '<kDel>', '<Delete>')
set('i', '<kDel>', '<Delete>')

-- Yank only the highlighted char
set('n', 'y', 'vy')

-- Increment and decrement numbers quickly
set('n', '+', '<C-a>')
set('n', '-', '<C-x>')

-- Delete word backwards
set('n', 'dw', 'vb"_d')
-- Select all
set('n', '<C-a>', 'gg<S-v>G')

-- Tab edit
set('n', 'te', ':tabedit<Return>')
-- Splits
set('n', 'sv', ':vsplit<Return><C-w>w')
set('n', 'ss', ':split<cr><C-w>w')

-- Quit current buffer
set('n', 'q', ':bd<cr>')

-- Move window
set('n', '<leader>w', '<C-w>w')
set('n', '<leader>h', '<C-w>h')
set('n', '<leader>k', '<C-w>k')
set('n', '<leader>j', '<C-w>j')
set('n', '<leader>l', '<C-w>l')

-- Resize window
set('n', '<C-w><left>', '<C-w><')
set('n', '<C-w><right>', '<C-w>>')
set('n', '<C-w><up>', '<C-w>+')
set('n', '<C-w><down>', '<C-w>-')

-- Centralize screen in vertical movements
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Back to visual when indenting lines
set('v', '<TAB>', '>gv')
set('v', '<S-TAB>', '<gv')

-- Move lines top and bottom vscode-like
set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

-- Just for cerebral laggyness
set('i', '<C-z>', '<Esc>u')
set('i', '<C-c>', '<Esc>')
