set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

filetype off

" https://github.com/junegunn/vim-plug/wiki/tips
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

Plug 'liuchengxu/vim-which-key'
set timeoutlen=300
let mapleader=","
nnoremap <silent> <leader> :WhichKey ','<CR>

nnoremap <Tab><Tab> :tabnext<CR>
nnoremap <S-Tab><S-Tab> :tabNext<CR>

" Automatically generate .tags for files under Git tracking
Plug 'ludovicchabant/vim-gutentags', { 'for': ['python', 'c'] }
let g:gutentags_ctags_tagfile='.tags'
" let g:gutentags_ctags_extra_args=['--fields=+la', '--javascript-kinds=vCcgpmfGS']


Plug 'majutsushi/tagbar'
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_visibility_symbols = {
		\ 'public'    : '+',
		\ 'protected' : '-',
		\ 'private'   : '#'
		\ }
let g:tagbar_width = 40 


" statusline on bottom
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
Plug 'bling/vim-airline'
let g:airline_section_x=''
let g:airline_section_y=''
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='badwolf'

set showcmd

" Git support
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
set updatetime=100
nnoremap <leader>gt :GitGutterToggle<CR>

" Plug 'rhysd/git-messenger.vim'
" let g:git_messenger_include_diff='current'

Plug 'mileszs/ack.vim'
if executable('ag')
	" let g:ackprg = 'ag --nonumbers -t'
	let g:ackprg = 'ag --vimgrep'
endif
let g:ack_qhandler="copen 5"
" let g:ag_prg="ag --nogroup"
let g:ack_highlight=1
command! AgFromSearch AckFromSearch
noremap <leader>a :AckFromSearch<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

command! -bang -nargs=* Ag
			\ call fzf#vim#grep('ag --column --nogroup --color --literal -- '.<q-args>, 1, fzf#vim#with_preview(), <bang>0)
nnoremap <leader>f :Files<CR>
noremap <C-e> :Buffers<CR>
" noremap <C-b> :Buffers<CR>
noremap <C-t> :Files<CR>
noremap <C-f> :Files<CR>
noremap <C-g> :GFiles<CR>

Plug 'scrooloose/nerdtree'
let NERDTreeIgnore=['__pycache__', 'node_modules', '.git$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=25
noremap <F1> :NERDTreeToggle<CR>

" buffer utiilties
" Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout. :Bdelete
Plug 'moll/vim-bbye'
" Plugin 'vim-scripts/buftabs'
" let buftabs_only_basename=1
" let g:buftabs_in_statusline=1
Plug 'jlanzarotta/bufexplorer'
let g:bufExplorerDefaultHelp=1
let g:bufExplorerDetailedHelp=1


" Toggle Comment - tlib_vim library provides some utility functions.
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tcomment_vim'

" insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'
let delimitMate_autoclose=1

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" SnipMate - Textual snnipets
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.dotfiles/vim/snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="horizontal"

" Plug 'ervandew/supertab', { 'for': ['python'] }
" let g:SuperTabDefaultCompletionType='<C-n>'

" Filetype - Python
" Plug 'vim-python/python-syntax'

Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled=0
let g:jedi#popup_on_dot=1
let g:jedi#popup_select_first=1
" let g:jedi#show_call_signatures=0
" https://stackoverflow.com/questions/29950767/does-jedi-vim-conflict-with-youcompleteme

" https://github.com/ycm-core/YouCompleteMe/issues/3764
" https://github.com/ycm-core/YouCompleteMe/issues/3805
" if has("patch-8.1.2269")
" 	Plug 'Valloric/YouCompleteMe', { 'for': ['python'], 'commit':'4e480a3' }
" else
" 	Plug 'Valloric/YouCompleteMe', { 'for': ['python'], 'commit':'d98f896' }
" endif
Plug 'Valloric/YouCompleteMe', { 'for': ['python'] }

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_auto_trigger=1
let g:ycm_auto_hover=''
let g:ycm_add_preview_to_completeopt=1
let g:ycm_confirm_extra_conf=0
nmap <leader>y :YcmCompleter<Space>
" nmap <leader>i <plug>(YCMHover)

nmap <leader>j :YcmCompleter GetDoc<CR>
" set completeopt-=preview
" make YCM compatible with UltiSnips (using supertab)

" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" https://github.com/Valloric/YouCompleteMe#option-2-provide-the-flags-manually
" let g:ycm_global_ycm_extra_conf="~/.dotfiles/vim/ycm_extra_conf.py"

" Plugin 'ajh17/VimCompletesMe'

" Syntax checker
Plug 'scrooloose/syntastic', { 'for': ['javascript', 'python', 'shell'] }
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_bash_checkers=['shellcheck']
" let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list=1


Plug 'vim-autoformat/vim-autoformat'
let g:autoformat_verbosemode=0
let g:formatters_c=['my_custom_c']
let g:formatdef_my_custom_c='"astyle --style=kr --indent-switches --indent=spaces=2 --pad-header --pad-oper --align-pointer=name --align-reference=name"'
" let g:formatters_python=['autopep8']
let g:formatters_vue=['my_custom_vue']
let g:formatdef_my_custom_vue='"vue-formatter"'
noremap <C-l> :Autoformat<CR>


" extended % matching for HTML, LaTeX, and many other languages
Plug 'tmhedberg/matchit'


" Filetype: JavaScript
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' } " Tern-based JavaScript editing support.
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify', { 'for': 'javascript' }
" au FileType javascript noremap <buffer>  <C-l> :call JsBeautify()<cr>
au FileType json noremap <buffer>  <C-l> :call JsonBeautify()<cr>
au FileType html noremap <buffer> <C-l> :call HtmlBeautify()<cr>
au FileType css noremap <buffer> <C-l> :call CSSBeautify()<cr>
au BufReadPost,FileReadPost *.json :call JsonBeautify()

" Filetype: Node.js
" Plugin 'moll/vim-node'
" Plugin 'myhere/vim-nodejs-complete'
" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Filetype: Vue.js
Plug 'posva/vim-vue', { 'for': ['vue'] }
Plug 'mattn/emmet-vim', { 'for': ['vue'] }

" Filetype: JSON
" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal=0

Plug 'jez/vim-superman'

Plug 'cocopon/iceberg.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'

Plug 'bps/vim-textobj-python'

Plug 'terryma/vim-expand-region'
let g:expand_region_text_objects={
			\ 'iw': 1,
			\ 'iW': 0,
			\ 'aw': 0,
			\ 'aW': 0,
			\ 'i"': 1,
			\ 'i''': 1,
			\ 'ib': 1,
			\ 'iB': 1,
			\ 'i]': 1,
			\ 'il': 1,
			\ 'a(': 1,
			\ }

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/ScrollColors'

" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'

" Plug 'Glench/Vim-Jinja2-Syntax'
" Plug 'lepture/vim-jinja'

" Plug 'puremourning/vimspector'
" let g:vimspector_enable_mappings = 'HUMAN'

" Plug 'skywind3000/asyncrun.vim'
Plug 'vim-test/vim-test'
let test#strategy = 'basic'
let test#python#pytest#options='--exitfirst --verbose --no-header --ignore-glob="_*"'


Plug 'simeji/winresizer'
" let g:winresizer_start_key = "<leader> w"
let g:winresizer_horiz_resize = 1
let g:winresizer_vert_resize = 1
let g:winresizer_start_key = 'C-0'
nnoremap <silent> <leader>w :WinResizerStartResize <CR>

" if empty(glob('~/.vim/python_ropevim.vim'))
" 	silent !wget -P ~/.vim/ https://raw.githubusercontent.com/python-rope/ropevim/master/ftplugin/python_ropevim.vim
" endif
" source ~/.vim/python_ropevim.vim
" Plug 'python-rope/ropevim', { 'for':['python'] }

Plug 'j5shi/CommandLineComplete.vim'
cmap <C-p> <Plug>CmdlineCompleteBackward
cmap <C-n> <Plug>CmdlineCompleteForward

Plug 'ap/vim-css-color'

call plug#end()

set runtimepath+=~/.dotfiles/vim
nmap <F9> :!chmod +x % && time ./%<CR>
nmap <F10> :TestSuite<CR>

syntax on
filetype plugin indent on

""" indent, code format
set autoindent
set cindent
" https://www.reddit.com/r/vim/wiki/vimrctips#wiki_do_not_use_smartindent
" set smartindent

""" Colors
set t_Co=256
colorscheme night_shift
set cursorline
syntax enable
nnoremap <leader>vc :exec "edit" expand("$HOME/.dotfiles/vim/colors/" . g:colors_name . ".vim")<CR>

set showmatch
set matchtime=5 "Number of seconds to display parenthesis matched

""" ENCODING
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" set splitbelow splitright
set splitright

""" ALERT - No Beep
set t_vb=
set visualbell

set number
set wrap
set softtabstop=2 tabstop=2 shiftwidth=2

set noswapfile
set nobackup
set nowritebackup

""" SEARCH
set smartcase
set ignorecase
set wildignorecase
set wildignore+=*.pyc,*/__pycache__/*
set incsearch
set hlsearch " Hilights matched keywords
set wildmenu

""" STATUS LINE
set laststatus=2 " shown as the second last line:
set showcmd
set history=100

set diffopt+=vertical
set diffopt+=iwhiteall  "Ignore white space character on 'vimdiff'
set diffopt+=internal
set diffopt+=algorithm:minimal
set diffopt+=context:3
" https://www.reddit.com/r/vim/comments/j9fijy/how_to_disable_showing_for_empty_line_in_difftool/
set fillchars=diff:\ 

"Hit ESC twice dismiss hilights
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" HTML 内の JavaScript コードをインデント
" http://d.hatena.ne.jp/firisu/20120917/1347860271
au FileType html :setlocal indentexpr=""

" Display all matching files on hitting tab for completion
set wildmenu
set wildmode=longest,full

" http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.plist set filetype=xml
au BufNewFile,BufRead .jshintrc set filetype=json
au BufNewFile,BufRead .tern-project set filetype=json
au BufNewFile,BufRead *.conf set filetype=config
au BufNewFile,BufRead *.j2 set filetype=jinja
au BufNewFile,BufRead *.robot set filetype=rst

set exrc							" Enable project specific .vimrc

" Folding
set foldmethod=manual
set foldcolumn=1
nnoremap <space> za		" Enable folding with the spacebar
" set foldlevelstart=1
set foldclose=all

nnoremap <C-n> :bnext<CR>

" http://vim.wikia.com/wiki/Using_tab_pages
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>
" nnoremap <F2> gt<CR>

" Mouse Support
" https://unix.stackexchange.com/a/140584
" https://stackoverflow.com/questions/4608161/copying-text-outside-of-vim-with-set-mouse-a-enabled#4608387
set mouse=a

" http://vim-jp.org/vimdoc-ja/usr_21.html#21.3
set viminfo='1000,f1

map <leader>s :source $MYVIMRC<CR>

set helpheight=45

nmap <F2> :lnext<CR>

" hi Eq ctermfg=yellow
hi Eq ctermfg=green
hi Neq ctermfg=red

vmap <C-c> "*y<CR>

function MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by MyTabLabel()
		let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999Xclose'
	endif

	return s
endfunction

function MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

set tabline=%!MyTabLine()
" set list listchars=tab:>-  " visualize hard tabs as >---"
set autoread
