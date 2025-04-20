vim.g.mapleader = " "

vim.keymap.set('n', '<space>s', require('nvim-tree.api').tree.toggle, {
	silent=true,
	desc ='toggle nvim-tree',
})

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
