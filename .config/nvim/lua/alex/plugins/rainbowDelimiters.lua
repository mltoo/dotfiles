return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        dependencies={
            'loctvl842/monokai-pro.nvim',
        },
        config = function()
            require('rainbow-delimiters.setup').setup({})
        end
    }
}
