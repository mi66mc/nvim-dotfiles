require("config.lazy")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>', { desc = "Toggle Neo-tree" })
vim.keymap.set('n', '<C-n>', '<Cmd>Neotree<CR>', { desc = "Goto Neo-tree" })
vim.keymap.set('n', '<C-]>', '<Cmd>bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<C-[>', '<Cmd>bprevious<CR>', { desc = "Previous buffer" })

vim.keymap.set('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
