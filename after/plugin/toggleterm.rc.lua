-- https://github.com/akinsho/toggleterm.nvim

local toggleterm = require('toggleterm')

toggleterm.setup {
  size = 20,
  open_mapping = [[<c-t>]],
  direction = "float",
}
