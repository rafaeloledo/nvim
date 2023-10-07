return {
    { "numToStr/Comment.nvim" },
    {
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
        opts = function()
            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

            return {
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                },
                indent = {
                    enable = true,
                    disable = {},
                },
                ensure_installed = {
                    "markdown",
                    "markdown_inline",
                    "kotlin",
                    "tsx",
                    "javascript",
                    "toml",
                    "fish",
                    "php",
                    "json",
                    "yaml",
                    "java",
                    "swift",
                    "css",
                    "rust",
                    "c",
                    "html",
                    "lua"
                },
                autotag = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                }
            }
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>km", "<cmd>Telescope keymaps<cr>",    {} },
            { ";f",         "<cmd>Telescope find_files<cr>", {} },
            { ";r",         "<cmd>Telescope live_grep<cr>",  {} },
            { "sf",         "<cmd>Telescope git_files<cr>",  {} },
        },
        opts = function()
            return {
                defaults = {
                    layout_config = {
                        height = 44,
                        preview_width = 101,
                        width = 180,
                    },
                }
            }
        end
    },
}
