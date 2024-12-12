#local monokai = require('monokai-pro.colorscheme').setup(require("monokai-pro.config").options.filter)
local monokai = require('monokai-pro.colorscheme').get("pro")
local helper = require('monokai-pro.color_helper')

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
    --inc_search = "background",
    background_clear = { "float_win", "telescope" },
    filter = "pro",
})

vim.cmd([[colorscheme monokai-pro]])
vim.cmd([[set cursorline]])
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = monokai.editor.background, fg = monokai.base.green })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = monokai.editor.background })
vim.api.nvim_set_hl(0, 'TelescopeSelection', {bg = helper.blend(monokai.base.green, 0.2, monokai.base.dimmed5), fg = monokai.base.green})
