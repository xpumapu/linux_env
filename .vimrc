hi User1 ctermbg=6 ctermfg=7   guibg=green guifg=black
hi User2 ctermbg=3 ctermfg=0  guibg=red   guifg=blue
hi User3 ctermbg=1 ctermfg=1 guibg=blue  guifg=green

"hi StatusLine cterm=none gui=none
hi StatusLineNC ctermfg=8 ctermbg=6 cterm=none gui=none

nnoremap <F5> :buffers<CR>:buffer<Space>
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F6> :b <C-Z>


set cursorline

set laststatus =2 " Enables the status line at the bottom of Vim
set statusline =
set statusline +=%(\ buf[%n]\ file[%f]\ %)
"set statusline +=branch%2*\ %{GitBranchInfoTokens()[0]}\ %*
set statusline +=%*
"set statusline +=%#todo#
set statusline +=%=
set statusline +=%1*
set statusline +=%(\ [%l,%v]\ /%L\ %)
set statusline +=%*

set ruler
set rulerformat=%15(%c%V\ %p%%%)
":set statusline=%{GitBranchInfoString()}
"let g:git_branch_status_head_current=1


"set list
set listchars=tab:>-,trail:⋅,nbsp:⋅

syntax on

if has('cscope')
  set cscopetag
  set csto=0
  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
  endif

  cscope add .
  map <Tab>s :cscope find s <cword><cr>
  map <Tab>t :cscope find t <cword><cr>
  map <Tab>g :cscope find g <cword><cr>
  map <Tab>c :cscope find c <cword><cr>
endif

"set tagstack
"set tags=./tags;

nnoremap <F4> : sp<cr>

:botright cwindow

