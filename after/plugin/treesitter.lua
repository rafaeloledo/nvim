local status, ts = pcall(require, "nvim-treesitter.configs")

ts.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  sync_install = false,
  auto_install = true,
  ensure_installed = {
    "vimdoc",
    "python",
    "markdown",
    "markdown_inline",
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua",
    "c",
    "rust"
  },
}

