vim.opt.termguicolors = true    -- enable 24-bit colors

-- basic settings
vim.opt.number = true           -- line number
vim.opt.relativenumber = true   -- relative line number
vim.opt.cursorline = false       -- Highlight current line
vim.opt.wrap = false            -- Wrap lines
vim.opt.linebreak = true
vim.opt.sidescrolloff = 10      -- Keep n lines left/right cursor
vim.opt.scrolloff = 8           -- Keep n lines above/below cursor
vim.opt.swapfile = false
vim.opt.showtabline = 1

-- find files
vim.opt.path:append("**")
vim.opt.wildmenu = true

-- indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- visual settings 
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = ""
vim.opt.showmode = true
vim.opt.laststatus = 2
vim.opt.pumheight = 15
vim.o.list = true
vim.opt.listchars = "tab:» ,trail:·,extends:>,precedes:<,nbsp:+,lead:·"

-- backup
vim.opt.undofile = true

-- behaviour settings
vim.opt.mouse = 'a'
vim.o.clipboard = "unnamedplus"

-- split behaviour
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.updatetime = 250

-- floating window
vim.opt.winborder = "single"
vim.api.nvim_set_hl(0, 'NormalFloat', {
    bg = 'NONE'
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- =================================================
-- Keymaps
-- =================================================

vim.g.mapleader = " "

vim.keymap.set("n", '<leader>e', ':Ex<CR>', { desc = "Open Netrw" })

-- center screen when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- =================================================
-- plugins
-- =================================================
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug("nvim-treesitter/nvim-treesitter", { ['branch'] = 'master'})
Plug("numToStr/Comment.nvim")
Plug("williamboman/mason.nvim")
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason-lspconfig.nvim")
Plug('blazkowolf/gruber-darker.nvim')

vim.call('plug#end')

require("gruber-darker").setup({
    bold = true,
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false
    }
})
vim.cmd.colorscheme("gruber-darker")
vim.api.nvim_set_hl(0, '@property', { link = "GruberDarkerFG1" })
vim.api.nvim_set_hl(0, '@function.call', { link = "GruberDarkerFG1" })
vim.api.nvim_set_hl(0, '@type.definition', { link = "GruberDarkerFG1" })
vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = "GruberDarkerFG1" })
vim.api.nvim_set_hl(0, '@type.builtin', { link = "GruberDarkerQuartz" })
vim.api.nvim_set_hl(0, '@constant.builtin', { link = "GruberDarkerQuartz" })
vim.api.nvim_set_hl(0, '@label', { link = "GruberDarkerFG1" })

-- LSP
require("mason").setup {}
local servers = {
    omnisharp = {
        cmd = { vim.fn.stdpath('data') .. "/mason/packages/omnisharp/OmniSharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" }
    },
    pylsp = {},
    cssls = {},
    html = {},
    clangd = {},
    gopls = {},
    ts_ls = {},
    vue_ls = {},
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT', },
                diagnostics = { globals = { "vim" }, },
                workspace = { library = vim.api.nvim_get_runtime_file("", true), },
                telemetry = { enable = false, },
            },
        }
    }
}

for server, config in pairs(servers) do
    vim.lsp.config[server] = config
    vim.lsp.enable(server)
end

-- format buffer command
vim.api.nvim_create_user_command('Format', function(_)
    vim.lsp.buf.format()
end, {});

vim.diagnostic.config({
    virtual_text = true
})

-- Treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    modules = {},
    ignore_install = {},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true }
})

vim.highlight.priorities.semantic_tokens = 95

