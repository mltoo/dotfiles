local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.ensure_installed({
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
	'tsserver'
})

local cmp_select = { behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap=false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	--vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vws", ":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols(require'telescope.themes'.get_dropdown())<CR>", opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vD", ":lua require'telescope.builtin'.diagnostics({winblend = 20})<CR>", opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	--vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrr", ":lua require'telescope.builtin'.lsp_references(require'telescope.themes'.get_dropdown())<CR>", opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<C-f>", function() vim.lsp.buf.format() end, opts)
end)

lsp.configure("lua_ls", {
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

lsp.skip_server_setup({'jdtls'})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.colorProvider = {
    dynamicRegistration = true
}

require('mason-lspconfig').setup({
    handlers = {
        lsp.default_setup,
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
    }
})

cmp.setup({
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert"
    },
})


lsp.setup()


