return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                 indent = {
                     char = '▏',
                     highlight='IndentBlanklineChar'
                 },
                 whitespace = {
                     remove_blankline_trail = false,
                     highlight = {"IndentBlanklineSpaceChar"}
                 },
                 scope = {
                     highlight = {
                         "IndentBlanklineIndent1",
                         "IndentBlanklineIndent2",
                         "IndentBlanklineIndent3",
                         "IndentBlanklineIndent4",
                         "IndentBlanklineIndent5",
                         "IndentBlanklineIndent6",
                     },
                     show_end = false;
                 }
            })
        end
    }
}
