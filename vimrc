call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elixir-editors/vim-elixir'
Plug 'crusoexia/vim-monokai'
"https://github.com/dyng/ctrlsf.vim" 
Plug 'dyng/ctrlsf.vim'
Plug 'itchyny/lightline.vim'
"https://docs.emmet.io/cheat-sheet/"
Plug 'mattn/emmet-vim'

call plug#end()

set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set runtimepath^=~/.vim/bundle/ctrlp.vim
set noshowmode

"Alt+arrow Navigation"
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"

"Some system may need it, others not"
set termguicolors
set t_Co=256
"

let g:gitgutter_terminal_reports_focus=0
let g:indentLine_color_term = 239
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:closetag_filenames = '*.erb,*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'

"Html auto complete"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"

syntax on

autocmd VimEnter * color monokai

autocmd VimEnter * NERDTree
autocmd VimEnter * IndentLinesToggle
autocmd VimEnter * CloseTagEnableBuffer

autocmd FileType ruby compiler ruby
