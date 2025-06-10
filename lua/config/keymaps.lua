-- Load utils module
local utils = require("utils")


-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Clear search highlite" })

-- Move line up or down
--vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
--vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

vim.keymap.set('n', '<leader>p', "\"_dP", { desc = "Keep clipboard after paste over text" })

-- copy/paste to/from system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', "\"+y", { desc = "Yank selection to system clipboard" })
vim.keymap.set({ 'n', 'v' }, '<leader>yy', "\"+yy", { desc = "Yank line to system clipboard" })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '\"+p', { desc = "Put system clipboard after the cursor" })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '\"+P', { desc = "Put system clipboard before the cursor" })

-- Prevent Q
vim.keymap.set('n', 'Q', '<nop>')

-- lsp
vim.keymap.set({ 'n' }, 'grd', '<cmd>lua vim.lsp.buf.definition({ loclist=true })<cr>', { desc = 'vim.lsp.buf.definition()' })

-- Buffers
vim.keymap.set({ 'n' }, 'bd', '<cmd>bdelete<cr>', { desc = 'Delete current buffer' })
vim.keymap.set({ 'n' }, 'bda', '<cmd>%bdelete<cr>', { desc = 'Delete all buffer' })

-- Set numbers highlight toggle
vim.keymap.set('n', '<leader>tl', utils.toggle_hl_linenr, { desc = 'Toggle line number highlight' })
