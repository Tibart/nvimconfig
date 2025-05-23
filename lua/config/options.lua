-- NetRw
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
-- Netrw configuration
vim.g.netrw_banner = 0        -- Hide banner
vim.g.netrw_liststyle = 3     -- Tree view
vim.g.netrw_browse_split = 4  -- Open in previous window
vim.g.netrw_winsize = 25      -- Set width to 25% of screen

vim.opt.signcolumn = "yes:1"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.spell = false
--vim.opt.spelllang = { "en_us", "nl_nl" }

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.termguicolors = true

--vim.opt.guicursor = ""
