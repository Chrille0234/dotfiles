local function go_tidy()
  vim.cmd([[ ! go mod tidy]])
  vim.cmd([[ LspRestart ]])
end

return { go_tidy = go_tidy }
