local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
  s("apihandler", {
    t("func Handle"), i(1), t("(w http.ResponseWriter, r *http.Request){"), i(0), t("}")
  }),

  s("errnil", {
    t({"if err != nil {"}),
    i(0),
    t({"}"})
  })
})
