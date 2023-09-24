local status, builtin = pcall(require, "telescope.builtin")
if (not status) then
  return
end

local keymap = vim.keymap

keymap.set('n', ';f', builtin.find_files, {})
keymap.set('n', ';r', function()
  builtin.live_grep()
end)
keymap.set("n", "sf", builtin.git_files, {})
