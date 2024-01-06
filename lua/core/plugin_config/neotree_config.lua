-- Function to switch between netrw and neotree if netrw is the only window open
local function toggle_tree()
  if #vim.api.nvim_list_wins() == 1 then
    if vim.bo.filetype == 'netrw' then
      local current_win_id = vim.api.nvim_get_current_win()
      vim.cmd('Neotree')
      vim.api.nvim_win_close(current_win_id, false)
    else
      vim.cmd('Neotree')
    end
  else
    vim.cmd('Neotree')
  end
end

vim.api.nvim_create_user_command('ToggleTree', toggle_tree, {})

vim.keymap.set({ 'n', 'v' }, '<leader>tc', ':Neotree close<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>-', ':Neotree close<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader><tab>', ':ToggleTree<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>=', ':ToggleTree<CR>', { noremap = true, silent = true })
