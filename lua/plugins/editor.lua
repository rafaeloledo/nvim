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
      if (not status) then return end
      local actions = require('telescope.actions')
      local builtin = require("telescope.builtin")

      local function telescope_buffer_dir()
        return vim.fn.expand('%:p:h')
      end

      telescope.setup {
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close
            },
          },
        },
      }

      local set = vim.keymap.set

      set('n', '<leader>gs', ':Telescope git_status<cr>')
      set('n', '<leader>gc', ':Telescope git_commits<cr>')
      set('n', '<leader>gb', ':Telescope git_branches<cr>')
      set('n', '<leader>km', ':Telescope keymaps<cr>')

      set('n', ';f',
        function()
          builtin.git_files({
            no_ignore = false,
            hidden = true
          })
        end)
      set('n', '<C-p>', function()
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end)
      set('n', ';r', function()
        builtin.live_grep()
      end)
      set('n', '\\\\', function()
        builtin.buffers()
      end)
      set('n', ';t', function()
        builtin.help_tags()
      end)
      set('n', ';;', function()
        builtin.resume()
      end)
      set('n', ';e', function()
        builtin.diagnostics()
      end)
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    opts = {
      toggler = {
        line = 'gcc',
        block = 'gbc',
      }
    },
  },
}
