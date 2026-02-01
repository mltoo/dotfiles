return {
    {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        {
            "neovim/nvim-lspconfig",
        },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
    },
        init = function()
            local cmp = require('cmp')
            local mason = require("mason")

            require("mason").setup({
                ui = {
                    border = "single"
                }
            })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({select = true}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                })
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select}
            --local cmp_mappings = lsp.defaults.cmp_mappings({
            --})

            --lsp.setup_nvim_cmp({
            --    mapping = cmp_mappings
            --})
            --
            vim.diagnostic.config({
                virtual_text = true
            })
            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover({border = 'rounded'})<cr>", opts)
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = "LSP Actions",
                callback = function()

                    local opts = {buffer = bufnr, remap=false}
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                    --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vws", ":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols(require'telescope.themes'.get_dropdown())<CR>", opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "<leader>vD", ":lua require'telescope.builtin'.diagnostics({winblend = 20})<CR>", opts)
                    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set({"n", "v"}, "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrr", ":lua require'telescope.builtin'.lsp_references(require'telescope.themes'.get_dropdown())<CR>", opts)
                    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "<C-f>", function() vim.lsp.buf.format() end, opts)
                end
            })

            --lsp.skip_server_setup({'jdtls'})

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.colorProvider = {
                dynamicRegistration = true
            }

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'pyright',
                    'html',
                    'cssls',
                    'bashls',
                    'clangd',
                    'texlab',
                    'tailwindcss',
                    'lemminx',
                    'yamlls',
                    'ts_ls',
                },
                handlers = {
            --        lsp.default_setup,
                    tailwindcss = function()
                        require('lspconfig').tailwindcss.setup({
                            on_attach = function(client, bufnr)
                                if client.server_capabilities.colorProvider then
                                    require("document-color").buf_attach(bufnr)
                                end
                            end
                        })
                    end,
                    clangd = function()
                        require('lspconfig').clangd.setup({
                            capabilities = capabilities,
                            cmd = {
                                "clangd",
                                "--background-index",
                                "--clang-tidy",
                                "--header-insertion=iwyu",
                                "-j", "8",
                                "--header-insertion-decorators"
                            }
                        })
                    end,
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = {
                                            "vim"
                                        }
                                    }
                                }
                            }
                        })
                    end
                }
            })
            require('lspconfig').ts_ls.setup({})
            cmp.setup({
                preselect = "item",
                completion = {
                    completeopt = "menu,menuone,noinsert"
                },
            })
            --lsp.setup()
        end
    }
}

