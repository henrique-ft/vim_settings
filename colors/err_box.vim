" File:       rr_box.vim --> based in codeschool theme
" Maintainer: Henrique Fernandez
" URL:        https://github.com/crusoexia/vim-monokai
" License:    MIT

" Initialization
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

let g:monokai_gui_italic = 0
let g:monokai_term_italic = 1

"if ! exists("g:monokai_gui_italic")
    "let g:monokai_gui_italic = 1
"endif

"if ! exists("g:monokai_term_italic")
    "let g:monokai_term_italic = 0
"endif

let g:monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ruby_box"

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:monokai_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:monokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------


let s:white       = { "gui": "#E8E8E3", "cterm": "255" }
let s:black       = { "gui": "#272822", "cterm": "234" }
let s:lightblack  = { "gui": "#2D2E27", "cterm": "232" }
let s:lightblack2 = { "gui": "#383a3e", "cterm": "16" }
let s:darkblack   = { "gui": "#211F1C", "cterm": "232" }
let s:grey        = { "gui": "#8F908A", "cterm": "243" }
let s:lightgrey   = { "gui": "#575b61", "cterm": "239" }
let s:darkgrey    = { "gui": "#64645e", "cterm": "235" }
let s:warmgrey    = { "gui": "#75715E", "cterm": "244" }
let s:warmgrey2    = { "gui": "#75715E", "cterm": "248" }

let s:red        = { "gui": "#a91718", "cterm": "131" }
let s:purple2     = { "gui": "#A6E22D", "cterm": "146" }
let s:aqua        = { "gui": "#66d9ef", "cterm": "159" }
let s:yellow      = { "gui": "#E6DB74", "cterm": "230" }
let s:orange      = { "gui": "#FD9720", "cterm": "138" }
let s:purple      = { "gui": "#ae81ff", "cterm": "138" }
let s:lightred         = { "gui": "#e73c50", "cterm": "196" }
let s:darkred     = { "gui": "#5f0000", "cterm": "52" }

let s:addfg       = { "gui": "#d7ffaf", "cterm": "193" }
let s:addbg       = { "gui": "#5f875f", "cterm": "65" }
let s:delbg       = { "gui": "#f75f5f", "cterm": "167" }
let s:changefg    = { "gui": "#d7d7ff", "cterm": "189" }
let s:changebg    = { "gui": "#5f5f87", "cterm": "60" }

" Highlighting
" ------------

" editor
call s:h("Normal",        { "fg": s:white,      "bg": s:black })
call s:h("ColorColumn",   {                     "bg": s:lightblack })
call s:h("Cursor",        { "fg": s:black,      "bg": s:white })
call s:h("CursorColumn",  {                     "bg": s:lightblack2 })
call s:h("CursorLine",    {                     "bg": s:lightblack2 })
call s:h("NonText",       { "fg": s:lightgrey })
call s:h("StatusLine",    { "fg": s:warmgrey,   "bg": s:black,        "format": "reverse" })
call s:h("StatusLineNC",  { "fg": s:darkgrey,   "bg": s:warmgrey,     "format": "reverse" })
call s:h("TabLine",       { "fg": s:white,      "bg": s:darkblack,    "format": "reverse" })
call s:h("Visual",        {                     "bg": s:lightgrey })
call s:h("Search",        { "fg": s:black,      "bg": s:yellow })
call s:h("MatchParen",    { "fg": s:purple,                           "format": "underline,bold" })
call s:h("Question",      { "fg": s:yellow })
call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:yellow })
call s:h("ErrorMsg",      { "fg": s:black,      "bg": s:lightred,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:lightred })
call s:h("VertSplit",     { "fg": s:darkgrey,   "bg": s:darkblack })
call s:h("LineNr",        { "fg": s:grey,       "bg": s:lightblack })
call s:h("CursorLineNr",  { "fg": s:white,     "bg": s:lightblack })
call s:h("SignColumn",    {                     "bg": s:lightblack })

" misc
call s:h("SpecialKey",    { "fg": s:red })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:aqua })

" diff
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:delbg })
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffText",      { "fg": s:black,      "bg": s:aqua })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack })
call s:h("FoldColumn",    {                     "bg": s:darkblack })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:lightblack, "bg": s:white })
call s:h("PmenuSel",      { "fg": s:aqua,       "bg": s:black,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:grey })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:orange })
call s:h("Number",        { "fg": s:orange })
call s:h("Float",         { "fg": s:orange })
call s:h("Boolean",       { "fg": s:orange })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:yellow })

call s:h("Type",          { "fg": s:aqua })
call s:h("Structure",     { "fg": s:aqua })
call s:h("StorageClass",  { "fg": s:aqua })
call s:h("Typedef",       { "fg": s:aqua })

call s:h("Identifier",    { "fg": s:white, "format":"bold" })
call s:h("Function",      { "fg": s:purple2 })

call s:h("Statement",     { "fg": s:red, "format": "bold" })
call s:h("Operator",      { "fg": s:red, "format": "bold" })
call s:h("Label",         { "fg": s:red, "format": "bold" })
call s:h("Keyword",       { "fg": s:aqua })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:purple2 })
call s:h("Include",       { "fg": s:red })
call s:h("Define",        { "fg": s:red })
call s:h("Macro",         { "fg": s:purple2 })
call s:h("PreCondit",     { "fg": s:purple2 })

call s:h("Special",       { "fg": s:aqua })
call s:h("SpecialChar",   { "fg": s:red })
call s:h("Delimiter",     { "fg": s:red })
call s:h("SpecialComment",{ "fg": s:aqua })
call s:h("Tag",           { "fg": s:red })
"        Debug"

call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:warmgrey, "format": "italic" })

call s:h("Underlined",    { "fg": s:purple2 })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:lightred, "bg": s:darkred })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow })
call s:h("NERDTreeClosable",        { "fg": s:yellow })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:red })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:red })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:grey })
call s:h("NERDTreeDir",             { "fg": s:grey })
call s:h("NERDTreeFlags",             { "fg": s:grey })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:red })

" Vim command
call s:h("vimCommand",              { "fg": s:red })

" Javascript
call s:h("jsFuncName",          { "fg": s:purple2 })
call s:h("jsFunction",          { "fg": s:aqua, "format": "italic" })
call s:h("jsFuncCall",          { "fg": s:purple2 })
call s:h("jsThis",              { "fg": s:red })
call s:h("jsFunctionKey",       { "fg": s:purple2 })
call s:h("jsPrototype",         { "fg": s:aqua })
call s:h("jsExceptions",        { "fg": s:aqua })
call s:h("jsFutureKeys",        { "fg": s:aqua })
call s:h("jsBuiltins",          { "fg": s:aqua })
call s:h("jsArgsObj",           { "fg": s:aqua })
call s:h("jsStatic",            { "fg": s:aqua })
call s:h("jsSuper",             { "fg": s:aqua })
call s:h("jsFuncArgRest",       { "fg": s:purple, "format": "italic" })
call s:h("jsFuncArgs",          { "fg": s:orange, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:aqua })
call s:h("jsDocTags",           { "fg": s:aqua,   "format": "italic" })

" Typescript
call s:h("typescriptArrowFuncArg",        { "fg": s:orange, "format": "italic" })
call s:h("typescriptFuncType",            { "fg": s:orange, "format": "italic" })
call s:h("typescriptCall",                { "fg": s:orange, "format": "italic" })
call s:h("typescriptVariable",            { "fg": s:aqua })
call s:h("typescriptModule",              { "fg": s:aqua })
call s:h("typescriptPredefinedType",      { "fg": s:aqua })
call s:h("typescriptFuncTypeArrow",       { "fg": s:aqua })
call s:h("typescriptImport",              { "fg": s:red })
call s:h("typescriptExport",              { "fg": s:red })
call s:h("typescriptCastKeyword",         { "fg": s:red })
call s:h("typescriptOperator",            { "fg": s:red })
call s:h("typescriptEndColons",           { "fg": s:white })
call s:h("typescriptObjectLabel",         { "fg": s:purple2 })
call s:h("typescriptAmbientDeclaration",  { "fg": s:red })

" Html
call s:h("htmlTag",             { "fg": s:red })
call s:h("htmlEndTag",          { "fg": s:red })
call s:h("htmlTagName",         { "fg": s:white })
call s:h("htmlArg",             { "fg": s:purple2 })
call s:h("htmlSpecialChar",     { "fg": s:purple })

" Xml
call s:h("xmlTag",              { "fg": s:red })
call s:h("xmlEndTag",           { "fg": s:red })
call s:h("xmlTagName",          { "fg": s:white, "format": "bold,italic" })
call s:h("xmlAttrib",           { "fg": s:purple2 })

" CSS
call s:h("cssProp",             { "fg": s:yellow })
call s:h("cssUIAttr",           { "fg": s:yellow })
call s:h("cssFunctionName",     { "fg": s:aqua })
call s:h("cssColor",            { "fg": s:purple })
call s:h("cssPseudoClassId",    { "fg": s:purple })
call s:h("cssClassName",        { "fg": s:purple2 })
call s:h("cssValueLength",      { "fg": s:purple })
call s:h("cssCommonAttr",       { "fg": s:red })
call s:h("cssBraces" ,          { "fg": s:white })
call s:h("cssClassNameDot",     { "fg": s:red })
call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })

" LESS
call s:h("lessVariable",        { "fg": s:purple2 })

" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {"fg": s:white, "format": "bold,italic"})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {"fg": s:purple})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:purple2 })
call s:h("rubyStringDelimiter",         { "fg": s:yellow })
call s:h("rubyRegexp",                  { "fg": s:orange, "format": "italic" })
call s:h("rubyRegexpDelimiter",         { "fg": s:orange, "format": "italic" })
call s:h("rubySymbol",                  { "fg": s:purple })
call s:h("rubyEscape",                  { "fg": s:purple })
call s:h("rubyInclude",                 { "fg": s:red, "format": "bold" })
call s:h("rubyOperator",                { "fg": s:red, "format": "bold" })
call s:h("rubyControl",                 { "fg": s:red, "format": "bold" })
call s:h("rubyClass",                   { "fg": s:red, "format": "bold" })
call s:h("rubyDefine",                  { "fg": s:red, "format": "bold" })
call s:h("rubyException",               { "fg": s:red, "format": "bold" })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
call s:h("rubyRailsARMethod",           { "fg": s:orange })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
call s:h("rubyRailsMethod",             { "fg": s:orange })
call s:h("rubyConstant",                { "fg": s:aqua, "format": "italic" })
call s:h("rubyBlockArgument",           { "fg": s:orange })
call s:h("rubyBlockParameter",          { "fg": s:orange })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:aqua })

" c
call s:h("cLabel",                      { "fg": s:red })
call s:h("cStructure",                  { "fg": s:red })
call s:h("cStorageClass",               { "fg": s:red })
call s:h("cInclude",                    { "fg": s:purple2 })
call s:h("cDefine",                     { "fg": s:purple2 })

" elixir

call s:h("elixirBlockDefinition",         { "fg": s:purple2, "format": "bold" })
call s:h("elixirDefine",                  { "fg": s:purple2, "format": "bold" })
call s:h("elixirPrivateDefine",           { "fg": s:purple2, "format": "bold" })
call s:h("elixirModuleDefine",            { "fg": s:purple2, "format": "bold" })
call s:h("elixirProtocolDefine",          { "fg": s:purple2, "format": "bold" })
call s:h("elixirImplDefine",              { "fg": s:purple2, "format": "bold" })
call s:h("elixirRecordDefine",            { "fg": s:purple2, "format": "bold" })
call s:h("elixirPrivateRecordDefine",     { "fg": s:purple2, "format": "bold" })
call s:h("elixirMacroDefine",             { "fg": s:purple2, "format": "bold" })
call s:h("elixirPrivateMacroDefine",      { "fg": s:purple2, "format": "bold" })
call s:h("elixirDelegateDefine",          { "fg": s:purple2, "format": "bold" })
call s:h("elixirOverridableDefine",       { "fg": s:purple2, "format": "bold" })
call s:h("elixirExceptionDefine",         { "fg": s:purple2, "format": "bold" })
call s:h("elixirCallbackDefine",          { "fg": s:purple2, "format": "bold" })
call s:h("elixirStructDefine",            { "fg": s:purple2, "format": "bold" })
call s:h("elixirExUnitMacro",             { "fg": s:purple2, "format": "bold" })
call s:h("elixirModuleDeclarationMacro",  { "fg": s:purple2, "format": "bold" })
call s:h("elixirKeyword",                 { "fg": s:purple2, "format": "bold" })
call s:h("elixirInclude",                 { "fg": s:red })
call s:h("elixirModuleDeclaration",       { "fg": s:aqua, "format": "italic" })
call s:h("elixirAlias",                   { "fg": s:aqua, "format": "italic" })
call s:h("elixirAtom",                    { "fg": s:purple, "format": "italic" })
call s:h("elixirOperator",                { "fg": s:red })
call s:h("elixirFunctionDeclaration",     { "fg": s:purple2 })
call s:h("elixirVariable",                { "fg": s:white, "format": "bold,italic" })
call s:h("elixirStringDelimiter",         { "fg": s:yellow })
call s:h("elixirDocStringDelimiter",       { "fg": s:warmgrey2 })

" go

call s:h("goFunction",         { "fg": s:purple2 })
