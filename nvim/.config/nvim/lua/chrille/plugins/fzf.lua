return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case " ..
          "--glob '!package.json' " ..
          "--glob '!package-lock.json' " ..
          "--glob '!yarn.lock' " ..
          "--glob '!pnpm-lock.yaml' " ..
          "--glob '!dist' " ..
          "--glob '!build'",
    },
    previewers = {
      git_diff = {
        pager = "delta --color-only --features-side-by-side"
      }
    }
  },


  config = function()
    require("fzf-lua").setup(opts)

    local fzf = require("fzf-lua")
    vim.keymap.set("n", "<leader>ff", fzf.files)
    vim.keymap.set("n", "<leader>/", fzf.live_grep)
    vim.keymap.set("n", "<leader>7", fzf.grep)
    vim.keymap.set("n", "<leader>fr", fzf.lsp_references)
    vim.keymap.set("n", "<leader>fch", fzf.command_history)
  end
}
