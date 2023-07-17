local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', 'x', '"_x', opts) -- no overwrite system clipboard
keymap.set('n', 'd', '"_d', opts)
keymap.set('n', 'y', 'vy', opts)
keymap.set('n', '.', '<nop>', opts)

keymap.set('v', 'd', '"_d', opts)
keymap.set('v', '<Del>', '"_d', opts)

-- Increment/decrement
keymap.set('n', '+', '<C-a>', opts)
keymap.set('n', '-', '<C-x>', opts)

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', opts)
keymap.set('n', 'q', ':tabclose<Return>', opts)

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', opts)
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Move window
keymap.set('n', '<leader>w', '<C-w>w', opts)
keymap.set('n', '<leader>h', '<C-w>h', opts)
keymap.set('n', '<leader>k', '<C-w>k', opts)
keymap.set('n', '<leader>j', '<C-w>j', opts)
keymap.set('n', '<leader>l', '<C-w>l', opts)

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><', opts)
keymap.set('n', '<C-w><right>', '<C-w>>', opts)
keymap.set('n', '<C-w><up>', '<C-w>+', opts)
keymap.set('n', '<C-w><down>', '<C-w>-', opts)

-- Indenting remaps
keymap.set('v', '<TAB>', '>gv', opts)
keymap.set('v', '<S-TAB>', '<gv', opts)

-- Allow moving selected lines in visual mode
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Allow remove line break without changing cursor position
keymap.set('n', 'J', "mzJ`z", opts)

-- Jump page with cursor in middle
keymap.set('n', '<C-d>', '<C-d>zz', opts)
keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Search with cursor in middle
keymap.set('n', 'n', 'nzzzv', opts)
keymap.set('n', 'N', 'Nzzzv', opts)

-- nha
keymap.set('i', '<C-c>', '<Esc>', opts)

keymap.set("n", "<C-f>", vim.lsp.buf.format, opts)

keymap.set('n', 'ec', ':e ~/.config/nvim<Return>', opts)
keymap.set('n', '<leader>r', ':w<Return>:so<Return>', opts)
keymap.set('n', '<leader>e', function()
  if vim.api.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
    vim.cmd('NvimTreeClose')
  else
    vim.cmd('NvimTreeOpen')
  end
end, opts)

keymap.set('i', '<C-z>', '<Esc>u', opts)
keymap.set('n', '<C-z>', 'u', opts)
