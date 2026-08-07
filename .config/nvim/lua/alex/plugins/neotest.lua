return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "Andeshog/neotest-gtest",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local lib = require("neotest.lib")
        require("neotest").setup({
            adapters = {
                require("neotest-gtest")
            }
        })
        require("neotest-gtest").setup({
                    is_test_file = function(file)
                        local pattern = "tests?/.*/?.*%.(.*)$"
                        local _, _, ending = string.find(file, pattern, 0, false)
                        local buildFound = string.find(file, "/build/");
                        if ending ~= nil and not buildFound then
                            local acceptable = {"cpp", "cc", "c", "c++", "cppm", "cxx"}
                            for _, accEnding in ipairs(acceptable) do
                                if accEnding == ending then
                                    return true
                                end
                            end
                        end
                        return false
                    end,
                    debug_adapter = "cppdbg"
                })
    end
}
