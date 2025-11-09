require("config.lazy")

local opt = vim.opt
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4

opt.showmode = false
opt.number = true
opt.cursorline = true

opt.scrolloff = 10

opt.undofile = true

opt.pumheight = 10

opt.keymodel = "startsel,stopsel"

vim.api.nvim_set_option("clipboard", "unnamed")

require('lualine').setup()
require('mini.indentscope').setup()

local builtin = require('telescope.builtin')

-- BINDS

map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

vim.keymap.set('n', '<leader>e', function()
    local winid = vim.fn.win_getid(vim.fn.bufwinnr("neo-tree filesystem"))
    if winid ~= 0 then
        if vim.fn.win_getid() == winid then
            vim.cmd("Neotree close")
        else
            vim.api.nvim_set_current_win(winid)
        end
    else
        vim.cmd("Neotree focus")
    end
end, { noremap = true, silent = true, desc = 'Toggle Neo-tree' })

vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)

map({ "n", "v" }, "<C-a>", "ggVG", opts)
map({ "n", "v" }, "<D-a>", "ggVG", opts)

map("n", "<C-s>", ":w<CR>", opts)
map("n", "<D-s>", ":w<CR>", opts)

map("n", "<C-w>", ":bd<CR>", opts)
map("n", "<D-w>", ":bd<CR>", opts)

map("n", "<C-t>", ":tabnew<CR>", opts)
map("n", "<D-t>", ":tabnew<CR>", opts)

map("n", "<C-Tab>", ":bnext<CR>", opts)
map("n", "<C-S-Tab>", ":bprevious<CR>", opts)
map("n", "<D-Tab>", ":bnext<CR>", opts)
map("n", "<D-S-Tab>", ":bprevious<CR>", opts)

map("n", "<A-Up>", ":m .-2<CR>==", opts)
map("n", "<A-Down>", ":m .+1<CR>==", opts)

map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

