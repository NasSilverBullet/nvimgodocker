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


"Config
runtime! config.vim
