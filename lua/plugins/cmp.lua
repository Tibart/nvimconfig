return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts = {
    keymap = {
      preset = 'super-tab',
      ['<C-bs>'] = { 'cancel' }
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      trigger = { show_on_trigger_character = true },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 400,
      },
      menu = {
        auto_show = true,
        draw = { treesitter = { 'lsp' } },
      },
      ghost_text = { enabled = true },
    },
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
