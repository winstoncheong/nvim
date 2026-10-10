return {
  "nvim-treesitter/nvim-treesitter",
  -- Track the rewritten `main` branch explicitly (not archived `master`).
  -- Pinning the branch here keeps every machine on the same API; the exact
  -- commit is recorded in lazy-lock.json.
  branch = "main",
  -- Upstream does not support lazy-loading this plugin.
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      -- install_dir defaults to stdpath('data') .. '/site'; parsers and
      -- queries live there (NOT in the lazy plugin dir like master-era).
    })

    local langs = {
      "c", "lua", "vim", "vimdoc",
      "javascript", "typescript", "html",
      "python",
      -- winst/init.lua configures treesitter folding for markdown.
      "markdown", "markdown_inline",
    }

    -- No-op for parsers already installed; downloads + compiles the rest
    -- asynchronously on first run (needs curl, tar, a C compiler).
    require("nvim-treesitter").install(langs)

    -- New-main provides parsers/queries only; enabling is our job.
    -- LaTeX is deliberately excluded: vim-latex/vimtex own tex buffers
    -- (syntax, folding, indent); treesitter highlight would fight them.
    local skip = { tex = true, plaintex = true }
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if skip[args.match] then
          return
        end
        local lang = vim.treesitter.language.get_lang(args.match)
        -- pcall: language.add errors when the parser is missing, and
        -- start can fail when queries are missing. Either way, leave the
        -- buffer to its filetype plugin instead of erroring.
        if lang and pcall(vim.treesitter.language.add, lang) then
          if pcall(vim.treesitter.start, args.buf, lang) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end
      end,
    })
  end,
}
