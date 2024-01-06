--t [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`

-- set current theme to gruvbox
vim.cmd("colorscheme tokyonight")

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',

})
-- Function to set a random theme
function set_random_theme()
    local themes = {
        "onedark",
        "nord",
        "solarized",
        "gruvbox",
        "tokyonight",
        "dracula",
        "ayu",
        "rose-pine",
        "everforest"
    }

    -- Generate a random index
    local index = math.random(#themes)

    print("Setting theme to " .. themes[index])
    -- Set the colorscheme to the randomly selected theme
    vim.cmd("colorscheme " .. themes[index])
end

-- Map the function to <leader>tr
vim.api.nvim_set_keymap('n', '<leader>tr', ':lua set_random_theme()<CR>', { noremap = true, silent = true })

-- Map <leader>tg to set the theme back to gruxbox
vim.api.nvim_set_keymap('n', '<leader>tg', ':colorscheme gruvbox<CR>', { noremap = true, silent = true })

-- Map <leader>tg to set the theme back to tokyonight
vim.api.nvim_set_keymap('n', '<leader>tt', ':colorscheme tokyonight<CR>', { noremap = true, silent = true })
