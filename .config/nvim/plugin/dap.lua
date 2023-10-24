local monokai = require('monokai-pro.colorscheme').setup(require("monokai-pro.config").options.filter)

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", {})
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", {})
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", {})
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", {})
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", {})
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log point message: '))<CR>", {})
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", {})

vim.api.nvim_set_hl(0, 'DapBreakpoint', {fg=monokai.base.red})
vim.api.nvim_set_hl(0, 'DapStopped', {fg=monokai.base.yellow})
vim.api.nvim_set_hl(0, 'DapBreakpointRejected', {fg=monokai.base.dimmed2})

vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpoint'})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='DapBreakpointRejected'})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DapBreakpoint'})
vim.fn.sign_define('DapLogpoint', {text='', texthl='DapBreakpoint'})
vim.fn.sign_define('DapStopped', {text='', texthl='DapStopped'})

require('dapui').setup({
    layouts = {{
        elements = { {
                id = "watches",
                size = 0.25
            }, {
                id = "scopes",
                size = 0.25
            }, {
                id = "stacks",
                size = 0.25
            }, {
                id = "breakpoints",
                size = 0.25
            }
        },
        position = "left",
        size = 40
    }, {
        elements = { {
                id = "repl",
                size = 0.5
            }, {
                id = "console",
                size = 0.5
            }
        },
        position = "bottom",
        size = 10
    }},
    icons = {
        collapsed = '',
        current_frame = '',
        expanded = ''
    },
    mappings = {
        edit = 'c',
        remove = "dd",
        repl = "R",
        toggle = "<C-t>"
    },
})

require("nvim-dap-virtual-text").setup({
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = true,
    show_stop_reason = true;
    commented = false,
    only_first_definition = false,
    all_references = true
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
