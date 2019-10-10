call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mileszs/ack.vim'
Plug 'drmikehenry/vim-fixkey'
"Plug 'Yggdroot/indentLine'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elixir-editors/vim-elixir'
Plug 'dyng/ctrlsf.vim'
Plug 'pangloss/vim-javascript'
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Tmux
Plug 'christoomey/vim-tmux-navigator'
"https://docs.emmet.io/cheat-sheet/"
Plug 'mattn/emmet-vim'
"For Blocks Comments with '\ cc' and '/ c <space>'
Plug 'scrooloose/nerdcommenter'
Plug 'kshenoy/vim-signature'
Plug 'neovimhaskell/haskell-vim'
Plug 'zivyangll/git-blame.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'akz92/vim-ionic2'
"colors ---------------------"
Plug 'tomasiser/vim-code-dark'
Plug 'liuchengxu/space-vim-dark'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'haishanh/night-owl.vim'
Plug 'dunstontc/vim-vscode-theme'
"----------------------------"

call plug#end()

set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set runtimepath^=~/.vim/bundle/ctrlp.vim
set noshowmode
set relativenumber

"ctrlsf position"
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}

"Exclude identatiotn from nerdtree
"let g:indent_guides_exclude_filetypes = ['nerdtree']

"lightline"
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif
"let g:lightline = {
      "\ 'colorscheme': 'jellybeans',
      "\ }
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }
"Show full path of filename"
function! FilenameForLightline()
    return expand('%')
endfunction

"Airline configurations"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_splits = 1
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#show_tab_nr = 0
"let g:airline#extensions#tabline#show_tab_type = 1
"let g:airline#extensions#tabline#close_symbol = '×'
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline_powerline_fonts = 1
"let g:airline_theme='minimalist'
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"map <silent> <F8> :AirlineTheme zenburn<CR>
"Add :AirlineTheme dark on enter"

"Mouse works
"set mouse=a

"Add highlight for searchs
set hlsearch

"NERDTree navigation"
silent! nmap <Tab> :NERDTreeTabsToggle<CR>
silent! map <F2> :NERDTreeTabsFind<CR>
silent! map <F3> t<CR>
let g:NERDTreeMapActivateNode="<F2>"
let g:NERDTreeMapPreview="<F1>"

"silent! nmap <Tab> :Hexplore<CR>

"Enable better whitespaces for default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"CTRLP Maps
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Toggle relative number"
map <C-n> :set relativenumber!<CR>
"
"Some system may need it, others not"
"set termguicolors
set t_Co=256
set encoding=UTF-8
"
let g:gitgutter_terminal_reports_focus=0
let g:indentLine_color_term = 239
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:closetag_filenames = '*.erb,*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'

"Press F5 to turn off highlighting and clear any message already displayed.
nnoremap <silent> <F5> :nohlsearch<Bar>:echo<CR>

"Html auto complete"
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"
syntax on

"Colorscheme"
"let g:space_vim_dark_background = 234
"autocmd VimEnter * color space-vim-dark
"autocmd VimEnter * color monokai
"autocmd VimEnter * color alloy
"autocmd VimEnter * color codedark
"autocmd VimEnter * color gruvbox
"autocmd VimEnter * color jellybeans
"autocmd VimEnter * color night-owl
"autocmd VimEnter * color dark_plus
"autocmd VimEnter * color codedark
colorscheme ron

autocmd VimEnter * CloseTagEnableBuffer
autocmd FileType ruby compiler ruby

"Togle line identation"
"nnoremap I :IndentLinesToggle<CR>

"ctrl+hjkl or hjkl Navigation"
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
"

"Fast navigation in ctrl + arrows"
nnoremap <M-k> <C-u>
nnoremap <M-j> <C-d>

"Fast word finding in project"
map <F4> <Plug>CtrlSFPrompt
vmap <F12> <Plug>CtrlSFVwordExec
nmap <F12> <Plug>CtrlSFCwordPath

"Add space q and space w to save and quit
let mapleader=" "
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

"Git Blame"
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"Tab Navigation
noremap <M-h> :tabprevious<CR>
noremap <M-l> :tabnext<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"VsCode method explanation
map <F9> K<CR>

"Endwise (tpope/vim-endwise)
"------------------------------------------------------------------------------------------------------------------------------------

if exists("g:loaded_endwise") || &cp
  finish
endif
let g:loaded_endwise = 1

augroup endwise " {{{1
  autocmd!
  autocmd FileType lua
        \ let b:endwise_addition = 'end' |
        \ let b:endwise_words = 'function,do,then' |
        \ let b:endwise_pattern = '^\s*\zs\%(\%(local\s\+\)\=function\)\>\%(.*\<end\>\)\@!\|\<\%(then\|do\)\ze\s*$' |
        \ let b:endwise_syngroups = 'luaFunction,luaStatement,luaCond'
  autocmd FileType elixir
        \ let b:endwise_addition = 'end' |
        \ let b:endwise_words = 'do,fn' |
        \ let b:endwise_pattern = '.*[^.:@$]\zs\<\%(do\(:\)\@!\|fn\)\>\ze\%(.*[^.:@$]\<end\>\)\@!' |
        \ let b:endwise_syngroups = 'elixirBlockDefinition'
  autocmd FileType ruby
        \ let b:endwise_addition = 'end' |
        \ let b:endwise_words = 'module,class,def,if,unless,case,while,until,begin,do' |
        \ let b:endwise_pattern = '^\(.*=\)\?\s*\%(private\s\+\|protected\s\+\|public\s\+\|module_function\s\+\)*\zs\%(module\|class\|def\|if\|unless\|case\|while\|until\|for\|\|begin\)\>\%(.*[^.:@$]\<end\>\)\@!\|\<do\ze\%(\s*|.*|\)\=\s*$' |
        \ let b:endwise_syngroups = 'rubyModule,rubyClass,rubyDefine,rubyControl,rubyConditional,rubyRepeat'
  autocmd FileType crystal
        \ let b:endwise_addition = 'end' |
        \ let b:endwise_words = 'module,class,lib,macro,struct,union,enum,def,if,unless,ifdef,case,while,until,for,begin,do' |
        \ let b:endwise_pattern = '^\(.*=\)\?\s*\%(private\s\+\|protected\s\+\|public\s\+\|abstract\s\+\)*\zs\%(module\|class\|lib\|macro\|struct\|union\|enum\|def\|if\|unless\|ifdef\|case\|while\|until\|for\|begin\)\>\%(.*[^.:@$]\<end\>\)\@!\|\<do\ze\%(\s*|.*|\)\=\s*$' |
        \ let b:endwise_syngroups = 'crystalModule,crystalClass,crystalLib,crystalMacro,crystalStruct,crystalEnum,crystalDefine,crystalConditional,crystalRepeat,crystalControl'
  autocmd FileType sh,zsh
        \ let b:endwise_addition = '\=submatch(0)=="then" ? "fi" : submatch(0)=="case" ? "esac" : "done"' |
        \ let b:endwise_words = 'then,case,do' |
        \ let b:endwise_pattern = '\%(^\s*\zscase\>\ze\|\zs\<\%(do\|then\)\ze\s*$\)' |
        \ let b:endwise_syngroups = 'shConditional,shLoop,shIf,shFor,shRepeat,shCaseEsac,zshConditional,zshRepeat,zshDelimiter'
  autocmd FileType vb,vbnet,aspvbs
        \ let b:endwise_addition = 'End &' |
        \ let b:endwise_words = 'Function,Sub,Class,Module,Enum,Namespace' |
        \ let b:endwise_pattern = '\%(\<End\>.*\)\@<!\<&\>' |
        \ let b:endwise_syngroups = 'vbStatement,vbnetStorage,vbnetProcedure,vbnet.*Words,AspVBSStatement'
  autocmd FileType vim
        \ let b:endwise_addition = '\=submatch(0)=~"aug\\%[roup]" ? submatch(0) . " END" : "end" . submatch(0)' |
        \ let b:endwise_words = 'fu\%[nction],wh\%[ile],if,for,try,aug\%[roup]\%(\s\+\cEND\)\@!' |
        \ let b:endwise_end_pattern = '\%(end\%(fu\%[nction]\|wh\%[hile]\|if\|for\|try\)\)\|aug\%[roup]\%(\s\+\cEND\)' |
        \ let b:endwise_syngroups = 'vimFuncKey,vimNotFunc,vimCommand,vimAugroupKey,vimAugroup,vimAugroupError'
  autocmd FileType c,cpp,xdefaults,haskell
        \ let b:endwise_addition = '#endif' |
        \ let b:endwise_words = 'if,ifdef,ifndef' |
        \ let b:endwise_pattern = '^\s*#\%(if\|ifdef\|ifndef\)\>' |
        \ let b:endwise_syngroups = 'cPreCondit,cPreConditMatch,cCppInWrapper,xdefaultsPreProc'
  autocmd FileType objc
        \ let b:endwise_addition = '@end' |
        \ let b:endwise_words = 'interface,implementation' |
        \ let b:endwise_pattern = '^\s*@\%(interface\|implementation\)\>' |
        \ let b:endwise_syngroups = 'objcObjDef'
  autocmd FileType matlab
        \ let b:endwise_addition = 'end' |
        \ let b:endwise_words = 'function,if,for' |
        \ let b:endwise_syngroups = 'matlabStatement,matlabFunction,matlabConditional,matlabRepeat'
  autocmd FileType htmldjango
        \ let b:endwise_addition = '{% end& %}' |
        \ let b:endwise_words = 'autoescape,block,blocktrans,cache,comment,filter,for,if,ifchanged,ifequal,ifnotequal,language,spaceless,verbatim,with' |
        \ let b:endwise_syngroups = 'djangoTagBlock,djangoStatement'
  autocmd FileType htmljinja,jinja.html
        \ let b:endwise_addition = '{% end& %}' |
        \ let b:endwise_words = 'autoescape,block,cache,call,filter,for,if,macro,raw,set,trans,with' |
        \ let b:endwise_syngroups = 'jinjaTagBlock,jinjaStatement'
  autocmd FileType snippets
        \ let b:endwise_addition = 'endsnippet' |
        \ let b:endwise_words = 'snippet' |
        \ let b:endwise_syngroups = 'snipSnippet,snipSnippetHeader,snipSnippetHeaderKeyword'
  autocmd FileType * call s:abbrev()
augroup END " }}}1

function! s:abbrev()
  if exists('g:endwise_abbreviations')
    for word in split(get(b:, 'endwise_words', ''), ',')
      execute 'iabbrev <buffer><script>' word word.'<CR><SID>DiscretionaryEnd<Space><C-U><BS>'
    endfor
  endif
endfunction

function! s:teardownMappings()
  inoremap <buffer> <C-X><CR> <C-X><CR>
  inoremap <buffer> <CR> <CR>
endfunction

" Functions {{{1

function! EndwiseDiscretionary()
  return <SID>crend(0)
endfunction

function! EndwiseAlways()
  return <SID>crend(1)
endfunction

" }}}1

" Maps {{{1

if maparg("<Plug>DiscretionaryEnd") == ""
  inoremap <silent> <SID>DiscretionaryEnd <C-R>=<SID>crend(0)<CR>
  inoremap <silent> <SID>AlwaysEnd        <C-R>=<SID>crend(1)<CR>
  imap    <script> <Plug>DiscretionaryEnd <SID>DiscretionaryEnd
  imap    <script> <Plug>AlwaysEnd        <SID>AlwaysEnd
endif

if !exists('g:endwise_no_mappings')
  if maparg('<CR>','i') =~# '<C-R>=.*crend(.)<CR>\|<\%(Plug\|SNR\|SID\)>.*End'
    " Already mapped
  elseif maparg('<CR>','i') =~ '<CR>'
    exe "imap <script> <C-X><CR> ".maparg('<CR>','i')."<SID>AlwaysEnd"
    exe "imap <silent> <script> <CR>      ".maparg('<CR>','i')."<SID>DiscretionaryEnd"
  elseif maparg('<CR>','i') =~ '<Plug>\w\+CR'
    exe "imap <C-X><CR> ".maparg('<CR>', 'i')."<Plug>AlwaysEnd"
    exe "imap <silent> <CR> ".maparg('<CR>', 'i')."<Plug>DiscretionaryEnd"
  else
    imap <script> <C-X><CR> <CR><SID>AlwaysEnd
    imap <CR> <CR><Plug>DiscretionaryEnd
  endif
  autocmd endwise CmdwinEnter * call s:teardownMappings()
endif

" }}}1

" Code {{{1

function! s:mysearchpair(beginpat,endpat,synidpat)
  let s:lastline = line('.')
  call s:synid()
  let line = searchpair(a:beginpat,'',a:endpat,'Wn','<SID>synid() !~# "^'.substitute(a:synidpat,'\\','\\\\','g').'$"',line('.')+50)
  return line
endfunction

function! s:crend(always)
  let n = ""
  if !exists("b:endwise_addition") || !exists("b:endwise_words") || !exists("b:endwise_syngroups")
    return n
  endif
  let synids = join(map(split(b:endwise_syngroups, ','), 'hlID(v:val)'), ',')
  let wordchoice = '\%('.substitute(b:endwise_words,',','\\|','g').'\)'
  if exists("b:endwise_pattern")
    let beginpat = substitute(b:endwise_pattern,'&',substitute(wordchoice,'\\','\\&','g'),'g')
  else
    let beginpat = '\<'.wordchoice.'\>'
  endif
  let lnum = line('.') - 1
  let space = matchstr(getline(lnum),'^\s*')
  let col  = match(getline(lnum),beginpat) + 1
  let word  = matchstr(getline(lnum),beginpat)
  let endword = substitute(word,'.*',b:endwise_addition,'')
  let y = n.endword."\<C-O>O"
  if exists("b:endwise_end_pattern")
    let endpat = '\w\@<!'.substitute(word, '.*', substitute(b:endwise_end_pattern, '\\', '\\\\', 'g'), '').'\w\@!'
  elseif b:endwise_addition[0:1] ==# '\='
    let endpat = '\w\@<!'.endword.'\w\@!'
  else
    let endpat = '\w\@<!'.substitute('\w\+', '.*', b:endwise_addition, '').'\w\@!'
  endif
  let synidpat  = '\%('.substitute(synids,',','\\|','g').'\)'
  if a:always
    return y
  elseif col <= 0 || synID(lnum,col,1) !~ '^'.synidpat.'$'
    return n
  elseif getline('.') !~ '^\s*#\=$'
    return n
  endif
  let line = s:mysearchpair(beginpat,endpat,synidpat)
  " even is false if no end was found, or if the end found was less
  " indented than the current line
  let even = strlen(matchstr(getline(line),'^\s*')) >= strlen(space)
  if line == 0
    let even = 0
  endif
  if !even && line == line('.') + 1
    return y
  endif
  if even
    return n
  endif
  return y
endfunction

function! s:synid()
  " Checking this helps to force things to stay in sync
  while s:lastline < line('.')
    let s = synID(s:lastline,indent(s:lastline)+1,1)
    let s:lastline = nextnonblank(s:lastline + 1)
  endwhile

  let s = synID(line('.'),col('.'),1)
  let s:lastline = line('.')
  return s
endfunction

" }}}1

" vim:set sw=2 sts=2:
" -------------------------------------------------------------------------------------------------------------------------------
