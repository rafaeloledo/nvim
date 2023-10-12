return {
  { 'norcalli/nvim-colorizer.lua' },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local status, lualine = pcall(require, "lualine")
      if (not status) then return end

      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'solarized_dark',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {}
        },
        sections = {
          lualine_a = { 'mode' },   -- Mode
          lualine_b = { 'branch' }, -- Branch
          lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
          } },
          lualine_x = {
            {
              'diagnostics',
              sources = { "nvim_diagnostic" },
              symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = ' '
              }
            },
            'filetype',
            'encoding',
          },
          lualine_y = { 'progress' }, -- Progress
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
          } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { 'fugitive' }
      }
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      local status, icons = pcall(require, "nvim-web-devicons")
      if (not status) then return end

      icons.setup {
        -- your personnal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {
        },
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true
      }
    end
  },
  { 'lewis6991/gitsigns.nvim' },
  { 'dinhhuy258/git.nvim' },
  {
    'akinsho/nvim-bufferline.lua',
    config = function()
      local status, bufferline = pcall(require, "bufferline")
      if (not status) then return end

      bufferline.setup({
        options = {
          mode = "tabs",
          separator_style = 'slant',
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true
        },
        highlights = {
          separator = {
            fg = '#073642',
            bg = '#002b36',
          },
          separator_selected = {
            fg = '#073642',
          },
          background = {
            fg = '#657b83',
            bg = '#002b36'
          },
          buffer_selected = {
            fg = '#fdf6e3',
            bold = true,
          },
          fill = {
            bg = '#073642'
          }
        },
      })

      vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
      vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
    end
  },
}
