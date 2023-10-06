-- https://github.com/onsails/lspkind.nvim

local status, lspkind = pcall(require, "lspkind")
if (not status) then return end

lspkind.init({
  -- DEPRECATED (use mode instead): enables text annotations
  --
  -- default: true
  -- with_text = true,

  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "󰉿 (Text)",
    Method = "󰆧 (Method)",
    Function = "󰊕 (Function)",
    Constructor = " (Constructor)",
    Field = "󰜢 (Field)",
    Variable = "󰀫 (Variable)",
    Class = "󰠱 (Class)",
    Interface = " (Interface)",
    Module = " (Module)",
    Property = "󰜢 (Property)",
    Unit = "󰑭 (Unit)",
    Value = "󰎠 (Value)",
    Enum = " (Enum)",
    Keyword = "󰌋 (Keyword)",
    Snippet = " (Snippet)",
    Color = "󰏘 (Color)",
    File = "󰈙 (File)",
    Reference = "󰈇 (Reference)",
    Folder = "󰉋 (Folder)",
    EnumMember = " (EnumMember)",
    Constant = "󰏿 (Constant)",
    Struct = "󰙅 (Struct)",
    Event = " (Event)",
    Operator = "󰆕 (Operator)",
    TypeParameter = " (TypeParameter)",
  },
})
