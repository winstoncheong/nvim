require("winst.lazy_init")
require("winst.remap")
require("winst.set")

-- Set fold method to Treesitter for Markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt_local.foldlevelstart = 1 -- Set initial fold level (doesn't seem to do anything?)
    end,
})
