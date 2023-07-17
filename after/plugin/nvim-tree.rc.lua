-- https://github.com/nvim-tree/nvim-tree.lua

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local keymap = vim.keymap

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  keymap.set('n', '<C-n>', api.fs.create, opts('Create File'))
end

-- OR setup with some options
require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  modified = {
    enable = true
  }
})
