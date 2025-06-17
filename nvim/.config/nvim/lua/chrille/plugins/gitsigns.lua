return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    local gitsigns = require("gitsigns")
    gitsigns.setup()

    vim.keymap.set("n", "hr", gitsigns.reset_hunk)
    vim.keymap.set("n", "hp", gitsigns.preview_hunk_inline)
  end
}
