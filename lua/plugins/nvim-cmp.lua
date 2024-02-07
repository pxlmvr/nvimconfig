  return {
    { 
      "hrsh7th/nvim-cmp" ,
      config = function ()
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<C-k>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
        },
        sources = {
          { name = "nvim_lsp", priority = 10 },
          { name = "vsnip" },
          { name = "path" },
        },
        formatting = {
          --format = require("lspkind").cmp_format({
          --  with_text = true,
          --  menu = {
          --    nvim_lsp = "[LSP]",
          --  },
          --}),
        },
      })
    end
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
}
