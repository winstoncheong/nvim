
vim.cmd.colorscheme("tokyonight")

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers

-- set tab size to 2 spaces
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.incsearch = true -- incremental search

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Wrap long lines better
vim.o.linebreak = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
