vim.g.mapleader = " "

vim.keymap.set("n", '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "clear search hightlight" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>tt', function()
    vim.cmd.new()
    vim.cmd.term()
    vim.api.nvim_win_set_height(0, 8)
end, { desc = 'Open small terminal' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
