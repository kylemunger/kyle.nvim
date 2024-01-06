function pickAndGoToWindow()
  local window_picker = require('window-picker')
  local picked_window = window_picker.pick_window()
  if picked_window then
    vim.api.nvim_set_current_win(picked_window)
  end
end

vim.keymap.set({ 'n', 'v' }, '<leader>pw', ':lua pickAndGoToWindow()<CR>', { noremap = true, silent = true })
