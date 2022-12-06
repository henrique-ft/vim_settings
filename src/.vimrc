""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" < MISC >
"
" *RUBY ENVIRONMENT
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" *GO ENVIRONMENT
" open tmux wiwth export GO111MODULE=on && tmux for ajust some problems that
" may occurr
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" https://github.com/go-delve/delve/tree/master/Documentation/installation
Plug 'sebdah/vim-delve'
" *REACT ENVIRONMENT
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" *JAVASCRIPT ENVIRONMENT
Plug 'pangloss/vim-javascript'
" *SVELTE ENVIRONMENT
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" For js autoimport work
" $ git clone https://github.com/universal-ctags/ctags
" # cd ctags && ./autogen.sh && ./configure && make && sudo make install
" touch ~/.gitignore_global
" git config --global core.excludesfile ~/.gitignore_global
" vim ~/.gitignore_global
" and add to this file: tags tags.lock and tags.temp
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
" *ELIXIR ENVIRONMENT
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
" *CRYSTAL ENVIRONMENT
Plug 'vim-crystal/vim-crystal'
" *NGINX ENVIRONMENT
Plug 'chr4/nginx.vim'

" < DEFAULT >

Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mileszs/ack.vim'
Plug 'drmikehenry/vim-fixkey'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'kshenoy/vim-signature'
Plug 'zivyangll/git-blame.vim'
Plug 'Yggdroot/indentLine'
Plug 'nvie/vim-togglemouse'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'

" < COLORS >

Plug 'tomasiser/vim-code-dark'
Plug 'liuchengxu/space-vim-dark'
Plug 'crusoexia/vim-monokai'
Plug 'nanotech/jellybeans.vim'
Plug 'dunstontc/vim-vscode-theme'
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'haishanh/night-owl.vim'
Plug 'jnurmine/Zenburn'
Plug 'fcpg/vim-fahrenheit'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
call plug#end()

" < SET COLORS >

autocmd VimEnter * color err_box
autocmd filetype ruby compiler ruby

" < CONFIG >

set backspace=indent,eol,start

" *RUBY / *ELIXIR ENVIRONMENT
set tabstop=2
set shiftwidth=2
set softtabstop=2

" *JAVASCRIPT ENVIRONMENT
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4

" *REACT ENVIRONMENT
" Sometimes syntax highlighting can get out of sync in large JSX and TSX
" files. This solves the problem
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"stop recording bug
map q <Nop>
map Q <Nop>
"stop navigation wrong keys 'bugs'
map K <Nop>
map J <Nop>

set expandtab
set number
set runtimepath^=~/.vim/bundle/ctrlp.vim
set noshowmode
" use easymotion instead
"set relativenumber
set nobackup
set noswapfile
set noundofile
set nofoldenable
" Identation on past
nnoremap p p=`]

"ctrlsf position"
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_close = { "normal" : 0, "compact": 0}
"ctrlsf ignore"
let g:ctrlsf_ignore_dir = ["node_modules",  ".git"]

"make italics work
let &t_ZH="\e[3m"

"Airline configurations"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='minimalist'
map <silent> <F5> :color rr_box<CR>
map <silent> <F6> :color er_box<CR>
map <silent> <F7> :AirlineTheme base16_grayscale<CR>
map <silent> <F8> :AirlineTheme minimalist<CR>

"Add highlight for searchs
set hlsearch

"NERDTree navigation"
silent! nmap <Tab> :NERDTreeTabsToggle<CR>
"silent! map <F2> :NERDTreeTabsFind<CR>
"let g:NERDTreeMapActivateNode="<F2>"
"let g:NERDTreeMapPreview="<F1>"
silent! map q :silent! NERDTreeTabsFind<CR>
silent! let g:NERDTreeMapActivateNode="w"
silent! let g:NERDTreeMapPreview="q"
highlight! link NERDTreeFlags NERDTreeDir
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:NERDTreeMouseMode = 3
let NERDTreeShowHidden=1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
"Icons colors

"Enable better whitespaces for default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

"CTRLP Maps
"Hit <c-r> before search to find exact match file
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|spec/cassettes\|DS_Store\|git'

" SHOW MOST RECENT FILES
"noremap <M-p> :CtrlPMixed<CR>
noremap <M-p> :CtrlPMRU<CR>

"Toggle relative number"
" USE MOUSE WITH CTRL KEY PRESSED
"map <C-n> :set relativenumber!<CR>
"map <F12> :set invnumber<CR>

"Some system may need it, others not"
"set termguicolors
set t_Co=256
set encoding=UTF-8
"
let g:gitgutter_terminal_reports_focus=0
let g:indentLine_color_term = 239
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:closetag_filenames = '*.exs,*.jsx,*.erb,*.html,*.xhtml,*.phtml,*.html.*,*.jsx,*.vue,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'

"Auto complete"
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"Auto complete for *GO / *JAVASCRIPT ENVIRONMENT"
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

syntax on

autocmd VimEnter * CloseTagEnableBuffer

"ctrl+hjkl or hjkl Navigation"
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
"

"Fast navigation in alt + j k"
nnoremap <M-k> <C-u>
nnoremap <M-j> <C-d>

"Fast ESC
inoremap jj <ESC>
inoremap JJ <ESC>
inoremap Jj <ESC>
inoremap jJ <ESC>
vnoremap JJ <ESC>

"Add space q and space w to save and quit
let mapleader=" "
nmap <leader>q :q<CR>
nmap <leader><leader>q :q!<CR>
nmap <leader>w :w<CR>

"Git Blame"
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>

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

"Fast word finding in project"
map <C-f> <Plug>CtrlSFPrompt
vmap <leader>f <Plug>CtrlSFVwordExec
nmap <leader>f <Plug>CtrlSFCwordPath

"easymotion
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>e <Plug>(easymotion-w)
map <leader>E <Plug>(easymotion-e)
map  \ <Plug>(easymotion-sn)
omap \ <Plug>(easymotion-tn)
let g:EasyMotion_startofline = 0

" Identlines configuration
nmap <leader>li :IndentLinesToggle<CR>
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ["nerdtree"]

"Fast word highlighting"
noremap f *
"Press x to turn off highlighting and clear any message already displayed.
nnoremap x :noh<return>

" Map line navigation
map L $
map H _

" Ajust vim bug
let &t_TI = ""
let &t_TE = ""

" Set column length limit
set colorcolumn=80

" *ELIXIR ENVIRONMENT
inoremap pry require IEx; IEx.pry<left>
let g:mix_format_on_save = 1

" *GO ENVIRONMENT =======================================
" Autocomplete = CTRL +X +O

inoremap f1 fmt.Println()<left>
inoremap f2 fmt.Sprintf("%s", name)<left>
inoremap f3 fmt.Printf("%+v\n",)<left>
inoremap ifer if err != nil { panic(err) }<right>

" Language server configs https://github.com/golang/tools/blob/master/gopls/doc/vim.md
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" END GO ENVIRONMENT =======================================

" *RUBY / *ELIXIR ENVIRONMENT
"Endwise (tpope/vim-endwise)
"------------------------------------------------------------------------------------------------------------------------------------

if exists("g:loaded_endwise") || &cp
  finish
endif
let g:loaded_endwise = 1

augroup endwise " {{{1
  autocmd!
  autocmd FileType lua let b:endwise_addition = 'end' | let b:endwise_words = 'function,do,then' | let b:endwise_pattern = '^\s*\zs\%(\%(local\s\+\)\=function\)\>\%(.*\<end\>\)\@!\|\<\%(then\|do\)\ze\s*$' | let b:endwise_syngroups = 'luaFunction,luaStatement,luaCond'
  autocmd FileType elixir let b:endwise_addition = 'end' | let b:endwise_words = 'do,fn' | let b:endwise_pattern = '.*[^.:@$]\zs\<\%(do\(:\)\@!\|fn\)\>\ze\%(.*[^.:@$]\<end\>\)\@!' | let b:endwise_syngroups = 'elixirBlockDefinition'
  autocmd FileType ruby let b:endwise_addition = 'end' | let b:endwise_words = 'module,class,def,if,unless,case,while,until,begin,do' | let b:endwise_pattern = '^\(.*=\)\?\s*\%(private\s\+\|protected\s\+\|public\s\+\|module_function\s\+\)*\zs\%(module\|class\|def\|if\|unless\|case\|while\|until\|for\|\|begin\)\>\%(.*[^.:@$]\<end\>\)\@!\|\<do\ze\%(\s*|.*|\)\=\s*$' | let b:endwise_syngroups = 'rubyModule,rubyClass,rubyDefine,rubyControl,rubyConditional,rubyRepeat'
  autocmd FileType crystal let b:endwise_addition = 'end' | let b:endwise_words = 'module,class,lib,macro,struct,union,enum,def,if,unless,ifdef,case,while,until,for,begin,do' | let b:endwise_pattern = '^\(.*=\)\?\s*\%(private\s\+\|protected\s\+\|public\s\+\|abstract\s\+\)*\zs\%(module\|class\|lib\|macro\|struct\|union\|enum\|def\|if\|unless\|ifdef\|case\|while\|until\|for\|begin\)\>\%(.*[^.:@$]\<end\>\)\@!\|\<do\ze\%(\s*|.*|\)\=\s*$' | let b:endwise_syngroups = 'crystalModule,crystalClass,crystalLib,crystalMacro,crystalStruct,crystalEnum,crystalDefine,crystalConditional,crystalRepeat,crystalControl'
  autocmd FileType sh,zsh let b:endwise_addition = '\=submatch(0)=="then" ? "fi" : submatch(0)=="case" ? "esac" : "done"' | let b:endwise_words = 'then,case,do' | let b:endwise_pattern = '\%(^\s*\zscase\>\ze\|\zs\<\%(do\|then\)\ze\s*$\)' | let b:endwise_syngroups = 'shConditional,shLoop,shIf,shFor,shRepeat,shCaseEsac,zshConditional,zshRepeat,zshDelimiter'
  autocmd FileType vb,vbnet,aspvbs let b:endwise_addition = 'End &' | let b:endwise_words = 'Function,Sub,Class,Module,Enum,Namespace' | let b:endwise_pattern = '\%(\<End\>.*\)\@<!\<&\>' | let b:endwise_syngroups = 'vbStatement,vbnetStorage,vbnetProcedure,vbnet.*Words,AspVBSStatement'
  autocmd FileType vim let b:endwise_addition = '\=submatch(0)=~"aug\\%[roup]" ? submatch(0) . " END" : "end" . submatch(0)' | let b:endwise_words = 'fu\%[nction],wh\%[ile],if,for,try,aug\%[roup]\%(\s\+\cEND\)\@!' | let b:endwise_end_pattern = '\%(end\%(fu\%[nction]\|wh\%[hile]\|if\|for\|try\)\)\|aug\%[roup]\%(\s\+\cEND\)' | let b:endwise_syngroups = 'vimFuncKey,vimNotFunc,vimCommand,vimAugroupKey,vimAugroup,vimAugroupError'
  autocmd FileType c,cpp,xdefaults,haskell let b:endwise_addition = '#endif' | let b:endwise_words = 'if,ifdef,ifndef' | let b:endwise_pattern = '^\s*#\%(if\|ifdef\|ifndef\)\>' | let b:endwise_syngroups = 'cPreCondit,cPreConditMatch,cCppInWrapper,xdefaultsPreProc'
  autocmd FileType objc let b:endwise_addition = '@end' | let b:endwise_words = 'interface,implementation' | let b:endwise_pattern = '^\s*@\%(interface\|implementation\)\>' | let b:endwise_syngroups = 'objcObjDef'
  autocmd FileType matlab let b:endwise_addition = 'end' | let b:endwise_words = 'function,if,for' | let b:endwise_syngroups = 'matlabStatement,matlabFunction,matlabConditional,matlabRepeat'
  autocmd FileType htmldjango let b:endwise_addition = '{% end& %}' | let b:endwise_words = 'autoescape,block,blocktrans,cache,comment,filter,for,if,ifchanged,ifequal,ifnotequal,language,spaceless,verbatim,with' | let b:endwise_syngroups = 'djangoTagBlock,djangoStatement'
  autocmd FileType htmljinja,jinja.html let b:endwise_addition = '{% end& %}' | let b:endwise_words = 'autoescape,block,cache,call,filter,for,if,macro,raw,set,trans,with' | let b:endwise_syngroups = 'jinjaTagBlock,jinjaStatement'
  autocmd FileType snippets let b:endwise_addition = 'endsnippet' | let b:endwise_words = 'snippet' | let b:endwise_syngroups = 'snipSnippet,snipSnippetHeader,snipSnippetHeaderKeyword'
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
