local opt = vim.opt
local api = vim.api

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

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
opt.shell = 'fish'
opt.inccommand = 'split'
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]

opt.incsearch = true
opt.swapfile = false
vim.wo.signcolumn = "yes"

vim.g.mapleader = " "
vim.o.showmode = true

-- Undercurl
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[let &t_Cs = "\e[4:3m"]])

opt.backupskip = { '/tmp/*', '/private/tmp/*' }
opt.backspace = { 'start', 'eol', 'indent' }
--api.nvim_command('set fillchars=eob:\\ ')

opt.path:append { '**' }
opt.wildignore:append { '*/node_modules/*' }

opt.formatoptions:append { 'r' }

api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

api.nvim_create_autocmd("BufWritePost", {
  command = ':silent! %s/\r/',
})
api.nvim_create_autocmd("BufEnter", {
  pattern = "*.inc",
  command = ':set ft=asm'
})
api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.rasi", "*.jsonc", "*.css" },
  command = 'echo ""'
})

--opt.colorcolumn = "80"
--opt.relativenumber = true
