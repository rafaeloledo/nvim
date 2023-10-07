return {
    {
        "windwp/nvim-autopairs",
        opts = function()
            return {
                disable_filetype = { "TelescopePrompt", "vim" },
            }
        end
    },
    { "windwp/nvim-ts-autotag" },
}
