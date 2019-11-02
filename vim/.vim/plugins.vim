let s:darwin = has('mac')

call plug#begin('~/.vim/plugged')

" Things to support spacemacs bindings
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'hecal3/vim-leader-guide'
Plug 'jimmay5469/vim-spacemacs'
Plug 'tpope/vim-sensible'

" Theming
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'micha/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/rainbow_parentheses.vim'

" Utils
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'ervandew/supertab'

" Doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'

" Languages
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vhdirk/vim-cmake'

call plug#end()

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Unite
let g:unite_source_grep_default_opts = "-iRHn"
            \ . " --exclude='*.svn*'"
            \ . " --exclude='*.svn*'"
            \ . " --exclude='*.log*'"
            \ . " --exclude='*tmp*'"
            \ . " --exclude-dir='**/tmp'"
            \ . " --exclude-dir='CVS'"
            \ . " --exclude-dir='.svn'"
            \ . " --exclude-dir='.git'"
            \ . " --exclude-dir='coverage'"
            \ . " --exclude-dir='node_modules'"

" Ctrlp
let g:ctrlp_show_hidden = 1

" Rainbow always on
autocmd FileType * RainbowParentheses

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1
