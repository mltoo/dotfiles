return {
    {
        "gelguy/wilder.nvim",
        config = function()

            local wilder = require('wilder')

            wilder.setup({
                modes = {':','/','?'}
            })

            local gradient = {
                '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
                '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
                '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
                '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
            }

            for i, fg in ipairs(gradient) do
                gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
            end

            wilder.set_option('renderer', wilder.renderer_mux({
                [':'] = wilder.popupmenu_renderer(
                    wilder.popupmenu_border_theme({
                        border = 'rounded',
                        right = {' ', wilder.popupmenu_scrollbar()},
                        left = {' ', wilder.popupmenu_devicons()},
                        highlights = {
                            gradient = gradient,
                            border = '000000'
                        },
                        pumblend = 20,
                        highlighter = wilder.highlighter_with_gradient({wilder.basic_highlighter()}),
                    })
                ),
                ['/']  = wilder.wildmenu_renderer(
                    wilder.wildmenu_airline_theme({
                        highlights = {
                            mode = 'lualine_a_replace'
                        },
                        highlighter = wilder.basic_highlighter(),
                        use_powerline_symbols = true,
                        pumblend = 0
                    })
                ),
                ['?']  = wilder.wildmenu_renderer({
                    highlighter = wilder.basic_highlighter(),
                }),
            }))
        end
    }
}
