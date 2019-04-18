call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'

call plug#end()

set tabstop=2       
set shiftwidth=2    
set softtabstop=2   
set expandtab      
set number
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

syntax on

autocmd VimEnter * color monokai
autocmd VimEnter * NERDTree

autocmd FileType ruby compiler ruby
