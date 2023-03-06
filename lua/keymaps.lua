-- Set all keymaps not associated with plugins
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- gb to list buffers and populate prompt waiting for number
vim.keymap.set('n', 'gb', '<cmd>ls<CR>:b<Space>')
-- escape enters normal mode from terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
-- ctrl hjkl moves windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
--SPACE PASTE
vim.keymap.set('x', "<leader>p", "\"_dP")
--map kj to escape in insert mode
vim.keymap.set('i', 'kj', '<ESC>')
