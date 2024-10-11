return {
    "github/copilot.vim",
    event = "InsertEnter",  -- Load on InsertEnter
    config = function()
        -- Optional: Configure any specific settings for Copilot here
        vim.g.copilot_no_tab_map = false  -- Enable default tab mapping
        --vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })  -- Map Ctrl-J to accept suggestions
    end,
}
