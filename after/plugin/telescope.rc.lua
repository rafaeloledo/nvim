local status, telescope = pcall(require, "telescope")
if (not status) then
  return
end


telescope.setup {
  defaults = {
    layout_config = {
      height = 44,
      preview_width = 111,
      width = 180,
    }
  }
}

local builtin = require("telescope.builtin")

local keymap = vim.keymap

keymap.set('n', ';f', builtin.find_files, {

})
keymap.set('n', ';r', function()
  builtin.live_grep()
end)
keymap.set("n", "sf", builtin.git_files, {})
