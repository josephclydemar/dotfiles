
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
-- vim.cmd("set nohlsearch")
vim.cmd("set encoding=UTF-8")

vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme catppuccin-macchiato")

vim.cmd("nmap <C-a> :Neotree filesystem toggle right<CR>")
vim.cmd("nmap <C-s> :Neotree git_status toggle right<CR>")
vim.cmd("nmap <M-t> :Telescope<CR>")
vim.cmd("nmap <M-m> :vertical resize +1<CR>")
vim.cmd("nmap <M-n> :vertical resize -1<CR>")
vim.cmd("nmap <M-v> :horizontal resize +1<CR>")
vim.cmd("nmap <M-b> :horizontal resize -1<CR>")

-- move up/down a line of code
vim.cmd("nnoremap <A-Up> :m .-2<CR>==")
vim.cmd("nnoremap <A-Down> :m .+1<CR>==")

-- copy up/down a line of code
vim.cmd("nnoremap <C-A-Down> :t .<CR>")
vim.cmd("nnoremap <C-A-Up> :t .-1<CR>")


