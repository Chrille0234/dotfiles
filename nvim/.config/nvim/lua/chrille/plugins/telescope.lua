return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {},

    config = function ()
     local fzf = require("fzf-lua")

      vim.keymap.set("n", "<leader>ff", fzf.files)
      vim.keymap.set("n", "<leader>/", fzf.live_grep)
      vim.keymap.set("n", "<leader>fr", fzf.lsp_references)
      vim.keymap.set("n", "<leader>fch", fzf.command_history)
    end
}
