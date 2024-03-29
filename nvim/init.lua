require("nvimkashif.remap")
require("nvimkashif.lazy")
require("nvimkashif.treesitter")
require("nvimkashif.lualine")
require("nvimkashif.lsp")
require("nvimkashif.gitsigns")
require("nvimkashif.fzf")
require("nvimkashif.autopairs")

vim.cmd("colorscheme rose-pine-main")

vim.wo.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = "white"})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "#b4cfb8"})
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "#b4cfb8"})

vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.clipboard:append("unnamedplus")
