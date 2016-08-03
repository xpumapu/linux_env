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
set history=50          " keep 50 lines of command line history
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch

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


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif



