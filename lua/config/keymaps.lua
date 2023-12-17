local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set("n", "x", '"_x')

-- Increment/decrement
set("n", "+", "<C-a")
set("n", "-", "<C-x>")

-- Delete a word backwards
set("n", "dw", 'vb"_d')

-- Select all
set("n", "<C-a>", "ggVG")

-- Disable continuation
set("n", "<leader>o", "o<Esc>^Da", opts)
set("n", "<leader>O", "O<Esc>^Da", opts)

-- Jumplist
set("n", "<C-m>", "<C-i>", opts)

-- New tab
set("n", "te", ":tabedit")
set("n", "<tab>", ":tabnext<Return>", opts)
set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
set("n", "ss", ":split<Return>", opts)
set("n", "sv", ":vsplit<Return>", opts)
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

-- Diagnostics
set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

set("n", "<leader>r", function()
  require("rafaeloledo.utils").replaceHexWithHSL()
end)
