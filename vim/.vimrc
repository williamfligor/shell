set nocompatible              
filetype off                

let s:darwin = has('mac')

call plug#begin('~/.vim/plugged')

function! BuildVimProc(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !make
    endif
endfunction


Plug 'Shougo/unite.vim'
Plug 'tomasr/molokai'
Plug 'justinj/vim-react-snippets'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'Raimondi/delimitMate'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neoinclude.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/echodoc.vim'
    Plug 'tweekmonster/deoplete-clang2'
else
    Plug 'Shougo/vimproc', { 'do': function('BuildVimProc') }
    Plug 'Shougo/neocomplete'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
endif

" Languages
Plug 'honza/dockerfile.vim'

if s:darwin
    Plug 'Keithbsmiley/investigate.vim'
    Plug 'rizzatti/dash.vim'
endif

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
                \ if expand("<afile>:p:h") !=? $TEMP |
                \   if line("'\"") > 1 && line("'\"") <= line("$") |
                \     let JumpCursorOnEdit_foo = line("'\"") |
                \     let b:doopenfold = 1 |
                \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
                \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
                \        let b:doopenfold = 2 |
                \     endif |
                \     exe JumpCursorOnEdit_foo |
                \   endif |
                \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
                \ if exists("b:doopenfold") |
                \   exe "normal zv" |
                \   if(b:doopenfold > 1) |
                \       exe  "+".1 |
                \   endif |
                \   unlet b:doopenfold |
                \ endif
augroup END

let mapleader = ","

filetype plugin indent on
syntax on
set background=dark
colorscheme molokai

" Airline Theme
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1 

set nocompatible

if $TMUX == ''
    set clipboard+=unnamed
endif

set showcmd
set showmode
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number  
set relativenumber
" set undofile
set grepprg=grep\ -nH\ $*
set autoindent
set ignorecase
set scrolloff=3
set nrformats=

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
    set spl=en spell
    set nospell
endif

" Toggle relative numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc

nnoremap <leader>rn :call NumberToggle()<Cr>

" Real men use gcc
"compiler gcc

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>
inoremap kk <Esc>

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Invisible character
" set list
" set listchars=tab:▸\ ,eol:¬

nnoremap j gj
nnoremap k gk

nnoremap n nzz

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reselect pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" New verticle window split
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>k

" Moving around windows
nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l

" Tab theme
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" Fix for Tern for Vim
set completeopt-=preview

" Make %% in command line expand to the path of the current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Unite Mappings
nnoremap <leader>f :Unite -start-insert file_rec/async<cr>
nnoremap <leader>b :Unite -start-insert buffer<cr>
" Unite turn on history
let g:unite_source_history_yank_enable = 1
map <silent> <Leader>y :Unite history/yank<CR>

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

" Reselect after indent outdent
vnoremap < <gv
vnoremap > >gv

"Disable paste mode when leaving insert
au InsertLeave * set nopaste
au BufNewFile,BufRead Dockerfile* set filetype=dockerfile

" Resizing windows
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Vimux
nnoremap <leader>vr :VimuxPromptCommand<cr>
nnoremap <leader>vl :VimuxRunLastCommand<cr>
nnoremap <leader>vc :VimuxCloseRunner<cr>

" GUI Disable scrollbars
set guioptions-=r 

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Latex
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>

nnoremap <space>tc :tabnew<CR>
nnoremap <space>tn :tabnext<CR>
nnoremap <space>tp :tabprevious<CR>
nnoremap <space>tf :tabfirst<CR>
nnoremap <space>tl :tablast<CR>

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

augroup haskell
    autocmd!
    autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>:SyntasticReset<cr>
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    let $PATH = $PATH . ':' . expand('~/.cabal/bin')
    set cmdheight=2 " Don't show the press enter window on haskell error
augroup END


" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1

let swapdir = expand('~/.vim/swap')
if !isdirectory(swapdir)
    call mkdir(swapdir)
endif

let backupdir = expand('~/.vim/backup')
if !isdirectory(backupdir)
    call mkdir(backupdir)
endif

" Disable gitgutter by default
let g:gitgutter_enabled = 0


"Status line gnarliness
" set laststatus=2
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

if executable('reattach-to-user-namespace')
    set clipboard=unnamed
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

if has('nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_complete_start_length = 1
    let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/4.0.0_1/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/4.0.0_1/include/clang/'

    " To use echodoc, you must increase 'cmdheight' value.
    set cmdheight=2
    let g:echodoc_enable_at_startup = 1
else
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    let g:neosnippet#enable_snipmate_compatibility = 1

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: "\<TAB>"
endif
