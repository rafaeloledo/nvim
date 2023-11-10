local set = vim.keymap.set

set("n", "x", '"_x') -- Delete permanently

set("n", "+", "<C-a>") -- Increment
set("n", "-", "<C-x>") -- Decrement

set("n", "dw", 'vb"_d') -- Delete word backwards
set("n", "<C-a>", "gg<S-v>G") -- Select all

set("n", "te", ":tabedit") -- Tab Edit
set("n", "sv", ":vsplit<Return><C-w>w") -- Split vertically
set("n", "ss", ":split<cr><C-w>w") -- Split horizontally

-- Move window
set("n", "<leader>w", "<C-w>w")
set("n", "<leader>h", "<C-w>h")
set("n", "<leader>k", "<C-w>k")
set("n", "<leader>j", "<C-w>j")
set("n", "<leader>l", "<C-w>l")

-- Resize window
set("n", "<C-w><left>", "<C-w><")
set("n", "<C-w><right>", "<C-w>>")
set("n", "<C-w><up>", "<C-w>+")
set("n", "<C-w><down>", "<C-w>-")

set("n", "<S-f>", vim.lsp.buf.format) -- Format
