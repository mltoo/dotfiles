local builtin = require('telescope.builtin')

require('telescope').setup({
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

require('telescope').load_extension("ui-select")
