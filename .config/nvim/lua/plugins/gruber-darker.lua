return {
    {
        "blazkowolf/gruber-darker.nvim",
        config = function()
            require('gruber-darker').setup({
                bold = false,
                italic = {
                    strings = false,
                    comments = false
                },
            })
            vim.cmd.colorscheme("gruber-darker")
            vim.api.nvim_set_hl(0, "GruberDarkerDarkNiagara", { fg = "#708090" })
            vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "#282828" })
            vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "#72d9cf", bg = "#282828" })
        end,
    }
}
