vim.keymap.set({ 'n', 'v' }, '<leader>pw', ':lua require("window-picker").pick_window()<CR>', { noremap = true, silent = true })
