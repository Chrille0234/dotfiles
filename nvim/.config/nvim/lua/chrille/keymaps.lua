Custom_scripts = require("chrille.custom_scripts")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ex", vim.cmd.exit)


vim.api.nvim_set_keymap('n', '<Leader>tcc', '<cmd>lua Custom_scripts.switch_case()<CR>', {noremap = true, silent = true})
