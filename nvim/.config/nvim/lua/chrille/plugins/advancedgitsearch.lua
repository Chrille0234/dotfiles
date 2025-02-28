return {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
        -- Setup Telescope first
        require("telescope").setup {
            extensions = {
                advanced_git_search = {
                    -- Optional configuration here (see plugin README)
                }
            }
        }

        -- Load the extension after Telescope is set up
        require("telescope").load_extension("advanced_git_search")
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<Leader>g", ":AdvancedGitSearch<CR>", desc = "Advanced Git Search" }
    }
}
