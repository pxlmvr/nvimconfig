return {
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('plugins.nvim-treesitter')
            
	    local configs = require("nvim-treesitter.configs")

	    configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "eex", "erlang", "heex", "surface", "javascript", "html" },
                sync_install = false,
          	highlight = { enable = true },
          	indent = { enable = true },  
            })

    	end,
        requires = {
        },
    },
}