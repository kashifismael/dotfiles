vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ':Explore<CR>')

vim.keymap.set("n", "<leader>ff", ':FzfLua live_grep<CR>')

vim.keymap.set("n", "<leader>th", ':FzfLua colorschemes<CR>')
vim.keymap.set("n", "<leader>gc", ':FzfLua git_commits<CR>')
vim.keymap.set("n", "<leader>dv", ':FzfLua git_status<CR>')

vim.keymap.set("n", "<S-Tab>", ':bprev<CR>')
vim.keymap.set("n", "<S-q>", ':bnext<CR>')
vim.keymap.set("n", "<S-t>", ':FzfLua files<CR>')

vim.keymap.set("n", "<leader>h", ':tabprev<CR>')
vim.keymap.set("n", "<leader>l", ':tabnext<CR>')
vim.keymap.set("n", "<leader>ct", ':tabclose<CR>')
vim.keymap.set("n", "<leader>bb", ':bd<CR>')
vim.keymap.set("n", "<leader>ww", ':w<CR>')
vim.keymap.set("n", "<leader>wq", ':wq<CR>')
vim.keymap.set("n", "<leader>qq", ':q<CR>')

vim.keymap.set("n", "<leader>vs", ':vsplit<CR>')

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>j", ':ToggleTerm<CR>')
