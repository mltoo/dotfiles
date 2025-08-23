return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" }
        },
        config = function()
            local builtin = require("telescope.builtin")

            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_cursor()
                    }
                }
            })

            vim.keymap.set('n', '<leader>pf',":lua require'telescope.builtin'.find_files({winblend=20})<CR>", {})
            vim.keymap.set('n', '<C-p>', ":lua require'telescope.builtin'.git_files()<CR>", {})
            vim.keymap.set('n', '<leader>ps', ":lua require'telescope.builtin'.live_grep({winblend=20})<CR>", {})
            vim.keymap.set('n', '<leader>po', ":lua require'telescope.builtin'.buffers({winblend=20})<CR>", {})
            vim.keymap.set('n', '<leader>pc', ":lua require'telescope.builtin'.lsp_document_symbols({winblend=20})<CR>", {})
            vim.keymap.set('n', '<leader>pC', ":lua require'telescope.builtin'.lsp_workspace_symbols({winblend=20})<CR>", {})

            require("telescope").load_extension("ui-select")

        end
    },
}
