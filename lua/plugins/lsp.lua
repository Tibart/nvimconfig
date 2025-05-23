return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {  },
  },
  {
    -- Bridge betweenmason en lspconfig
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = { automatic_installation = true },
  },
  {
    -- Sets global variables like vim
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua filesevent = { "BufReadPre", "BufNewFile" },
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      local icons = {
        [vim.diagnostic.severity.ERROR] = "󰅜",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      }
      -- https://neovim.io/doc/user/diagnostic.html
      vim.diagnostic.config({
        severity_sort = true,
        signs = { text = icons },
        virtual_text = {
          source = "if_many",
          prefix = function(d) return icons[d.severity] end,
          spacing = 3,
          current_line = true,
        }
      })
      -- LSP confug

    end,
  },
}
