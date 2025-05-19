-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Clear search highlite
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Move line up or down
--vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
--vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Keeps clipboard after copy over text
vim.keymap.set('n', '<leader>p', "\"_dP")

-- copy/paste to/from system clipboard
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")
vim.keymap.set('n', '<leader>p', '\"+p')
vim.keymap.set('v', '<leader>p', '\"+p')

-- Prevent Q
vim.keymap.set('n', 'Q', '<nop>')
