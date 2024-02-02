-- Show relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Set scroll offset
vim.o.scrolloff = 16

-- Set indent
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Define leader
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins are listed in ~/.config/nvim/lua/plugins.lua
require("lazy").setup("plugins")

-- Controls for Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Controls for Terminal
local term_map = require("terminal.mappings")
vim.keymap.set('n', '<leader>to', term_map.toggle)
vim.keymap.set("n", "<leader>tk", term_map.kill)
