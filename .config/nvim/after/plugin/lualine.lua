require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'monokai-pro',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        ignore_focus = {
            'packer',
            'watches',
            'scopes',
            'stacks',
            'breakpoints',
        },
        refresh = {
            statusline = 1000
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    }
}
