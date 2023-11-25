vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ':Explore<CR>')

vim.keymap.set("n", "<leader>s", ':FzfLua live_grep<CR>')
vim.keymap.set("n", "<leader>f", ':FzfLua grep_curbuf<CR>')

vim.keymap.set("n", "<leader>th", ':FzfLua colorschemes<CR>')
vim.keymap.set("n", "<leader>gc", ':FzfLua git_commits<CR>')

vim.keymap.set("n", "<S-Tab>", ':bprev<CR>')
vim.keymap.set("n", "<S-q>", ':bnext<CR>')
vim.keymap.set("n", "<S-t>", ':FzfLua files<CR>')

vim.keymap.set("n", "<leader>h", ':tabprev<CR>')
vim.keymap.set("n", "<leader>l", ':tabnext<CR>')
vim.keymap.set("n", "<leader>ct", ':tabclose<CR>')
vim.keymap.set("n", "<leader>bb", ':bd<CR>')
vim.keymap.set("n", "<leader>ww", ':w<CR>')
vim.keymap.set("n", "<leader>dv", ':DiffviewOpen<CR>')

vim.keymap.set("n", "<leader>vs", ':vsplit<CR>')

vim.keymap.set("n", "<leader>j", ':ToggleTerm<CR>')
