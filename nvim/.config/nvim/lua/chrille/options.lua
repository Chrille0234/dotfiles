vim.opt.relativenumber = true

vim.opt.tabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.expandtab = true;

vim.opt.wrap = true;
vim.opt.linebreak = true;
vim.opt.breakindent = true;
vim.o.breakat = " \n"

vim.opt.termguicolors = true


vim.opt.incsearch = true

-- Disable highlight after search is done
vim.cmd [[
augroup no_hlsearch
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]]
