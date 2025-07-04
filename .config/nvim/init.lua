require("config.lazy")
require("keymaps")

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.opt.laststatus = 3

vim.opt.linebreak = true

vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.opt.scrolloff = 8

vim.opt.updatetime = 250

vim.opt.pumheight = 15
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.signcolumn = 'yes'

vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.list = false
vim.opt.listchars = {
    tab = '>> ',
    trail = '·',
    nbsp = '␣'
}

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
