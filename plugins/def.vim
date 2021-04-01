" Start plugins definition
call plug#begin($HOME.'/.vim/plugins/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'goatslacker/mango.vim'
Plug 'bling/vim-airline', { 'do' : $HOME.'/.vim/fonts/install' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
"Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'maksimr/vim-jsbeautify', { 'do' : 'git submodule update --init --recursive' }
"Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'marijnh/tern_for_vim', { 'do' : 'npm install' }
Plug 'moll/vim-node'
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'
Plug 'kshenoy/vim-signature'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'sjl/gundo.vim'
Plug 'flozz/gruvbox'
Plug 'clones/vim-fuzzyfinder'
Plug 'vim-scripts/L9'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jbgutierrez/vim-babel'
Plug 'mattn/webapi-vim'
Plug 'Shougo/vinarise.vim'
Plug 'reedes/vim-pencil'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
"Plug 'gko/vim-coloresque'
Plug 'ap/vim-css-color'
Plug 'heavenshell/vim-jsdoc'
Plug 'vim-scripts/nginx.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dpelle/vim-Grammalecte'
Plug 'junegunn/vim-peekaboo'
Plug 'EgZvor/vim-black', { 'branch': 'main' }
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()
