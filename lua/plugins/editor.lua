return {
  { 'nvim-telescope/telescope-file-browser.nvim' },
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
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              -- your custom insert mode mappings
              ["i"] = {
                ["<C-w>"] = function() vim.cmd('normal vbd') end,
              },
              ["n"] = {
                -- your custom normal mode mappings
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
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

      local set = vim.keymap.set

      set('n', '<leader>gs', ':Telescope git_status<cr>')
      set('n', '<leader>gc', ':Telescope git_commits<cr>')
      set('n', '<leader>gb', ':Telescope git_branches<cr>')
      set('n', '<leader>km', ':Telescope keymaps<cr>')

      set('n', ';f',
        function()
          builtin.find_files({
            no_ignore = false,
            hidden = true
          })
        end)
      set('n', '<C-p>', function()
        builtin.git_files({
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
      set("n", "sf", function()
        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 }
        })
      end)
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local status, gitsigns = pcall(require, "gitsigns")
      if (not status) then return end

      gitsigns.setup {}
    end
  },
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
