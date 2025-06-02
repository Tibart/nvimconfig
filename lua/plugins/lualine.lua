local function num() return vim.fn.tabpagenr() end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = false,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = {num, 'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'filetype'},  --'fielformat' gives pinguin when *nix fs.
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_b = {{
          'tabs',
          mode = 1,
          max_length = vim.o.columns,
          fmt = function (name, ctx)
            return ctx.tabnr .. ':' .. name
          end,
        }},
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
