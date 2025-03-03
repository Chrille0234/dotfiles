Custom_scripts = require("chrille.custom_scripts")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ex", vim.cmd.exit)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "gd", function ()
  vim.lsp.buf.definition()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 10)
end)

vim.keymap.set("n", "<leader>cp", function()
  vim.cmd("CopilotChatOpen")
end)


vim.api.nvim_set_keymap('n', '<Leader>tcc', '<cmd>lua Custom_scripts.switch_case()<CR>', {noremap = true, silent = true})
