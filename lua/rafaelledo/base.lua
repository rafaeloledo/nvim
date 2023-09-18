-- vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.nu = true
-- vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false         -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.swapfile = false

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
--vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

vim.api.nvim_create_autocmd("BufWritePost", {
  command = ':silent! %s/\r/',
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.inc",
  command = ':set ft=asm'
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.rasi", "*.jsonc", "*.css" },
  command = 'echo ""'
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
-- vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
vim.api.nvim_command('set fillchars=eob:\\ ')
vim.wo.signcolumn = "yes"
--vim.o.showmode = false
