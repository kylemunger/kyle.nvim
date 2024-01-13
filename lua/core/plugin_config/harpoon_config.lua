-- Harpoon keymaps
vim.keymap.set('n', '<leader>Hm', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Hp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })

local function run_python_in_tmux(pane, prompt_for_args, go_to_pane)
    -- Save the current file
    vim.cmd(':w')

    -- Get the full path of the current file
    local file_path = vim.fn.expand('%:p')
    -- Extract the directory and filename (leaf)
    local dir_path = vim.fn.fnamemodify(file_path, ':h')
    local file_name = vim.fn.fnamemodify(file_path, ':t')

    -- Prompt for additional arguments if needed
    local additional_args = ''
    if prompt_for_args then
        additional_args = vim.fn.input('Enter args: ')
    end

    -- Change directory and send the python3 run command to the specified tmux pane
    local command = 'cd ' .. dir_path .. ' && python3 ' .. file_name .. ' ' .. additional_args
    require('harpoon.tmux').sendCommand(pane, command)
    vim.fn.system('tmux send-keys -t ' .. pane .. ' Enter')

    -- Navigate to the tmux pane if required
    if go_to_pane then
        require('harpoon.tmux').gotoTerminal(pane)
    end
end

-- 1-4: No args, no goto
vim.keymap.set('n', '<leader>rh', function() run_python_in_tmux('{left-of}', false, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux left pane, no args, no goto' })
vim.keymap.set('n', '<leader>rj', function() run_python_in_tmux('{below-of}', false, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux bottom pane, no args, no goto' })
vim.keymap.set('n', '<leader>rk', function() run_python_in_tmux('{above-of}', false, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux top pane, no args, no goto' })
vim.keymap.set('n', '<leader>rl', function() run_python_in_tmux('{right-of}', false, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux right pane, no args, no goto' })
vim.keymap.set('n', '<leader>rs', function() run_python_in_tmux('std', false, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux std pane, no args, no goto' })

-- 5-8: No args, but goto
vim.keymap.set('n', '<leader>rH', function() run_python_in_tmux('{left-of}', false, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux left pane, no args, goto pane' })
vim.keymap.set('n', '<leader>rJ', function() run_python_in_tmux('{below-of}', false, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux bottom pane, no args, goto pane' })
vim.keymap.set('n', '<leader>rK', function() run_python_in_tmux('{above-of}', false, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux top pane, no args, goto pane' })
vim.keymap.set('n', '<leader>rL', function() run_python_in_tmux('{right-of}', false, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux right pane, no args, goto pane' })
vim.keymap.set('n', '<leader>rS', function() run_python_in_tmux('std', false, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux std pane, no args, goto pane' })

-- 9-12: Args, no goto
vim.keymap.set('n', '<leader>rah', function() run_python_in_tmux('{left-of}', true, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux left pane with args, no goto' })
vim.keymap.set('n', '<leader>raj', function() run_python_in_tmux('{below-of}', true, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux bottom pane with args, no goto' })
vim.keymap.set('n', '<leader>rak', function() run_python_in_tmux('{above-of}', true, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux top pane with args, no goto' })
vim.keymap.set('n', '<leader>ral', function() run_python_in_tmux('{right-of}', true, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux right pane with args, no goto' })
vim.keymap.set('n', '<leader>ras', function() run_python_in_tmux('std', true, false) end, { noremap = true, silent = true, desc = 'Run Python in tmux std pane with args, no goto' })

-- 13-16: Args and goto
vim.keymap.set('n', '<leader>raH', function() run_python_in_tmux('{left-of}', true, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux left pane with args, goto pane' })
vim.keymap.set('n', '<leader>raJ', function() run_python_in_tmux('{below-of}', true, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux bottom pane with args, goto pane' })
vim.keymap.set('n', '<leader>raK', function() run_python_in_tmux('{above-of}', true, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux top pane with args, goto pane' })
vim.keymap.set('n', '<leader>raL', function() run_python_in_tmux('{right-of}', true, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux right pane with args, goto pane' })
vim.keymap.set('n', '<leader>raS', function() run_python_in_tmux('std', true, true) end, { noremap = true, silent = true, desc = 'Run Python in tmux std pane with args, goto pane' })

