" General config
let &runtimepath .= "," . $DOTFILES . "/nvim"
let &packpath .= "," . $DOTFILES . "/nvim"

set shell=zsh

" Line numbers
set number
set numberwidth=5

" Searching
set hlsearch

" Plugins
call plug#begin()
  " UI
  Plug 'vim-airline/vim-airline'
  Plug 'trevordmiller/nova-vim'

  " Linting
  Plug 'w0rp/ale'
call plug#end()

" Plugin config
let g:airline_powerline_fonts = 1

" Theme
colorscheme nova


