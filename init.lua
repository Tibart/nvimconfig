--require("config.options")
require("config.lazy")
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local msg = "Welcome back Tibart!"
    vim.notify(msg, vim.log.levels.INFO)
    print(msg)
  end,
})
