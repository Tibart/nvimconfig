-- Custom telescope action to show full path
local function yank_telescope_path()
  local selection = require('telescope.actions.state').get_selected_entry()
  if selection then
    local path = selection.path or selection.filename
    if path then
      print("Full path: " .. path)
      vim.fn.setreg('+', path)
      -- print("(Copied full parth to clipboard)")
    end
  end
end

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'tsakirist/telescope-lazy.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find marks" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
    { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Find registers" },
    { "<leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "Find colorscheme" },
    { "<leader>fc",
      function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath('config') } end, desc = "Find config files"
    },
    { "<leader>fp", "<cmd>Telescope lazy<cr>", desc = "Find plugin help pages" },
  },
  config = function ()
    require("telescope").setup{
      defaults = {
        path_display = { "smart" },  -- hidden, tail, absolute, smart, shorten, truncate
        mappings = {
          i = {
            ["<C-f>p"] = yank_telescope_path,
            ["<esc>"] = require('telescope.actions').close,
          },
        }
      },
      pickers = {
        colorscheme = { enable_preview = true },
      },
      extensions = {
        lazy = {
          show_icon = true,
          mappings = {
            open_in_browser = "<cr>",
          },
          actions_opts = {
            open_in_browser = {
              auto_close = true,
            },
            change_cwd_to_plugin = {
              auto_close = true,
            },
          },
        },
      },
    }
    require("telescope").load_extension("lazy")
    require("telescope").load_extension("fzf")
  end
}
