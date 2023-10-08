return {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "mfussenegger/nvim-jdtls" },
    { "jose-elias-alvarez/null-ls.nvim" },
    {
        "nvimdev/lspsaga.nvim",
        opts = function()
            return {
                ui = {
                    border = 'rounded',
                },
                symbol_in_winbar = {
                    enable = false
                },
                lightbulb = {
                    enable = false
                },
                outline = {
                    layout = 'float'
                }
            }
        end,
        keys = {
            { "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
            { "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>" },
            { "K", "<Cmd>Lspsaga hover_doc<CR>" },
            { "gd", "<Cmd>Lspsaga finder<CR>" },
            { "gt", "<Cmd>Lspsaga goto_type_definition<CR>" },
            { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
            { "gp", "<Cmd>Lspsaga peek_definition<CR>" },
            { "gr", "<Cmd>Lspsaga rename<CR>" },
            { "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
        },
    },
}
