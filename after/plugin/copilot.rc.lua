vim.g.copilot_filetypes = { ["*"] = true }

vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]

vim.g.copilot_no_tab_map = true

-- <M-]> dismiss the current suggestion
-- <C-a> accept the current suggestion
-- <M-[> dismiss the current suggestion
