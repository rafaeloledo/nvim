local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

local wk = require("which-key")

wk.register({
  ["gd"] = { "<Cmd>Lspsaga lsp_finder<CR>", "Lspsaga Finder" },
  ["gp"] = { "<Cmd>Lspsaga preview_definition<CR>", "Lspsaga Preview Definition" },
  ["gr"] = { "<Cmd>Lspsaga rename<CR>", "Lspsaga Rename" },
  [";d"] = { "<Cmd>Lspsaga goto_definition<CR>", "Lspsaga Go To Definition" },
})
