return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            local status_ok, toggleterm = pcall(require, "toggleterm")
            if not status_ok then
                return
            end

            toggleterm.setup({
                size = 20,
                open_mapping = [[<leader>t]],
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                persist_size = true,
                close_on_exit = true,
                shell = vim.o.shell,
                insert_mappings = false
            })

            function _G.set_terminal_keymaps()
                local opts = {noremap = true}
                vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            end

            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end
    }
}
