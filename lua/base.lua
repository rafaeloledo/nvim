local opt = vim.opt
local api = vim.api

vim.g.mapleader = " "

vim.cmd("language en_US.utf8")
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

vim.wo.number = true
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.inccommand = "split"
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
-- opt.wrap = false
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5
opt.background = "dark"
opt.incsearch = true
opt.swapfile = false
vim.wo.signcolumn = "yes"
vim.o.showmode = 1

-- opt.relativenumber = true
-- opt.shell = 'fish'

vim.cmd("set fileformats=unix,dos")

vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" }) -- Merge clipboards

-- Undercurl
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[let &t_Cs = "\e[4:3m"]])

opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.formatoptions:append({ "r" })

api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
api.nvim_create_autocmd("BufWritePost", {
	command = ":silent! %s/\r/",
})
api.nvim_create_autocmd("BufEnter", {
	pattern = "*.inc",
	command = ":set ft=asm",
})
api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.rasi", "*.jsonc", "*.css" },
	command = 'echo ""',
})
