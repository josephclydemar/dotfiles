:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4 expandtab
:set smarttab
:set softtabstop=4
:set mouse=a
:set scrolloff=5
:set nowrap
:set encoding=UTF-8

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'sho-87/kanagawa-paper.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

call plug#end()

":colorscheme sorbet
":colorscheme slate
:colorscheme kanagawa-paper
":colorscheme wildcharm
":colorscheme vim
":colorscheme torte

:nmap <C-q> :Telescope<Enter>
:nmap <C-g> :Telescope live_grep<Enter>
:nmap <C-s> :Telescope file_browser<Enter>
:nmap <C-d> :NERDTree<Enter>
:noremap <C-t> :NERDTreeToggle<CR>

:nmap <M-z> :vsp ~/.config/nvim/init.vim<Enter>

