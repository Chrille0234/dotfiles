return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  config = function()
    -- Install only if not already installed
    if not vim.fn["mkdp#util#is_installed"]() then
      vim.fn["mkdp#util#install"]()
    end
  end,
}
