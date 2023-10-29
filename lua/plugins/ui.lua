return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      local status, colorizer = pcall(require, "colorizer")
      if (not status) then return end

      colorizer.setup({
        '*',
      })
    end
  },
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
          lualine_a = { 'mode' },   -- mode
          lualine_b = { 'branch' }, -- branch
          lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
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
            'fileformat',
            'encoding',
            'filetype',
          },
          lualine_y = { 'progress' }, -- progress
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
    lazy = true,
    config = function()
      local status, icons = pcall(require, "nvim-web-devicons")
      if (not status) then return end

      icons.setup {
        -- your personnal icons can go here (to override)
        -- devicon will be appended to `name`
        override = {
        },
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true
      }
    end
  },
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

      vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
      vim.keymap.set('n', '<S-tab>', '<cmd>BufferLineCyclePrev<cr>', {})
    end
  },
}
