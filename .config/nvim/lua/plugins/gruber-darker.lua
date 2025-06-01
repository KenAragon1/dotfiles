return { {
    'thimc/gruber-darker.nvim',
    config = function()
        require('gruber-darker').setup({
        })
        vim.cmd.colorscheme('gruber-darker')
    end,
} }
