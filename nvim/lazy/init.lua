
require("config.lazy")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4 expandtab")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=4")
vim.cmd("set mouse=a")
vim.cmd("set scrolloff=5")
vim.cmd("set nowrap")
vim.cmd("set nohlsearch")
vim.cmd("set encoding=UTF-8")

vim.cmd("colorscheme gruvbox")

-- vim.cmd("nmap <C-q> :Telescope<Enter>")
vim.cmd("nmap <C-a> :Neotree filesystem toggle right<Enter>")
vim.cmd("nmap <C-s> :Neotree git_status toggle right<Enter>")

-- vim.cmd("nmap <M-z> :vsp ~/.config/nvim/init.lua<Enter>")

-- move up/down a line of code
vim.cmd("nnoremap <A-Up> :m .-2<CR>==")
vim.cmd("nnoremap <A-Down> :m .+1<CR>==")

-- copy up/down a line of code
vim.cmd("nnoremap <C-A-Down> :t .<CR>")
vim.cmd("nnoremap <C-A-Up> :t .-1<CR>")


