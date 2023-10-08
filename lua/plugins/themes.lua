return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        enabled = false,
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = true,
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    },
    {
        "folke/tokyonight.nvim",
        enabled = false,
        config = function()
            vim.cmd('colorscheme tokyonight')
        end
    },
}
