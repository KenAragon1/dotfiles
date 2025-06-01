return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()

            local lspconfig = require "lspconfig"
            local langs = { "lua_ls", "ts_ls", "gopls", "intelephense", "clangd" }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            for _, lang in ipairs(langs) do
                lspconfig[lang].setup {
                    capabilities = capabilities
                }
            end

            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format()
                end,
            })

            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover { border = "single", max_height = 25, max_width = 120 }
            end)
        end
    },
}
