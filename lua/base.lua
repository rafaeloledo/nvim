vim.opt.cursorline = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
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
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.swapfile = false
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
vim.opt.formatoptions:append { 'r' }
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
vim.api.nvim_command('set fillchars=eob:\\ ')
vim.wo.signcolumn = "yes"
vim.o.showmode = false