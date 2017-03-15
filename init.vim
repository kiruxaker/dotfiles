
" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================


" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'auto-pairs-gentle'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'majutsushi/tagbar' 
NeoBundle 'artur-shaik/vim-javacomplete2' "java autocomplete

NeoBundle 'bling/vim-airline'               " Lean & mean status/tabline for vim
NeoBundle 'fisadev/FixedTaskList.vim'   " Pending tasks list
NeoBundle 'rosenfeld/conque-term'       " Consoles as buffers
NeoBundle 'tpope/vim-surround'      " Parentheses, brackets, quotes, XML tags, and more

NeoBundle 'garbas/vim-snipmate'     " Snippets manager
NeoBundle 'MarcWeber/vim-addon-mw-utils'    " dependencies #1
NeoBundle 'tomtom/tlib_vim'     " dependencies #2
NeoBundle 'honza/vim-snippets'      " snippets repo

NeoBundle 'klen/python-mode'            " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
NeoBundle 'davidhalter/jedi-vim'        " Jedi-vim autocomplete plugin
NeoBundle 'mitsuhiko/vim-jinja'     " Jinja support for vim
NeoBundle 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }
" ------------------------------------

call neobundle#end()  
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

:set autoindent
:set cindent
execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
" actually everything for splits))
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set splitbelow
set splitright

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
"" set tabstop=4
"" set softtabstop=4
"" set shiftwidth=4
"" set shiftround
"" set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
 let g:pymode_doc = 0
 let g:pymode_doc_key = 'K'
" " проверка кода
 let g:pymode_lint = 1
 let g:pymode_lint_checker = "pyflakes,pep8"
 let g:pymode_lint_ignore="E501,W601,C0110"
" " провека кода после сохранения
 let g:pymode_lint_write = 1
"
" " поддержка virtualenv
 let g:pymode_virtualenv = 1
"
" " установка breakpoints
 let g:pymode_breakpoint = 1
 let g:pymode_breakpoint_key = '<leader>b'
"
" " подстветка синтаксиса
 let g:pymode_syntax = 1
 let g:pymode_syntax_all = 1
 let g:pymode_syntax_indent_errors = g:pymode_syntax_all
 let g:pymode_syntax_space_errors = g:pymode_syntax_all

" " отключить autofold по коду
 let g:pymode_folding = 0
"
" " возможность запускать код
let g:pymode_run = 0

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z" 
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 1

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
 endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

"NERDTREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"TagBar
autocmd vimenter * TagbarToggle
nmap <F8> :TagbarToggle<CR>

"Split switching
set winheight=999
set winminheight=0

"Java autocomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

  nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
    nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
      nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
        nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

      imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
        imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
          imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
            imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

          nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

            imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

              nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
                nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
              nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
                nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter) ""lol, didn't men to do it))))
                  nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
                    nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
                  nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
                    nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

                      imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
                        imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
                      imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

                        vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
                          vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
                            vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

                          nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
                            nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

let g:snips_trigger_key = '<C-t>'
