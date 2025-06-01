return {
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        enabled = false,
        priority = 1000,
        config = function()
            vim.schedule(function()
                vim.opt.background = "dark"
                vim.cmd("colorscheme PaperColor")
            end)
        end,
    }
}
