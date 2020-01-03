
" Use Vim defaults instead of 100% vi compatibility
set nocompatible
" More powerful backspacing
set backspace=2

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'ludovicchabant/vim-gutentags'

Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

filetype plugin indent on

set paste
set nu
set showmatch
set nowrap

set ruler
set cursorline
set cursorcolumn
set wildmenu

set hlsearch
set incsearch

syntax on

" Fixup ALT key of terminal Vim
set timeout
if $TMUX != ''
	set timeoutlen=30
elseif &timeoutlen > 80 || &timeoutlen <= 0
	set timeoutlen=80
endif

if !(has('nvim') || has('gui_running'))
	for i in range(97,122)
		let c = nr2char(i)
		exec "map \e".c." <M-".c.">"
		exec "map! \e".c." <M-".c.">"
	endfor
endif

" Configure ctags
set tags=./.tags;,.tags

" Configure LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
"let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" Configure gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

colorscheme molokai
let t_Co = 256

let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

hi Comment	guifg=#ffff00 ctermfg=226 cterm=none

