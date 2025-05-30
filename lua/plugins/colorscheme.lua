--return {
--	{ "loctvl842/monokai-pro.nvim" },
--	{
--		"LazyVim/LazyVim",
--		lazy = false,
--		priority = 1000,
--		opts = {
--			colorscheme = "monokai-pro",
--		},
--	},
--}
return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparant_background = true,
        terminal_colors = true,
        devicons = true,
        filter = "pro",
      })
      vim.cmd.colorscheme("monokai-pro")
      -- transparent background
      --vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      --vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      --vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
      --vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    end,
  },
}
