
-- Show relative line numbers
vim.wo.number = true
-- vim.wo.relativenumber = true

-- Set scroll offset
vim.o.scrolloff = 16

-- Set indent
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
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

-- Configure lspconfig
local lspconfig = require('lspconfig')

-- Controls for Telescope
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules" 
    }
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Controls for Terminal
local term_map = require("terminal.mappings")
vim.keymap.set('n', '<leader>to', term_map.toggle)
vim.keymap.set("n", "<leader>tk", term_map.kill)

-- Keymaps for lsp
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",{})
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",{})
vim.keymap.set("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references({layout_strategy=\"vertical\"})<CR>",{})
vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>",{})
vim.keymap.set("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>",{})
vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",{})
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",{})
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",{})
vim.keymap.set("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>",{})
vim.keymap.set("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>",{})

-- Color scheme
vim.cmd("colorscheme kanagawa")
