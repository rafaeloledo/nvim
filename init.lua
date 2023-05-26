local has = vim.fn.has
local is_wsl = has "wsl"
local is_win = has "win32"

if is_wsl then require('rafaelledo.wsl') end
if is_win then require('rafaelledo.windows') end

require('rafaelledo.base')
require('rafaelledo.highlights')
require('rafaelledo.maps')
require('rafaelledo.plugins')
require('rafaelledo.wrap')
