local has = vim.fn.has
local is_wsl = has "wsl"
local is_win = has "win32"

if is_wsl then require('rafaelledo.wsl') end
if is_win then require('rafaelledo.windows') end

require('rafaelledo.base')
require('rafaelledo.highlights')
require('rafaelledo.maps')
require('rafaelledo.plugins')

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
