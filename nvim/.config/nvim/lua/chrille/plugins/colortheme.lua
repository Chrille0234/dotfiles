function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme("rose-pine")

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
  },
  {
    "vague2k/vague.nvim"
  },
  {
    "killitar/obscure.nvim"
  },
  {
    "sho-87/kanagawa-paper.nvim"
  }
}
