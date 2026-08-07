-- return {
--     {
--         "nvim-treesitter/nvim-treesitter",
--         branch = "main",
--         lazy = false,
--         build = ':TSUpdate',
--         config = function()
--             local ts = require("nvim-treesitter")
--             ts.setup({
--                 -- A list of parser names, or "all" (the five listed parsers should always be installed)
--                 -- ensure_installed = {
--                 --     "javascript",
--                 --     "typescript",
--                 --     "java",
--                 --     "rust",
--                 --     "cpp",
--                 --     "c",
--                 --     "lua",
--                 --     "vim",
--                 --     "vimdoc",
--                 --     "query"
--                 -- },
-- 
--             })
--             ts.install({"javascript", "typescript", "java", "rust", "cpp", "c", "lua", "vim", "vimdoc", "query", "markdown"})
--         end
--     },
-- }

return {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    config = function()
        require("tree-sitter-manager").setup({
            ensure_installed = {
                "javascript",
                "typescript",
                "java",
                "rust",
                "cpp",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown"
            },
            auto_install = true
        })
    end
}
