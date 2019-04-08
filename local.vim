" ====== MISC ======

set dir=/tmp  " folder for swap file

set listchars=nbsp:¤,tab:❭─,trail:•
set list!

set tabstop=4
set nowrap

set selection=inclusive
set showmatch!

set modeline

" Strip trailing whitespaces when saving
autocmd BufWritePre * %s/\s\+$//e

" Keep some context when scrolling
set scrolloff=4

" Use system clipboard as default register
set clipboard=unnamedplus

" Crypt method
set cryptmethod=blowfish2


" ====== GUI / THEME / COLOR ======

"colorscheme mango
colorscheme gruvbox
if has("gui_running")
    "highlight Normal guibg=#111111 guifg=white
    set guioptions-=a  " Disable primary seletion
    set guioptions-=b  " No Horizontal scrollbar
    set guioptions-=r  " No Vertical scrollbar
    set guioptions-=T  " No Toolbar
    set ttyfast        " Fast terminaltargetInfo && targetInfo.point === indice
    set columns=120    " Window's width
    set lines=40       " Window's height
    set mousemodel=popup_setpos  " display contex menu on right click
    set guifont=Monospace\ 11
endif


" ====== COMMANDS ======

" Go in the current file's folder
function! ChangeToFileDirectory()
    if bufname("") !~ "^ftp://" "Local file?
        lcd %:p:h "Go in the file folder
    endif
endfunction
com CD call ChangeToFileDirectory()
call ChangeToFileDirectory() "Auto CD at start


" ====== WINDOWS LIKE MAPPING ======

"silent! source $VIMRUNTIME/mswin.vim "MSWin shortcut (Ctrl+C, Ctrl+V,...)

" Ctrl+Q -> alias Ctrl+V for visual mode
noremap <C-Q> <C-V>

" Ctrl+X -> Cut selection to clipboard
vnoremap <C-X> "+x

" Ctrl+C -> Copy selection to clipboard
vnoremap <C-C> "+ygv

" Ctrl+V -> Paste from clipboard
map <C-V> "+gP
cmap <C-V> <C-R>+
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" Ctrl+S -> Save
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Ctrl+Z -> undo
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" Ctrl+Y -> redo
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" backspace in Visual mode deletes selection
vnoremap <BS> d


" ====== MAPPING ======

" Indent
nmap <tab> >>
nmap <s-tab> <<
vmap <tab> >gv
vmap <s-tab> <gv

" PageUp/Down -> nop
map <pageup> <nop>
map <pagedown> <nop>
imap <pageup> <nop>
imap <pagedown> <nop>

" Shift+PageUp/Down -> Buffer prev/next
map <s-pageup> :bp<cr>
map <s-pagedown> :bn<cr>
imap <s-pageup> <esc>:bp<cr>i
imap <s-pagedown> <esc>:bn<cr>i

"Leader t -> new tab
nnoremap <leader>t :tabnew<cr>

"Surround
nnoremap <leader>" viwc"<esc>pa"<esc>
nnoremap <leader>' viwc"<esc>pa'<esc>

" Select last change (aka last paste)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" ====== PLUGINS ======

" list of files to ignore (for FuzzyFinder and NERDTree)
let ignore = '\v\~$'
let ignore .= '|\.bak$'
let ignore .= '|\.png$'
let ignore .= '|\.jpe?g$'
let ignore .= '|\.gif$'
let ignore .= '|\.svg$'
let ignore .= '|\.xcf$'
let ignore .= '|\.pyc$'
let ignore .= '|node_modules'
let ignore .= '|.git$'
let ignore .= '|.bzr$'
let ignore .= '|__env__'
let ignore .= '|__pycache__'
let ignore .= '|\.egg-info$'
let ignore .= '|\.cache$'
let ignore .= '|\.tox$'
let ignore .= '|\.o$'
let ignore .= '|\.rel$'
let ignore .= '|\.noi$'
let ignore .= '|\.sym$'
let ignore .= '|\.lk$'
let ignore .= '|\.lst$'

"if filereadable(".gitignore")
  "for line in readfile(".gitignore")
    "let line = substitute(line, '\.', '\\.', 'g')
    "let line = substitute(line, '\*', '.*', 'g')
    "let ignore .= '|^' . line
  "endfor
"endif

" NERD Commenter
vnoremap <c-space> <esc>:call NERDComment('x', 'toggle')<cr>gv
nnoremap <c-space> <esc>:call NERDComment('n', 'toggle')<cr>
inoremap <c-space> <esc>:call NERDComment('n', 'toggle')<cr>a

" NERD Tree
nnoremap <F12> :NERDTreeTabsToggle<cr>
inoremap <F12> <esc>:NERDTreeTabsToggle<cr><c-w>la
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeIgnore = [ignore]

" Gundo
nnoremap <leader>h :GundoToggle<cr>

"FuzzyFinder
nmap <c-e> <esc>:FufCoverageFile<cr>
imap <c-e> <esc>:FufCoverageFile<cr>
let g:fuf_coveragefile_exclude = ignore

" vim json
let g:vim_json_syntax_conceal = 0

" vim babel (requires babel-cli command)
nmap <leader>b :Babel vert<cr>
vmap <leader>b :Babel vert<cr>

" Format paragraph for markdown / restructured text / text file
autocmd FileType markdown,text,rst PencilSoft
autocmd FileType markdown,text,rst setlocal list
autocmd FileType markdown,text,rst nnoremap <buffer> <c-f> gqip
autocmd FileType markdown,text,rst vnoremap <buffer> <c-f> gq
autocmd FileType markdown,text,rst inoremap <buffer> <c-f> <esc>gqipA

" Tern for vim
autocmd FileType javascript nmap <buffer> <leader>d :TernDef<cr>
autocmd FileType javascript nmap <buffer> <leader>r :TernRefs<cr>
autocmd FileType javascript nmap <buffer> <leader>c :TernDoc<cr>
autocmd FileType javascript nmap <buffer> <leader>m :TernRename<cr>
autocmd FileType javascript nmap <buffer> <leader>i :TernType<cr>

" Re-indent XML
autocmd FileType xml noremap <buffer> <c-f> ggVG!xmllint --format -<cr>
autocmd FileType xml vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>

" JSON and YAML indent
autocmd FileType yaml set ts=2
autocmd FileType json set ts=2

" vim-jsdoc
autocmd FileType javascript nmap <buffer> <leader>q :JsDoc<cr>
let g:jsdoc_input_description = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_access_descriptions = 2
let g:jsdoc_enable_es6 = 1
let g:jsdoc_custom_args_hook = {
\   '^\(callback\|cb\)$': {
\     'type': '{Function}',
\     'description': 'Callback function'
\   },
\   '^\(data\|metadata\)$': {
\     'type': '{Object}'
\   },
\   '^event$': {
\     'type': '{Event}'
\   },
\   '^element$': {
\     'type': '{Element}'
\   },
\   '^\(err\|error\)$': {
\     'type': '{Error}'
\   },
\   '^\(x\|y\|z\|i\|n\|count\)$': {
\     'type': '{Number}'
\   },
\   '^_\?\(is\|has\)': {
\     'type': '{Boolean}'
\   },
\   '^\(options\|params\|config\)$': {
\     'type': '{Object}'
\   },
\   '^mstate$': {
\     'type': '{Object}',
\     'description': 'PhotonUI.MouseManager mstate object'
\   },
\   '^canvas$': {
\     'type': '{HTMLCanvasElement}'
\   },
\   '^ctx$': {
\     'type': '{CanvasRenderingContext2D}'
\   },
\}
let g:jsdoc_tags = {
\  'returns': 'return',
\  'function': 'function',
\  'param': 'param',
\  'class': 'class'
\}

" vim table mode
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

autocmd FileType markdown,text,rst inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
autocmd FileType markdown,text,rst inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

autocmd FileType rst let g:table_mode_corner_corner='+'
autocmd FileType rst let g:table_mode_header_fillchar='='

autocmd FileType markdown let g:table_mode_corner='|'
