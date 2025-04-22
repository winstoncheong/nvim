vim.g.mapleader = " "

-- toggle nvim-tree
vim.keymap.set('n', '<C-\\>', require('nvim-tree.api').tree.toggle, { silent=true, desc ='toggle nvim-tree', })
vim.keymap.set('n', '<C-n>', require('nvim-tree.api').tree.toggle, { silent=true, desc ='toggle nvim-tree', })

-- some keymaps for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope previously open files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' }) -- in CWD
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- mapping for easier folding in tex files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function(event)
    vim.keymap.set("n", "<leader>a", "za", {
      buffer = event.buf,  -- make mapping local to buffer
      silent=true,
      desc ='toggle fold',
    })
  end,
})

-- Easier switch to alternate file
vim.keymap.set('n', '<leader><tab>', ':e #<CR>', { desc = 'switch to alternate file' })

vim.keymap.set('n', 'n', 'nzz') -- make search result appear vertically centered

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })





-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- this conflicts with C-j for LaTeXSuite to jump to template insertion point.
-- Use a snippet extension? 
-- Or find some other fix so I can bring this back.
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' }) 
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', {})
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', {})
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', {})
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', {})

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', {})
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', {})



-- Move text up and down
-- vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', {})
-- vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', {})
-- in visual mode
-- vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", {})
-- vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", {})
-- vim.keymap.set('v', 'p', '"_dP', {})
-- in visual block mode
-- vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", {})
-- vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", {})
-- vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", {})
-- vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", {})



-- Stay in visual mode when indent text
vim.keymap.set('v', '<', '<gv^', {})
vim.keymap.set('v', '>', '>gv^', {})

-- Easier switch to alternate file
vim.keymap.set('n', '<leader><tab>', ':e #<CR>', { desc = 'switch to alternate file' })
