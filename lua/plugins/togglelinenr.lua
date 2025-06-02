local linenr_hl = false

local function toggle_hl_linenr()
  if linenr_hl then
    vim.cmd('highlight! link LineNr LineNr')
    linenr_hl = false
  else
    vim.cmd('highlight! link LineNr RainbowYellow')
    linenr_hl = true
  end
end

vim.keymap.set('n', '<leader>tl', toggle_hl_linenr, { desc = 'Toggle line number highlight' })

return {}
