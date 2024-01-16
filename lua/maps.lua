local set = vim.keymap.set

set("n", "x", '"_x') -- Delete permanently

set("n", "+", "<C-a>") -- Increment
set("n", "-", "<C-x>") -- Decrement

set("n", "dw", 'vb"_d') -- Delete word backwards
set("n", "<C-a>", "gg<S-v>G") -- Select all

set("n", "te", ":tabedit") -- Tab Edit
set("n", "ss", ":split<cr><C-w>w") -- Split horizontally
set("n", "sv", ":vsplit<Return><C-w>w") -- Split vertically

-- Move window
set("n", "sh", "<C-w>h")
set("n", "sk", "<C-w>k")
set("n", "sj", "<C-w>j")
set("n", "sl", "<C-w>l")

-- Resize window
set("n", "<C-w><left>", "<C-w><")
set("n", "<C-w><right>", "<C-w>>")
set("n", "<C-w><up>", "<C-w>+")
set("n", "<C-w><down>", "<C-w>-")

set("n", "<leader>w", "<C-w>w")
set("n", "<S-f>", vim.lsp.buf.format) -- Format
set("n", "<C-b>", ":NvimTreeToggle<CR>")
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "J", ":m '>+1<CR>gv=gv")

set("n", "gd", function()
	vim.lsp.buf.definition()
end, opts)
set("n", "K", function()
	vim.lsp.buf.hover()
end, opts)
set("n", "]d", function()
	vim.diagnostic.goto_next()
end, opts)
set("n", "[d", function()
	vim.diagnostic.goto_previous()
end, opts)
set("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, opts)
set("n", "<leader>cA", function()
	vim.lsp.buf.source_action()
end, opts)
set("n", "gr", function()
	vim.lsp.buf.references()
end, opts)
set("n", "<leader>cr", function()
	vim.lsp.buf.rename()
end, opts)
set("i", "<C-k>", function()
	vim.lsp.buf.signature_help()
end, opts)
set("n", "gD", function()
	vim.lsp.buf.declaration()
end, opts)
set("n", "gI", function()
	vim.lsp.buf.implementation()
end, opts)
