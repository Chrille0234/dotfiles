return {
  {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            vertical = {
              width = 0.8,
              height = 0.8,
              preview_height = 0.6,
              preview_width = 0.9,
            },
          },
          border = true,
          borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          preview = {
            lines = 10,
            winblend = 0,
            number = true,
          }
        },
      })

      local builtin = require("telescope.builtin")

      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end

  },
  {
    "tpope/vim-rhubarb"
  }
}
