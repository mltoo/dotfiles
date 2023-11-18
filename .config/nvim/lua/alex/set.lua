vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = true
vim.opt.undodir = os.getenv("HOME").."/.cache/vim/undodir"
vim.opt.backupcopy = "yes"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = 'noma nomod rnu nowrap ro nobl'

vim.opt.laststatus = 3

vim.opt.spell = true



vim.cmd('filetype plugin on')
local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--vim.o.pumblend = 20

local monokai = require('monokai-pro.colorscheme').setup(require("monokai-pro.config").options.filter)

vim.api.nvim_set_hl(0, 'winbarTitleEndmarker', { fg = monokai.base.magenta })
vim.api.nvim_set_hl(0, 'winbarTitleText', { bg = monokai.base.magenta, fg = monokai.base.dimmed5, bold=true})

vim.cmd[[set winbar=%=%#winbarTitleEndmarker#\%#winbarTitleText#\ %<%{expand('%')}\ %#winbarTitleEndmarker#\%#Normal#\ ]]
