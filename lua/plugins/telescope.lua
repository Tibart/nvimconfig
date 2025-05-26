local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Custom telescope action to show full path
local function show_telescope_path(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if selection then
    local path = selection.path or selection.filename
    if path then
      -- Close telescope first
      --actions.close(prompt_bufnr)
      -- Show path
      print("Full path: " .. path)
      vim.fn.setreg('+', path)
      --print("(Copied full parth to clipboard)")
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
      function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath('config') } end,
      desc = "Find config files"
    },
  },
  config = function ()
    require("telescope").setup{
      defaults = {
        path_display = { "smart" },  -- hidden, tail, absolute, smart, shorten, truncate
        mappings = {
          i = {
            ["<C-g>p>"] = show_telescope_path,
          },
          n = {
            ["<C-g>p"] = show_telescope_path,
          },
        }
      },
    }
  end
}
