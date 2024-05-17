require("nvimkashif.remap")
require("nvimkashif.lazy")
require("nvimkashif.treesitter")
require("nvimkashif.autopairs")

vim.cmd("colorscheme gruvbox")

vim.wo.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.clipboard:append("unnamedplus")
