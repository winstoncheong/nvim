vim.g.mapleader = " "

vim.keymap.set('n', '<space>s', require('nvim-tree.api').tree.toggle, {
	silent=true,
	desc ='toggle nvim-tree',
})
