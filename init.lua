--require("config.options")
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local username = os.getenv("USER") or os.getenv("USERNAME") or "User"
    local msg = string.format("Welcome back %s!", username:gsub("^%a", string.upper))
    local width = vim.api.nvim_win_get_width(0)
    local buf = vim.api.nvim_create_buf(false, true)
    --vim.api.nvim_buf_set_text(buf, 5, 5, 50, 50, { msg, string.format("%s", width) })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { msg,string.format("%s", width+buf) })
    vim.api.nvim_set_option_value('filetype', 'dashboard', { buf = buf })
    vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buf })
    vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = buf })
    vim.api.nvim_set_option_value('modeline', false, { buf = buf })

    vim.api.nvim_set_current_buf(buf)
    --vim.defer_fn(function ()
    --  vim.api.nvim_echo({{msg, 'error'}}, false, {})
    --end, 100)
  end,
})
