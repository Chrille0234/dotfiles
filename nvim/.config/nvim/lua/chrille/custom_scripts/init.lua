-- functions used with macros
local switch_case = require("chrille.custom_scripts.switch_case")


-- functions for commands
local go_tidy = require("chrille.custom_scripts.mod_tidy")

vim.api.nvim_create_user_command("GoTidy", go_tidy.go_tidy, {})

return {
  switch_case = switch_case.switch_case
}

