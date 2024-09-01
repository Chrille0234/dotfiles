local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("", {
  s("html5", {
    t("<!DOCTYPE html>"),
    t({"", "<html lang=\"en\">"}),
    t({"", "<head>"}),
    t({"", "    <meta charset=\"UTF-8\">"}),
    t({"", "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"}),
    t({"", "    <title>"}), i(1, "Document"), t("</title>"),
    t({"", "</head>"}),
    t({"", "<body>"}),
    t({"", "    "}), i(0),
    t({"", "</body>"}),
    t({"", "</html>"})
  }),
})

