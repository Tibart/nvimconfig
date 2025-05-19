return {
  {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["<ESC>"] = { "actions.close", mode = "n" },
      },
      float = {
        enable = true,
        -- Padding around the floating window
        padding = 2,
        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = 0.8,
        max_height = 0.8,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
        get_win_title = nil,
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = "auto",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
      override = function(conf)
        -- Customize size and position
        conf.row = 1          -- Position from top (0 = top)
        conf.col = 0          -- Position from left (0 = left)
        conf.width = math.min(vim.o.columns - 4, 80)  -- Width (up to 80 columns)
        conf.height = vim.o.lines - 6                 -- Height
        conf.border = "double"                       -- Border style: "none", "single", "double", "rounded"
        conf.zindex = 45      -- Z-index for stacking windows
        return conf
      end,
    },

  },
  vim.keymap.set("n", "-", "<CMD>lua require('oil').open_float('.')<CR>", { desc = "Open parent directory" })
}
