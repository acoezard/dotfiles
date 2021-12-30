" -----------------------------------------------------------------------------
" Utilise les parametres de Vim pluot que ceux de Vi 
" -----------------------------------------------------------------------------
set nocompatible

" -----------------------------------------------------------------------------
" Parametre Pathogen pour gerer les plugins
" -----------------------------------------------------------------------------
filetype off

execute pathogen#infect()

filetype plugin indent on

" -----------------------------------------------------------------------------
" Options basiques
" -----------------------------------------------------------------------------
set encoding=utf-8
set title
set noshowmode
set showcmd
set mouse=a
set clipboard^=unnamed,unnamedplus

" -----------------------------------------------------------------------------
" Options de l'editeur
" -----------------------------------------------------------------------------
set termencoding=utf-8
set number
set colorcolumn=80
set tabstop=4 
set smarttab
set autoindent
set showmatch
			
" -----------------------------------------------------------------------------
" Options pour la recherche
" -----------------------------------------------------------------------------
set incsearch
set hlsearch
set ignorecase
set smartcase

" -----------------------------------------------------------------------------
" Options de comportements
" -----------------------------------------------------------------------------
set history=1000
set undolevels=1000
set nobackup
set noswapfile
set updatetime=100
set visualbell
set noerrorbells 

" -----------------------------------------------------------------------------
" Options d'affichage
" -----------------------------------------------------------------------------
syntax on
set termguicolors
set t_Co=256
set background=dark
set list listchars=tab:→\ ,eol:↵,space:·,extends:»,precedes:«
colorscheme onedark

" -----------------------------------------------------------------------------
" Commandes automatiaues
" -----------------------------------------------------------------------------
if has("autocmd")
	autocmd VimEnter * NERDTree
	autocmd BufEnter NERD_tree_* | execute 'normal R'
endif

" -----------------------------------------------------------------------------
" Options de Syntastic
" -----------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_norminette_exec = 'norminette'
let g:syntastic_c_include_dirs = ['include', '../include', '../../include']
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler_options = "-Wall -Wextra -Werror"
let g:c_syntax_for_h = 1

" -----------------------------------------------------------------------------
" Options de NERDTree
" -----------------------------------------------------------------------------
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['\.swp$', '\.swo$', '\.DS_Store$']

" -----------------------------------------------------------------------------
" Options de Airline
" -----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = "onedark"
let g:airline#extensions#hunks#enabled = 1
