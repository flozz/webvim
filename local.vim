" ====== MISC ======

set dir=/tmp  " folder for swap file

set listchars=nbsp:¤,tab:❭─,trail:•
set list!

set tabstop=4
set nowrap

set selection=inclusive
set showmatch!


" ====== GUI / THEME / COLOR ======

"colorscheme mango
colorscheme gruvbox
if has("gui_running")
    "highlight Normal guibg=#111111 guifg=white
    set guioptions-=a  " Disable primary seletion
    set guioptions-=b  " No Horizontal scrollbar
    set guioptions-=r  " No Vertical scrollbar
    set guioptions-=T  " No Toolbar
    set ttyfast        " Fast terminal
    set columns=120    " Window's width
    set lines=40       " Window's height
    set mousemodel=popup_setpos  " display contex menu on right click
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
let ignore .= '|.git'
let ignore .= '|.bzr'

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
