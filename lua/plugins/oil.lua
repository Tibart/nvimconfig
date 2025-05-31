return {
  'stevearc/oil.nvim',
  dependencies = { "echasnovski/mini.icons", opts = {} },
  --  lazy = false,
  config = function ()
    local detail = false
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["<ESC>"] = { "actions.close", mode = "n" },
        ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open vertically" },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open horizontally" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
        ["<C-p>"] = { "actions.preview", mode = "n", desc = "Toggle preview" },
        ["<leader>fd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
        ["gx"] = "actions.open_external",
        ["_"] = { "actions.open_cwd", mode = "n" },
      },
      view_options = {
        show_hidden = false,
        natural_order = true,
        is_always_hidden = function (name, _)
          return name == ".." or name == ".git"
        end,
      },
      float = {
        padding = 2,
        max_width = 0.9,
        max_height = 0.9,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        get_win_title = nil,
        -- preview_split: disable_previewlit direction: "auto", "left", "right", "above", "below".
        preview_split = "right",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf) return conf end,
      },
      preview_win = {
        -- Whether the preview window is automatically updated when the cursor is moved
        update_on_cursor_moved = true,
        -- How to open the preview window "load"|"scratch"|"fast_scratch"
        preview_method = "fast_scratch",
        -- A function that returns true to disable preview on a file e.g. to avoid lag
        disable_preview = function(filename)
          return false
        end,
        -- Window-local options to use for preview window buffers
        win_options = {},
      },
    })
    vim.keymap.set("n", "<leader>o", "<CMD>lua require('oil').open_float(nil)<CR>", { desc = "Open Oil in current director" })
    vim.keymap.set("n", "<leader>O", "<CMD>lua require('oil').open_float('.')<CR>", { desc = "Open Oil in working director" })
  end,
}
