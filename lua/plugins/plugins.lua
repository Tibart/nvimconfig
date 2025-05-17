return {
  { "folke/lazy.nvim", version = false },
  { "LazyVim/LazyVim", version = false },
  { "manasthakur/vim-commentor" },
  { "norcalli/nvim-colorizer.lua", config = function ()
    require("colorizer").setup()
  end },
}
