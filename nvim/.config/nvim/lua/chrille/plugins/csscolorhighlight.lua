return {
  "norcalli/nvim-colorizer.lua",

  config = function ()
    require("colorizer").setup({
      "*"
    }, {
        mode = "background",
        rgb_fn = true,
        hsl_fn = true,
      })
  end
}
