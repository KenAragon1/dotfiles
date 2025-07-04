return {
    {
        "junegunn/goyo.vim",
        init = function()
            vim.g.goyo_width = 100
            vim.g.goyo_linenr = false
        end,
        config = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "GoyoEnter",
                callback = function()
                    vim.cmd("set noruler")
                end
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "GoyoLeave",
                callback = function()
                    vim.cmd("set ruler")
                end
            })
        end
    }
}
