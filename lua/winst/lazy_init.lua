-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Point the Python3 provider at a real interpreter.
-- Without this, detection iterates over PATH candidates and the first
-- `python3` hit is C:/Users/artem/bin/python3.bat, a batch shim whose
-- `%*` forwarding mangles the provider's multi-line `-c` probe. That probe
-- then exits 0 with empty stdout, and vim.version.lt("", "3.9") throws
-- "invalid version: ''" whenever something calls has('python3')
-- (e.g. vim-latex's ftplugin on BufReadPost for tex files).
-- Bypassing detection also avoids the slow PATH scan on every startup.
-- Guarded by executable() so this file stays commit-safe: on machines
-- without this exact interpreter it falls back to PATH detection.
local python3_host = "C:/Users/artem/AppData/Local/Programs/Python/Python312/python.exe"
if vim.fn.executable(python3_host) == 1 then
  vim.g.python3_host_prog = python3_host
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins (this designates the directory to search)
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify=false },
})


