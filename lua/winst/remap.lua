vim.g.mapleader = " "

vim.keymap.set('n', '<space>s', require('nvim-tree.api').tree.toggle, {
	silent=true,
	desc ='toggle nvim-tree',
})

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
    vim.keymap.set("n", "<space><tab>", "za", {
      buffer = event.buf,  -- make mapping local to buffer
      silent=true,
      desc ='toggle fold',
    })
  end,
})
