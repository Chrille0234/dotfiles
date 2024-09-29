function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function ()
      require("rose-pine").setup({
        styles = {
          italic = false,
        },
        variant = "auto",
      })
    end
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "slugbyte/lackluster.nvim",
    config = function ()
      ColorMyPencils()
    end
  },
  {
    "bluz71/vim-moonfly-colors"
  }
}
