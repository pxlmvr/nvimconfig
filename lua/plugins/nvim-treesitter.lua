return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.nvim-treesitter')
            
	    local configs = require("nvim-treesitter.configs")

	    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "eex", "erlang", "surface", "javascript", "html", "css", "json", "typescript" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = {
          enable = true,
        }
      })

    	end,
    requires = {},
  },
}
