local status, telescope = pcall(require, "telescope")
if (not status) then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    layout_config = {
      height = 44,
      preview_width = 101,
      width = 180,
    },
  }
}

local builtin = require("telescope.builtin")

local keymap = vim.keymap

keymap.set('n', '<leader>km', function()
  builtin.keymaps()
end)
keymap.set('n', ';f', builtin.find_files, {

})
keymap.set('n', ';r', function()
  builtin.live_grep()
end)
keymap.set("n", "sf", builtin.git_files, {})
