return {
  {
    "loctvl842/monokai-pro.nvim",
    -- lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparant_background = true,
        terminal_colors = true,
        devicons = true,
        filter = "pro",
      })
      -- vim.cmd.colorscheme("monokai-pro")
    end,
  },
  { "morhetz/gruvbox" },
  { "rebelot/kanagawa.nvim" },
  {
    'everviolet/nvim', name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'spring', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'yellow',
      },
      editor = {
        transparent_background = false,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          invert_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
    },
  },
}
