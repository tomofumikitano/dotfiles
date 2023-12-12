set number
set encoding=utf-8

set nobackup
set nowritebackup

set updatetime=500
set signcolumn=yes

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/vim-plug'

" Plug 'sheerun/vim-polyglot'

Plug 'luochen1990/rainbow'
let g:rainbow_active=1

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"

Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use <c-space> to trigger completion
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
inoremap <silent><expr> <C-@> coc#refresh()

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
if CocAction('hasProvider', 'hover')
call CocActionAsync('doHover')
else
call feedkeys('K', 'in')
endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>r <Plug>(coc-rename)


let g:coc_global_extensions=[ 'coc-powershell', 'coc-pyright' ]

Plug 'vim-autoformat/vim-autoformat'
" let g:formatters_c=['my_custom_c']
" let g:formatdef_my_custom_c='"astyle --style=kr --indent-switches --indent=spaces=2 --pad-header --pad-oper--align-pointer=name --align-reference=name"'

let g:formatdef_my_custom_python='"autopep8 --indent-size=2 --ignore=E121"'
let g:formatters_python=['my_custom_python']
noremap <C-l> :Autoformat<CR>

call plug#end()

" Make <tab> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
"
" inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm()
"                       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr><Tab> coc#pum#visible() ? coc#_select_confirm() : "\<Tab>"

noremap <F9> :!clear && chmod +x % && ./%<CR>
" noremap <C-l> :CocCommand prettier.forceFormatDocument<CR>

autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2
hi MatchParen term=underline cterm=underline gui=underline

set runtimepath+=$HOME/vim_night_shift
colorscheme night_shift
