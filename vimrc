call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = 1
autocmd VimEnter * hi Normal ctermbg=none

colorscheme gruvbox

set number
