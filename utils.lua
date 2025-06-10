local M = {}

local linenr_hl = false

function M.toggle_hl_linenr()
  if linenr_hl then
    vim.cmd('highlight! link LineNr LineNr')
    linenr_hl = false
  else
    vim.cmd('highlight! link LineNr RainbowYellow')
    linenr_hl = true
  end
end

return M
