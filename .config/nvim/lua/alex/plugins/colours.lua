return {
    'loctvl842/monokai-pro.nvim',
    lazy=false,
    priority=1000,
    dependencies = {
        {
            "NvChad/nvim-colorizer.lua",
            build = function()
                require("colorizer").setup({
                    filetypes = {'*', '!mason' };
                })
            end
        },
    },
    config = function()
        local monokai_scheme = require('monokai-pro.theme').get_scheme()
        local helper = require('monokai-pro.colors')
        require("monokai-pro").setup({
            transparent_background = false,
            devicons = true,
            terminal_colors = true,
            styles = {
                comment = { italic = true },
                type = { italic = true },
                annotation = { italic = true },
                tag_attribute = { italic = true },
                structure = { italic = true }
            },
            plugins = {rainbow_delimiters={name="rainbow_delimiters"}, indent_blankline={name="indent_blankline"}},
            --inc_search = "background",
            background_clear = { "float_win", "telescope" },
            filter = "pro",
        })
        vim.cmd.colorscheme("monokai-pro")
        vim.cmd([[set cursorline]])
        vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = monokai_scheme.editor.background, fg = monokai_scheme.base.green })
        vim.api.nvim_set_hl(0, 'CursorLine', { bg = monokai_scheme.editor.background })
        vim.api.nvim_set_hl(0, 'TelescopeSelection', {bg = helper.blend(monokai_scheme.base.green, 0.2, monokai_scheme.base.dimmed5), fg = monokai_scheme.base.green})

        vim.api.nvim_set_hl(0, 'winbarTitleEndmarker', { fg = monokai_scheme.base.magenta })
        vim.api.nvim_set_hl(0, 'winbarTitleText', { bg = monokai_scheme.base.magenta, fg = monokai_scheme.base.dimmed5, bold=true})

        vim.cmd[[set winbar=%=%#winbarTitleEndmarker#\%#winbarTitleText#\ %<%{expand('%')}\ %#winbarTitleEndmarker#\%#Normal#\ ]]
    end
}
