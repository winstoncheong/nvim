return {
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "vim-latex/vim-latex",
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  { 'tpope/vim-fugitive' },
}

