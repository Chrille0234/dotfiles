return {
	"smoka7/hop.nvim",

	version = "*",

	config = function ()
		require("hop").setup({})
		vim.keymap.set("n", "<leader>fw", vim.cmd.HopWord)

	end
}
