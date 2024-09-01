return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>u", function()
            vim.cmd.UndotreeToggle()
            vim.cmd("wincmd p")  -- This command switches to the previous window, which will be the undotree window.
        end)
    end
}
