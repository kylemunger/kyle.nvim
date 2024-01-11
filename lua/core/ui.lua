--t [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`

-- set current theme to gruvbox
vim.cmd("colorscheme ayu")

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',

})

function set_random_of_top_themes()
  local themes = {
    "dracula",
    "ayu",
    "rose-pine",
    "everforest",
    "abstract",
    "afterglow",
    "alduin",
    "gruvbox",
    "scheakur",
    "hybrid",
    "jellybeans",
  }

  local index = math.random(#themes)
  print("Setting theme to " .. themes[index])
  vim.cmd("colorscheme " .. themes[index])
end

-- Function to set a random theme
function set_random_theme()
  local themes = {
    "onedark",
    "nord",
    "solarized",
    "gruvbox",
    -- "tokyonight",
    "dracula",
    "ayu",
    "rose-pine",
    "everforest",
    "abstract",
    "afterglow",
    "alduin",
    "anderson",
    "angr",
    "deep-space",
    "deus",
    "dogrun",
    "focuspoint",
    "gotham",
    "gruvbox",
    "scheakur",
    "hybrid",
    "jellybeans",
    "lightning",
    "lucid",
    "lucius",
    "materialbox",
    "meta5",
    "minimalist",
    "molokai",
    "molokayo",
    "mountaineer",
    "nord",
    "one",
    "onedark",
    "orbital",
    "paramount",
    "pink-moon",
    "purify",
    "rdark-terminal2",
    "sierra",
    "solarized8",
    "sonokai",
    "space-vim-dark",
    "spacecamp",
    "sunbather",
    "tender",
    "termschool",
    "twilight256",
  }

  -- Generate a random index
  local index = math.random(#themes)

  print("Setting theme to " .. themes[index])
  -- Set the colorscheme to the randomly selected theme
  vim.cmd("colorscheme " .. themes[index])
end

-- Map the function to <leader>tr
vim.api.nvim_set_keymap('n', '<leader>tr', ':lua set_random_of_top_themes()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tl', ':lua set_random_theme', { noremap = true, silent = true })

-- Map <leader>tg to set the theme back to tokyonight
vim.api.nvim_set_keymap('n', '<leader>tm', ':colorscheme ayu<CR>', { noremap = true, silent = true })
