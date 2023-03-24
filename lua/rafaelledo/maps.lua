local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

keymap.set('n', 'te', ':tabedit', { silent = true })     -- New Tab
keymap.set('n', 'tc', ':tabclose', { silent = true })    -- Close Tab
keymap.set('n', 'tn', ':tabnext', { silent = true })     -- Next tab
keymap.set('n', 'tp', ':tabprevious', { silent = true }) -- Previous tab

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

-- Directional keys remap
keymap.set('i', '<A-h>', '<Left>')
keymap.set('i', '<A-j>', '<Down>')
keymap.set('i', '<A-k>', '<Up>')
keymap.set('i', '<A-l>', '<Right>')

-- Indenting remaps
keymap.set('v', '<TAB>', '>gv')
keymap.set('v', '<S-TAB>', '<gv')

-- vscode-like remappings
-- keymap.set('n', '<C-A-d>', 'dd')
-- keymap.set('n', '<C-BS>', 'dw')
