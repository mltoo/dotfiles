return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require('ibl').setup({
                enabled=true,
                indent = {
                    char = '▏',
                    highlight='Whitespace'
                },
                scope = {
                    highlight = {
                        "RainbowDelimiterYellow",
                        "RainbowDelimiterBlue",
                        "RainbowDelimiterOrange",
                        "RainbowDelimiterGreen",
                        "RainbowDelimiterViolet",
                        "RainbowDelimiterCyan",
                        "RainbowDelimiterRed",
                    }
                }
            })
        end
    }
}
