local monokai = require('monokai-pro.colorscheme').setup(require("monokai-pro.config").options.filter)
local dap, dapui = require("dap"), require("dapui")

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", {})
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", {})
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", {})
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", {})
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", {})
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log point message: '))<CR>", {})
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", {})
vim.keymap.set("n", "<leader>d<tab>", ":lua require'dapui'.toggle()<CR>", {})

vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = monokai.base.red })
vim.api.nvim_set_hl(0, 'DapStopped', { fg = monokai.base.yellow })
vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = monokai.base.dimmed2 })

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpointRejected' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogpoint', { text = '', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped' })

require('mason').setup()
local Terminal = require('toggleterm.terminal').Terminal
local mason_registry = require('mason-registry')
mason_registry.refresh(function()
    local cppToolsPath = mason_registry.get_package("cpptools"):get_install_path()
    local path = {}
    path.cppToolsBin = cppToolsPath .. '/extension/debugAdapters/bin/OpenDebugAD7'

    dap.adapters.cppdbg = function(cb, config)
        if config.preLaunchTask then
            Terminal:new({
                cmd = config.preLaunchTask,
                close_on_exit = false,
                auto_scroll = true,
                direction = 'float',
                float_opts = { winblend = 20 },
                start_in_insert = false,
                on_open = function (term)
                    print(vim.inspect(term))
                    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-c><cmd>quit<CR>", {noremap=true, silent=true})
                end,
                on_exit = function(term, job, exit_code, name)
                    if (exit_code == 0) then
                        term:close()
                        cb({
                            id = 'cppdbg',
                            type = 'executable',
                            command = path.cppToolsBin,
                        })
                    end
                end
            }):open()
        else
            cb({
                id = 'cppdbg',
                type = 'executable',
                command = path.cppToolsBin
            })
        end
    end

    local command_callbacks = { function()
        return { 'test' }
    end,
    }
    command_callbacks['shellCommand.execute'] = function(command, args)
        local lines = {}
        for line in string.gmatch(vim.fn.system(args["command"]), "[^\r\n]+") do
            table.insert(lines, line)
        end
        return lines
    end

    require('dap.ext.vscode').load_launchjs(nil, { codelldb = { 'cpp' }, cppdbg = { 'cpp' } }, command_callbacks)
    if not dap.configurations.cpp then
        dap.configurations.cpp = {}
    end
    table.insert(dap.configurations.cpp,
        {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false
        }
    )
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end)

dapui.setup({
    layouts = { {
        elements = { {
            id = "breakpoints",
            size = 0.25
        }, {
            id = "stacks",
            size = 0.25
        }, {
            id = "scopes",
            size = 0.25
        }, {
            id = "watches",
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
    } },
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
    show_stop_reason = true,
    commented = false,
    only_first_definition = false,
    all_references = true
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
