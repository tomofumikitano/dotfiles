set background=dark
hi clear
if exists('syntax_on')
syntax reset
endif
let g:colors_name="night_shift"

hi Comment                      ctermfg=250
hi Todo                                 ctermfg=214 ctermbg=NONE
hi Search                               ctermbg=Blue

hi Constant                     ctermfg=082
hi String                               ctermfg=086
hi Character    ctermfg=154
hi Number                               ctermfg=085

hi Repeat                               ctermfg=207
hi Include                      ctermfg=153

hi Function                     ctermfg=111
hi Identifier   ctermfg=220

hi Statement            ctermfg=177
hi Repeat                               ctermfg=177
hi Conditional  ctermfg=177

hi StatusLine           ctermbg=darkgrey ctermfg=white
hi StatusLineNC ctermbg=black ctermfg=lightgrey

hi VertSplit            ctermbg=black ctermfg=lightgrey

hi LineNr                               ctermfg=240
" https://stackoverflow.com/questions/8247243/highlighting-the-current-line-number-in-vim/26205823#26205823
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
hi CursorLineNr ctermfg=214     cterm=NONE
hi Cursor ctermbg=black
hi MatchParen cterm=underline ctermbg=NONE
hi EndOfBuffer ctermfg=black

hi Visual                               ctermfg=NONE     ctermbg=236    cterm=NONE

" hi Error ctermfg=red cterm=NONE
" hi Error       ctermfg=red    ctermbg=red    cterm=NONE
" hi ErrorMsg    ctermfg=red    cterm=NONE

hi WarningMsg           ctermfg=16       ctermbg=red  cterm=NONE
hi SpellBad                     ctermfg=Red      ctermbg=None cterm=underline,italic

hi Pmenu                        ctermfg=White ctermbg=20
hi PmenuSel             ctermfg=White ctermbg=33

" Python
" Python's multi-line comment
hi pythonComment                ctermfg=250
hi pythonDecorator      ctermfg=222
" hi pythonSpaceError ctermbg=red
hi pythonConstants ctermfg=yellow

hi DiffText             cterm=NONE ctermfg=NONE ctermbg=235
hi DiffAdd                      cterm=NONE ctermfg=NONE ctermbg=235
hi DiffChange           cterm=NONE ctermfg=NONE ctermbg=NONE
hi DiffDelete           ctermbg=NONE

" hi Eq ctermfg=yellow ctermbg=NONE
" hi Neq ctermfg=red ctermbg=NONE

" vim-gitgutter
hi SignColumn ctermbg=None
