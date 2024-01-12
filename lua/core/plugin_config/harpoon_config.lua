-- Harpoon keymaps
vim.keymap.set('n', '<leader>Hm', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })

local function run_python_in_tmux_right()
    -- Save the current file
    vim.cmd(':w')

    -- Get the current file name
    local file_name = vim.fn.expand('%')

    -- Send the python3 run command to the tmux pane on the right
    require('harpoon.tmux').sendCommand('{right-of}', 'python3 ' .. file_name)
    vim.fn.system('tmux send-keys -t {right-of} Enter')

    -- Navigate to the tmux pane on the right
    -- require('harpoon.tmux').gotoTerminal('{right-of}')
end

local function run_python_with_args_in_tmux_right()
    -- Save the current file
    vim.cmd(':w')

    -- Get the current file name
    local file_name = vim.fn.expand('%')

    -- Prompt for custom arguments
    local args = vim.fn.input('Enter Python arguments: ')

    -- Send the python3 run command with custom arguments to the tmux pane on the right
    require('harpoon.tmux').sendCommand('{right-of}', 'python3 ' .. file_name .. ' ' .. args)
    vim.fn.system('tmux send-keys -t {right-of} Enter')
end

vim.api.nvim_create_user_command('RunPythonTmuxRight', run_python_in_tmux_right, {})
vim.api.nvim_create_user_command('RunPythonTmuxRightWithArgs', run_python_with_args_in_tmux_right, {})
vim.keymap.set('n', '<leader>rt', ':RunPythonTmuxRight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ra', ':RunPythonTmuxRightWithArgs<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rT', ':RunPythonTmuxRight<CR>:lua require("harpoon.tmux").gotoTerminal("{right-of}")<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rA', ':RunPythonTmuxRightWithArgs<CR>:lua require("harpoon.tmux").gotoTerminal("{right-of}")<CR>', { noremap = true, silent = true })
