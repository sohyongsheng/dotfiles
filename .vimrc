syntax on
let mapleader=","
set background=dark
set tw=72
set formatoptions=croqn

" Number of spaces each tab visually takes. 
set tabstop=4 
" Number of spaces each tab takes in edit mode.
set softtabstop=4 
" Tabs become spaces.
set expandtab 
" Number of spaces auto-indent makes
set shiftwidth=4 

" Show line numbers.
set number 
" Load file-type specific indent and files.
filetype indent plugin on 
" Copies indentation from previous line.
set autoindent 
" Highlight matching brackets.
set showmatch 
" Command line completion, try typing doing :color <tab> in command line to see all possible colors.
set wildmenu 
" Enable mouse for all (abbreviated as 'a') modes.
" set mouse=a 
" Set status bar to show if file is saved or not.
set laststatus=2 
" Syntax for changing status line colors:
" highlight statusline ctermbg={color-nr} ctermfg={color-nr}
" Highlight search.
set hlsearch 
" Syntax for changing autocomplete colors:
" highlight Pmenu ctermbg={color-nr} ctermfg={color-nr}
" highlight PmenuSel ctermbg={color-nr} ctermfg={color-nr}
highlight Pmenu ctermbg=LightGray ctermfg=Black
highlight PmenuSel ctermbg=DarkGray ctermfg=LightGray
" Incrementally highlight as we search.
set incsearch 
" Set relative line numbers.
set relativenumber 

" Git commits
autocmd FileType gitcommit set tw=72

" Yanking and pasting
" Allows you to yank in one window and paste into another window. 
set clipboard=unnamedplus

" Add following characters for text objects.
for s:char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '$' ]
    execute 'xnoremap i' . s:char . ' :<C-u>normal! T' . s:char . 'vt' . s:char . '<CR>'
    execute 'onoremap i' . s:char . ' :normal vi' . s:char . '<CR>'
    execute 'xnoremap a' . s:char . ' :<C-u>normal! F' . s:char . 'vf' . s:char . '<CR>'
    execute 'onoremap a' . s:char . ' :normal va' . s:char . '<CR>'
endfor

" Use jk to Escape so that right hand doesn't need to leave home row.
inoremap jk <Esc>
" Search down into sub-directories and provide tab-completion for all file-related tasks.
" files in the current working directory.
" set path+=** 
" List all available tag matches.
nnoremap <C-]> g<C-]> 
" Run ctags to generate tags file.
command! Maketags !ctags --excmd=pattern --recurse --exclude="env"

" Disable banner.
let g:netrw_banner = 0
" Tree style.
let g:netrw_liststyle = 3

" Snippets.
nnoremap <leader>b obreakpoint()<Esc>
nnoremap <leader>t o#TODO<Esc>
nnoremap <leader><Space> :nohlsearch<CR>

" File-type specific commands.
" Use double slashes '//' for commenting in C++.
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType yaml,markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType dirvish nnoremap <silent><buffer> l :<C-U>.call dirvish#open("edit", 0)<CR>
autocmd FileType dirvish nnoremap <silent><buffer> h :<C-U>exe "Dirvish %:h".repeat(":h",v:count1)<CR>

" Copy current file name/path.
" relative path (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<CR>
" absolute path (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<CR>
" filename (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
