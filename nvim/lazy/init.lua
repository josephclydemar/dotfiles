
require("config.lazy")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4 expandtab")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=4")
vim.cmd("set mouse=a")
vim.cmd("set scrolloff=18")
vim.cmd("set nowrap")
vim.cmd("set encoding=UTF-8")
vim.cmd("nmap <C-Q> :nohlsearch<CR>")

vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme catppuccin-macchiato")

vim.cmd("nmap <C-a> :Neotree filesystem reveal toggle right<CR>")
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


-- window 
vim.cmd("nmap <M-w> :WinShift<CR>")
vim.cmd("nmap <M-s> :WinShift swap<CR>")
vim.cmd("nmap <M-l> :WinShift left<CR>")
vim.cmd("nmap <M-d> :WinShift down<CR>")
vim.cmd("nmap <M-u> :WinShift up<CR>")
vim.cmd("nmap <M-r> :WinShift right<CR>")

vim.cmd("nmap <M-1> :BufferGoto 1<CR>")
vim.cmd("nmap <M-2> :BufferGoto 2<CR>")
vim.cmd("nmap <M-3> :BufferGoto 3<CR>")
vim.cmd("nmap <M-4> :BufferGoto 4<CR>")
vim.cmd("nmap <M-5> :BufferGoto 5<CR>")
vim.cmd("nmap <M-6> :BufferGoto 6<CR>")
vim.cmd("nmap <M-7> :BufferGoto 7<CR>")
vim.cmd("nmap <M-8> :BufferGoto 8<CR>")
vim.cmd("nmap <M-9> :BufferGoto 9<CR>")
vim.cmd("nmap <M-0> :BufferLast<CR>")

