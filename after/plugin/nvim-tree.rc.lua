local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'N', api.fs.create, opts('New File'))
end

nvim_tree.setup {
  on_attach = my_on_attach,
  renderer = {
    group_empty = true,
  },
}

vim.keymap.set('n', '<C-b>', function()
  vim.cmd('NvimTreeToggle')
end)

