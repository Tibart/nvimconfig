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
    { "<leader>fc",
      function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath('config') } end, desc = "Find config files"
    },
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
    }
    require("telescope").load_extension("fzf")
  end
}
