" Vim color file
" Original Maintainer:  Lars H. Nielsen (dengmao@gmail.com)
"
" Converting for 256-color terminals by
" Danila Bespalov (danila.bespalov@gmail.com)
" with great help of tool by Wolfgang Frisch (xororand@frexx.de)
" inspired by David Liang's version (bmdavll@gmail.com)
"
" This version modified by Hu Sixu (husixu1@gmail.com)

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "wombat256"

" General colors
hi Normal               ctermfg=254     ctermbg=234     cterm=NONE          guifg=#f6f3e8   guibg=#242424   gui=NONE
hi Cursor               ctermfg=NONE    ctermbg=33      cterm=NONE          guifg=NONE      guibg=#0087ff   gui=NONE
hi CursorLine                           ctermbg=236     cterm=NONE                          guibg=#2d2d2d
hi MatchParen           ctermfg=7       ctermbg=243     cterm=bold          guifg=#f6f3e8   guibg=#857b6f   gui=bold
hi Visual               ctermfg=7       ctermbg=238     cterm=NONE          guifg=#f6f3e8   guibg=#444444   gui=NONE

" hi VisualNOS
" hi Search
hi Folded               ctermfg=103     ctermbg=235     cterm=NONE          guifg=#a0a8b0   guibg=#384048   gui=NONE
hi Title                ctermfg=7       ctermbg=NONE    cterm=bold          guifg=#f6f3e8   guibg=NONE      gui=bold
hi StatusLine           ctermfg=7       ctermbg=238     cterm=NONE          guifg=#f6f3e8   guibg=#444444   gui=italic
hi VertSplit            ctermfg=243     ctermbg=234     cterm=NONE          guifg=#444444   guibg=#444444   gui=NONE
hi StatusLineNC         ctermfg=243     ctermbg=238     cterm=NONE          guifg=#857b6f   guibg=#444444   gui=NONE
hi LineNr               ctermfg=243     ctermbg=0       cterm=NONE          guifg=#857b6f   guibg=#000000   gui=NONE
hi SignColumn           ctermfg=204     ctermbg=0       cterm=NONE          guifg=#ff5f87   guibg=#000000   gui=NONE
hi CursorLineNr                                         cterm=NONE
hi SpecialKey           ctermfg=244     ctermbg=236     cterm=NONE          guifg=#808080   guibg=#343434   gui=NONE
hi NonText              ctermfg=234     ctermbg=234     cterm=NONE          guifg=#808080   guibg=#303030   gui=NONE
hi Conceal              ctermfg=172     ctermbg=234     cterm=bold          guifg=#8f8f8f                   gui=italic
hi Error                ctermfg=9       ctermbg=234     cterm=underline     guifg=#ff0000   guibg=#303030   gui=NONE
hi ColorColumn                          ctermbg=235                                         guibg=#262626

" Popup menu
hi Pmenu                ctermfg=7       ctermbg=238                         guifg=#f6f3e8   guibg=#444444
hi PmenuSel             ctermfg=0       ctermbg=192                         guifg=#000000   guibg=#cae682

" Spelling errors
hi SpellBad             ctermfg=9       ctermbg=234     cterm=underline                                     gui=undercurl
hi SpellCap             ctermfg=12      ctermbg=234     cterm=underline                                     gui=undercurl
hi SpellRare            ctermfg=251     ctermbg=234     cterm=underline                                     gui=undercurl
hi SpellLocal           ctermfg=251     ctermbg=234     cterm=underline                                     gui=undercurl

" Syntax highlighting
hi Keyword              ctermfg=111                     cterm=NONE          guifg=#8ac6f2                   gui=NONE
hi Statement            ctermfg=111                     cterm=NONE          guifg=#8ac6f2                   gui=NONE
hi Constant             ctermfg=173                     cterm=NONE          guifg=#e5786d                   gui=NONE
hi Number               ctermfg=173                     cterm=NONE          guifg=#e5786d                   gui=NONE
hi PreProc              ctermfg=173                     cterm=NONE          guifg=#e5786d                   gui=NONE
hi Function             ctermfg=192                     cterm=NONE          guifg=#cae682                   gui=NONE
hi Identifier           ctermfg=192                     cterm=NONE          guifg=#cae682                   gui=NONE
hi Type                 ctermfg=194                     cterm=NONE          guifg=#cae682                   gui=NONE
hi Special              ctermfg=194                     cterm=NONE          guifg=#e7f6da                   gui=NONE
hi String               ctermfg=113                     cterm=NONE          guifg=#95e454                   gui=italic
hi Comment              ctermfg=246                     cterm=NONE          guifg=#99968b                   gui=italic
hi Todo                 ctermfg=245     ctermbg=220     cterm=NONE          guifg=#8f8f8f                   gui=italic

" Links
hi! link FoldColumn     Folded
hi! link CursorColumn   CursorLine

" Diff colors
hi DiffAdd                              ctermbg=236     cterm=bold                          guibg=#303030
hi DiffChange                           ctermbg=236                                         guibg=#303030
hi DiffDelete           ctermfg=9       ctermbg=NONE    cterm=NONE          guifg=#ff0000   guibg=NONE      gui=strikethrough
hi DiffText             ctermfg=39      ctermbg=236     cterm=bold          guifg=#00afff   guibg=#303030   gui=bold

" Plugin-related colors
hi! link CocPum                         Pmenu
hi! link CocMenuSel                     PmenuSel
hi! link CocFloatDividingLine           Pmenu

hi YcmErrorSign                         ctermbg=169
hi YcmWarningSign                       ctermbg=192
hi YcmErrorSection                      ctermbg=134
hi YcmWarningSection                    ctermbg=169

hi ALEErrorSign         ctermfg=9       ctermbg=0       cterm=bold          guifg=#ff0000   guibg=#303030   gui=bold
hi ALEWarningSign       ctermfg=192     ctermbg=0       cterm=bold          guifg=#d7ff87   guibg=#303030   gui=bold
hi ALEInfoSign          ctermfg=33      ctermbg=0       cterm=bold          guifg=#0087ff   guibg=#303030   gui=bold
hi ALEStyleErrorSign    ctermfg=9       ctermbg=0       cterm=NONE          guifg=#ff0000   guibg=#303030   gui=NONE
hi ALEStyleWarningSign  ctermfg=192     ctermbg=0       cterm=NONE          guifg=#d7ff87   guibg=#303030   gui=NONE

hi IndentGuidesOdd                      ctermbg=238
hi IndentGuidesEven                     ctermbg=236
