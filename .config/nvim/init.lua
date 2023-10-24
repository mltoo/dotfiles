require("alex")
vim.o.exrc = true
vim.cmd("au! BufNewFile,BufRead *.tpp set filetype=cpp")
vim.cmd("set fsync")
