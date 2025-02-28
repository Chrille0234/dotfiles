 return {
   -- Specify the plugin repositoryharp
   "ThePrimeagen/harpoon",
   -- Plugin configuration
   config = function()
     -- Require the Harpoon module
     local harpoon = require("harpoon")
     -- Set up Harpoon's menu, mark, and terminal components
     harpoon.setup({
       mark = {
         mark_branch = true,
       },
       terminal = {
         commands = {
           -- Custom terminal commands can be set here
           -- Example:
           -- "node",
         },
       },
     })
     -- Optionally set up keybindings
     local map = vim.api.nvim_set_keymap
     local opts = { noremap = true, silent = true }
     -- Map keys to Harpoon commands
     map("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
     map("n", "<leader>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
     map("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
     map("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
     map("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
     map("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
     map("n", "<leader>r1", ":lua require('harpoon.mark').set_current_at(1)<CR>", opts)
     map("n", "<leader>r2", ":lua require('harpoon.mark').set_current_at(2)<CR>", opts)
     map("n", "<leader>r3", ":lua require('harpoon.mark').set_current_at(3)<CR>", opts)
     map("n", "<leader>r4", ":lua require('harpoon.mark').set_current_at(4)<CR>", opts)
   end
 }
