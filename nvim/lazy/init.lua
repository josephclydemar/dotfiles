require("config.lazy")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2 expandtab")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=2")
vim.cmd("set mouse=a")
vim.cmd("set scrolloff=14")
vim.cmd("set nowrap")
vim.cmd("set encoding=UTF-8")
vim.cmd("nmap <M-x> :nohlsearch<CR>")

-- local colorschemes = { "gruvbox", "slate", "habamax", "tokyonight-moon", "catppuccin-macchiato" }
-- math.randomseed(os.time())
-- local selected = colorschemes[math.random(#colorschemes)]
-- vim.cmd("colorscheme " .. selected)

vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme habamax")
-- vim.cmd("colorscheme kanagawa-dragon")

for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  if hl.italic then
    hl.italic = false
    vim.api.nvim_set_hl(0, group, hl)
  end
end

-- vim.cmd("nmap <M-m> :vertical resize +1<CR>")
-- vim.cmd("nmap <M-n> :vertical resize -1<CR>")
-- vim.cmd("nmap <M-v> :horizontal resize +1<CR>")
-- vim.cmd("nmap <M-b> :horizontal resize -1<CR>")

-- move up/down a line of code
-- vim.cmd("nnoremap <A-Up> :m .-2<CR>==")
-- vim.cmd("nnoremap <A-Down> :m .+1<CR>==")

-- copy up/down a line of code
vim.cmd("nnoremap <C-A-Down> :t .<CR>")
vim.cmd("nnoremap <C-A-Up> :t .-1<CR>")


-- window 
vim.cmd("nmap <M-w> :WinShift<CR>")
vim.cmd("nmap <M-s> :WinShift swap<CR>")

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


vim.keymap.set("n", "<C-[>", "<cmd>cprevious<CR>")
vim.keymap.set("n", "<C-]>", "<cmd>cnext<CR>")
-- vim.keymap.set("n", "<C-s>", ":w<CR>")


require("live-server").setup({})

function Hello()
  for i=1,10 do
    print("Hello, World!! -> ", i)
  end
  vim.defer_fn(function()
    vim.cmd("echo 'You selected: '")
  end, 2)
end

function MyInput()
  vim.ui.input({ prompt = "Enter session name: " }, function (input)
    print("Hello " .. input)
    Hello()
  end)
end

