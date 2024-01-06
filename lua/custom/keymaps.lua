-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<C-c>', '<Esc>', { silent = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<Leader>C', ':Copilot<CR>', { desc = 'Open Copilot completions' })
vim.keymap.set('n', '<leader>R', ':w<CR>:!python3 %<CR>', { desc = 'Run Python file' })
vim.keymap.set('n', '<F5>', ':w<CR>:!python3 %<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-space>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Harpoon keymaps
vim.keymap.set('n', '<leader>Hm', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Windows keymaps
vim.keymap.set('n', '<leader>nv', '<C-w>v<C-w>l:Ex<CR>', { desc = 'Open new vertical window', silent = true })
vim.keymap.set('n', '<leader>ns', '<C-w>s<C-w>l:Ex<CR>', { desc = 'Open new horizontal window', silent = true })
vim.keymap.set('n', '<leader>ml', '<C-w>l', { desc = 'Go to right window', silent = true })
vim.keymap.set('n', '<leader>mh', '<C-w>h', { desc = 'Go to left window', silent = true })
vim.keymap.set('n', '<leader>mk', '<C-w>k', { desc = 'Go to top window', silent = true })
vim.keymap.set('n', '<leader>mj', '<C-w>j', { desc = 'Go to bottom window', silent = true })

vim.api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
