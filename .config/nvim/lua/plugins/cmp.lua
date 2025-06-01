return {
    {
        'hrsh7th/nvim-cmp',
        -- enabled = false,
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'onsails/lspkind.nvim',
            'L3MON4D3/LuaSnip'
        },
        config = function()
            local cmp = require 'cmp'
            local lspkind = require 'lspkind'

            cmp.setup({
                completion = {
                    completeopt = 'menu,menuone,preview,noselect',
                    autocomplete = {
                        cmp.TriggerEvent.TextChanged,
                        cmp.TriggerEvent.InsertEnter,
                    },
                    keyword_length = 0,
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = "buffer" }
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                formatting = {
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = '...',
                    })
                },
                experimental = {
                    ghost_text = true
                }
            })
        end
    }
}
