return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
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
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      local status, telescope = pcall(require, "telescope")
      if (not status) then
        return
      end

      local actions = require "telescope.actions"

      telescope.setup {
        defaults = {
          layout_config = {
            height = 55,
            preview_width = 120,
            width = 200,
          },
        }
      }

      local builtin = require("telescope.builtin")

      -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
      local set = vim.keymap.set

      set('n', '<leader>gs', '<cmd>Telescope git_status<CR>')
      set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>')
      set('n', '<leader>km', function()
        builtin.keymaps()
      end)
      set('n', ';f', builtin.find_files, {

      })
      set('n', ';r', function()
        builtin.live_grep()
      end)
      set("n", "sf", builtin.git_files, {})
    end,
  },
  { 'nvim-lua/plenary.nvim' },
}
