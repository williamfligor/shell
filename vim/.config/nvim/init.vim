let g:spacemacs#excludes = [
  \ 'b',
\ ]

" Before
source $HOME/.vim/plugins.vim
source $HOME/.vim/utils.vim
source $HOME/.vim/mappings.vim

" After
source $HOME/.vim/keys.vim
source $HOME/.vim/theme.vim
source $HOME/.vim/autocomplete.vim

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showcmd
set showmode
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set undofile
set grepprg=grep\ -nH\ $*
set autoindent
set ignorecase
set scrolloff=3
set nrformats=
set wildmenu
set wildmode=longest:full,full
