local keymap = vim.keymap

--- ThePrimeagen modified

vim.g.mapleader = " "

keymap.set('n', '<leader>pv', vim.cmd.Ex)
keymap.set({'n', 'v'}, '<leader>y', [["+y]])
keymap.set({'n', 'v'}, '<leader>Y', [["+Y]])
keymap.set({'n', 'v'}, '<leader>d', [["_d]])
keymap.set('i', '<C-c>', '<Esc>')
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
keymap.set('n', '<leader><leader>', function ()
  vim.cmd("so")
end)
keymap.set('n', '<leader>f', vim.lsp.buf.format)
-- Search with cursor in middle
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

--- devaslife modified

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'db', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

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

