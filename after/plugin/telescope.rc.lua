local status, telescope = pcall(require, "telescope")
if (not status) then return end
-- local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local keymap = vim.keymap

keymap.set('n', '<leader>pf', function()
  builtin.find_files({
    no_ignore = false,
    hidden = true
  })
end)

keymap.set('n', '<C-p>', builtin.git_files, {})

keymap.set('n', '<leader>ps', function()
  builtin.live_grep()
end)

keymap.set('n', '<leader>vh', function()
  builtin.help_tags()
end)
