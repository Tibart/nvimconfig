--require("config.options")
require("config.lazy")

local function get_username()
  if vim.fn.has('win32') == 1 then
    return vim.fn.expand("$USERNAME")  -- Windows
  elseif vim.fn.has('mac') == 1 or vim.fn.has('macunix') == 1 or vim.fn.has('unix') then
    return vim.fn.expand("$USER")  -- Unix/macOS
  else
    return "Unknown"
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local username = os.getenv("USER") or os.getenv("USERNAME") or "User"
    local msg = string.format("Welcome back %s!", username:gsub("^%a", string.upper))
    vim.defer_fn(function ()
      vim.api.nvim_echo({{msg, 'error'}}, false, {})
    end, 10)
  end,
})
