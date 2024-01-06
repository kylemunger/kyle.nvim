-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'github/copilot.vim',
  'puremourning/vimspector',
  'nvim-lua/plenary.nvim',
  'ThePrimeagen/harpoon',
  'BurntSushi/ripgrep',
  'morhetz/gruvbox',

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    }
  },

  "joshdick/onedark.vim",
  "arcticicestudio/nord-vim",
  "altercation/vim-colors-solarized",
  "morhetz/gruvbox",
  "dracula/vim",
  "folke/tokyonight-vim",
  "mhartington/oceanic-next",
  "Shatur/neovim-ayu",
  "rose-pine/neovim",
  "sainnhe/everforest"
}
