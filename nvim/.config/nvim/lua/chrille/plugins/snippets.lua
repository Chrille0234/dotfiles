return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  -- Load LuaSnip when entering insert mode
  event = "InsertEnter",

  config = function ()
    local ls = require("luasnip")

    require("chrille.plugins.snippets.html")
    require("chrille.plugins.snippets.golang")
    require("chrille.plugins.snippets.php")
    require("chrille.plugins.snippets.templ")

    vim.keymap.set({"i", "s"}, "<C-K>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})

  end
}
