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
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

local wk = require("which-key")

wk.register({
  [";f"] = { function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end, "Find Files" },
  [";r"] = { function()
    builtin.live_grep()
  end, "Live Grep" },
  [";t"] = { function()
    builtin.help_tags()
  end, "Help Tags" },
  [";;"] = { function()
    builtin.resume()
  end, "Resume" },
  [";e"] = { function()
    builtin.diagnostics()
  end, "Diagnostics" },
  ["sf"] = { function()
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
  end, "File Browser" },
  ["\\\\"] = { function()
    builtin.diagnostics()
  end, "Diagnostics" },
})
