return {
    { "onsails/lspkind-nvim" },
    {
        "norcalli/nvim-colorizer.lua",
        opts = function()
            return {
                '*',
            }
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            return {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    disabled_filetypes = {}
                },
                sections = {
                    lualine_a = { '' }, -- Mode
                    lualine_b = { '' }, -- Branch
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
                        'filesize',
                        'encoding',
                    },
                    lualine_y = { '' }, -- Progress
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
        "akinsho/nvim-bufferline.lua",
        event = "VeryLazy",
        keys = {
            { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", {} },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {} },
        },
        opts = function()
            return {
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
            }
        end
    },
    { "lewis6991/gitsigns.nvim" },
    {
        "dinhhuy258/git.nvim",
        opts = function()
            return {
                keymaps = {
                    -- Open blame window
                    blame = "<Leader>gb",
                    -- Open file/folder in git repository
                    browse = "<Leader>go",
                }
            }
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<C-b>", "<cmd>NvimTreeToggle<cr>", {} },
        },
        opts = function()
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

            return {
                on_attach = my_on_attach,
                renderer = {
                    group_empty = true,
                },
            }
        end
    },
    { "nvim-tree/nvim-web-devicons" },
}
