return {
  { "folke/lazy.nvim", version = false },
  { "norcalli/nvim-colorizer.lua", config = function ()
    require("colorizer").setup()
  end },
}
