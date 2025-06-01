local function nightowl()
    local colors = {
        bg       = '#092236',
        fg       = '#d6deeb',
        yellow   = '#ffe484',
        cyan     = '#7fdbca',
        darkblue = '#011221',
        green    = '#22da6e',
        orange   = '#f78c6c',
        violet   = '#c792ea',
        magenta  = '#d6a6e1',
        blue     = '#82aaff',
        red      = '#ef5350',
    }

    return {
        normal = {
            a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
        },
        insert = {
            a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
        },
        visual = {
            a = { fg = colors.bg, bg = colors.violet, gui = 'bold' },
        },
        replace = {
            a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
        },
        command = {
            a = { fg = colors.bg, bg = colors.orange, gui = 'bold' },
        },
        inactive = {
            a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
        },
    }
end

return {
    {
        'nvim-lualine/lualine.nvim',
        enabled = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = nightowl()
                }
            })
        end
    }
}
