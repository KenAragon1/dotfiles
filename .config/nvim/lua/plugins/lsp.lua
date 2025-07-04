return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'lsp: ' .. desc })
                    end

                    map('grn', vim.lsp.buf.rename, 'Rename')
                    map('gra', vim.lsp.buf.code_action, 'Go to code action', { 'n', 'x' })
                    map('grr', require('telescope.builtin').lsp_references, 'Go to reference')
                    map('gri', require('telescope.builtin').lsp_implementations, 'Go to implementations')
                    map("K", function()
                        vim.lsp.buf.hover { border = "single", max_height = 25, max_width = 120 }
                    end, 'Show code details')
                end
            })

            require("mason").setup()
            local servers = {
                bashls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = {
                                    'vim',
                                    'require'
                                },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            -- Do not send telemetry data containing a randomized but unique identifier
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                clangd = {
                    root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
                },
                gopls = {},
                ts_ls = {},
                omnisharp = {
                    cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp.dll" },
                    root_markers = { ".sln", ".csproj", "omnisharp.json", "function.json" }
                },
            }
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = {},
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', capabilities,
                            require('cmp_nvim_lsp').default_capabilities(capabilities))
                        require("lspconfig")[server_name].setup(server)
                    end
                }
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format()
                end,
            })

            vim.diagnostic.config {
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    }
                },
                virtual_text = {
                    source = 'if_many',
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end
                }
            }
        end
    },
}
