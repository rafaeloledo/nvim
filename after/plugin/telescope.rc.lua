-- https://github.com/nvim-telescope/telescope.nvim

local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      hijack_netrw = true,
      respect_gitignore = false,
      theme = "dropdown",
      initial_mode = "normal",
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["n"] = fb_actions.create,
          ["p"] = fb_actions.goto_parent_dir,
          ["h"] = fb_actions.goto_cwd,
          ["/"] = function()
            vim.cmd('startinsert')
          end,
          ["<C-u>"] = function(prompt_bufnr)
            for i = 1, 10 do actions.move_selection_previous(prompt_bufnr) end
          end,
          ["<C-d>"] = function(prompt_bufnr)
            for i = 1, 10 do actions.move_selection_next(prompt_bufnr) end
          end,
          ["<PageUp>"] = actions.preview_scrolling_up,
          ["<PageDown>"] = actions.preview_scrolling_down,
        },
      },
    },
  },
}


telescope.load_extension("file_browser")
local keymap = vim.keymap

keymap.set('n', ';f', function()
  builtin.find_files({
    no_ignore = false,
    hidden = true
  })
end)

keymap.set('n', ';r', function()
  builtin.live_grep()
end)

keymap.set('n', '\\\\', function()
  builtin.buffers()
end)

keymap.set('n', ';t', function()
  builtin.help_tags()
end)

keymap.set('n', ';;', function()
  builtin.resume()
end)

keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    initial_mode = "normal",
    layout_config = { height = 24 }
  })
end)
