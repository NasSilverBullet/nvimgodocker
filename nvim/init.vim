"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('joshdick/onedark.vim', {'merged': -1})

" Import:
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/denite.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/lightline.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/deoplete.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/go_lazy.toml', {'lazy': 2})
  call dein#load_toml('~/.config/nvim/md_lazy.toml', {'lazy': 2})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


"Config-----------------------------------
"set unicode
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

"several settings
set number                                              "show line number
set autoindent
set smartindent
set tabstop=2                                           "replace tab to 2 space
set shiftwidth=2                                        "set 2 space on auto indent
set softtabstop=0                                       "set 0 tab by keyboard
set ttimeout                                            "https://hori-ryota.com/blog/neovim-fix-input-broken-ttimeout/
set ttimeoutlen=50                                      "become esc or ctrl-[ to be faster
set clipboard=unnamed                                   "copy yanked value to clipboard
set hls                                                 "highlight searched words
filetype plugin on
filetype indent on
nmap <C-c><C-c> :nohlsearch<CR><C-c>                    "remove highlight
nmap <C-[><C-[> :nohlsearch<CR><C-[>                    "remove highlight
set hidden                                              "can chage buffer if you don't save yet
let mapleader = "\<Space>"
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme onedark "atom!

"disable arrow key
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"command mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" resize window
nnoremap <Left>  <C-w><<CR>
nnoremap <Right> <C-w>><CR>
nnoremap <Up>    <C-w>-<CR>
nnoremap <Down>  <C-w>+<CR>
