vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --move visual lines
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-j>", "<C-d>zz") --centre cursor when page jumping
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "<leader><esc>", "<cmd>noh<CR>")

vim.keymap.set("x", "<leader>p", "\"_dP") -- put without changing register

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>")

vim.keymap.set("c", "w!!", "<cmd>w ! sudo tee % > /dev/null<CR>")
vim.keymap.set("c", "wx", "<cmd>w<CR><cmd>!chmod +x %<CR>")

