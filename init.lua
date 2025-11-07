require("config.lazy")

local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4

opt.showmode = false
opt.number = true
opt.cursorline = true

opt.scrolloff = 10

opt.undofile = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- BINDS

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


require('lualine').setup()
