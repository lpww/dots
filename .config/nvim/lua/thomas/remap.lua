-- map leader
vim.g.mapleader = " "

-- file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor position during common operations
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader>Y", [["*y$]])

-- unbind Q
vim.keymap.set("n", "Q", "<nop>")

-- search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- switch to previous file
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- create splits
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>h", "<C-w>s")

-- resize splits
vim.keymap.set("n", "<Left>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<Up>", ":horizontal resize -1<CR>")
vim.keymap.set("n", "<Down>", ":horizontal resize +1<CR>")

-- navigate splits
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":Glow<CR>")
