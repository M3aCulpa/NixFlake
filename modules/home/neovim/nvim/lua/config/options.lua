-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.breakindent = true -- break indent
opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.completeopt = "menuone,noselect" -- recommended for nvim-cmp
opt.expandtab = true -- spaces instead of tabs
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- case-insensitive search
opt.mouse = "" -- no mouse
opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers
opt.shiftround = true -- round indent
opt.shiftwidth = 4 -- indent size
opt.signcolumn = 'yes' -- always show signcolumn
opt.smartcase = true -- unless \C or a capital is in the search
opt.splitbelow = true -- new windows below
opt.splitright = true -- new windows to the right
opt.tabstop = 4 -- spaces per tab
opt.termguicolors = true -- true color
opt.timeoutlen = 600 -- ms to wait between keys
opt.undofile = true -- persist undo history
opt.updatetime = 250 -- faster cursorhold
