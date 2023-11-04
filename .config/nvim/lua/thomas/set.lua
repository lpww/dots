vim.opt.nu = true 
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- indentation
vim.opt.smartindent = true

-- disable line wrap
vim.opt.wrap = false

-- let undo tree handle backups and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- colors
vim.opt.termguicolors = true

-- update time
vim.opt.updatetime = 50

-- enable color column
vim.opt.colorcolumn = "80"

-- enable crosshari
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
