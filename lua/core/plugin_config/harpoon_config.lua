-- Harpoon keymaps
vim.keymap.set('n', '<leader>Hm', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
