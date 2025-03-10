nnoremap q <c-v>
set showcmd
set clipboard=unnamedplus
set backspace=indent,eol,start
set hidden
syntax on
"set ts=4 softtabstop=0 expandtab sw=4 smarttab
set ts=2 softtabstop=0 expandtab sw=2 smarttab
highlight StatusLineNC cterm=bold ctermfg=white ctermbg=darkgray
set wrap
set breakindent
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
highlight ColorColumn ctermbg=lightgray

" switch tabs by using Tab keys
"map <Tab> interfers with CTRL-I: jump forward
map <Tab> gt
map <S-Tab> gT

" don't show banner in vim file explorer
let g:netrw_banner = 0

" set column guideline
set cc=100 

" set color of column guideline    
highlight ColorColumn ctermbg=254 

set history=1000

" ignore case in search by default
set ignorecase

" make search results highlighted
set hlsearch 
highlight Search ctermbg=119

" highlight while searching
set incsearch 

" Clear highlighting on escape in normal mode
" nnoremap <esc> :noh<return><esc> 
" Clear highlighting on escape in normal mode
" nnoremap <esc>^[ <esc>^[ 

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest 
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.tar,*.gz

" disable swapfile creation
set noswapfile 

" maximum of tabs
set tabpagemax=100

" set gnome terminal title to currently edited file
set title
set titlestring=vim:\ %t

" set max text width
set textwidth=100
set formatoptions-=t

" change regex dialect
" DEACTIVATED, because it creates a delay with %s (and also visual noise)
" use perl-y regex (probably not needed, because it works without it too)
" nnoremap / /\v
" cnoremap %s/ %s/\v

" show gutter, mainly for ALE functionality
set signcolumn=yes

" change color of signcolumn (gutter)
highlight SignColumn ctermbg=lightgrey

" disable '~' symbols
set fillchars=eob:\ 

" set highlight color
hi Visual cterm=none ctermbg=153 ctermfg=black 

" Spell-check Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
hi SpellBad ctermbg=lightred "gentle yellow: 227

" tabnew shortcut
nnoremap t :tabnew .<CR>

" delete word with ctrl-backspace
inoremap <C-H> <C-W>
cnoremap <C-H> <C-W>

" Remap ctrl+w+cursor to ctrl+cursor in normal mode
nnoremap <S-Right> <C-w><Right>
nnoremap <S-Left> <C-w><Left>
nnoremap <S-Up> <C-w><Up>
nnoremap <S-Down> <C-w><Down>
vnoremap <S-Right> <C-w><Right>
vnoremap <S-Left> <C-w><Left>
vnoremap <S-Up> <C-w><Up>
vnoremap <S-Down> <C-w><Down>
inoremap <S-Right> <Esc><C-w><Right>i
inoremap <S-Left> <Esc><C-w><Left>i
inoremap <S-Up> <Esc><C-w><Up>i
inoremap <S-Down> <Esc><C-w><Down>i

" autosave when leaving insert mode or switching buffers
autocmd InsertLeave,TextChanged * silent! wall

" map ctrl+down and ctrl-up to Ctrl+e and Ctrl+y to scroll down or up
nnoremap <C-Down> <C-e>h
inoremap <C-Down> <C-o><C-e>
nnoremap <C-Up> <C-y>
inoremap <C-Up> <C-o><C-y>

" highlight function
" Map s in Visual mode to append the highlighted text to the current search
xnoremap s :<C-u>call AppendToSearch()<CR>
" Map S to delete the current search pattern
nnoremap S :let @/ = ''<CR>
" Function to append the highlighted text to the current search
function! AppendToSearch()
  " Get the visually selected text
  let l:selected_text = getline("'<")[col("'<")-1 : col("'>")-1]
  " Escape the selected text for search
  let l:escaped_text = escape(l:selected_text, '\\/')
  " Check if there's an existing search pattern
  if @/ !=# ''
    " Append the new text to the current search pattern with \| for 'OR'
    let @/ = @/ . '\|' . l:escaped_text
  else
    " Start a new search pattern
    let @/ = '\V' . l:escaped_text
  endif
  " Perform the search
  normal! n
endfunction


" ----------------------- plugins

call plug#begin()

Plug 'vim-airline/vim-airline'

" don't show file type and environment stuff (git)
let g:airline_section_x=''
let g:airline_section_b=''

" show full path
"let g:airline_section_c='%F'

Plug 'dense-analysis/ale'

let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   'json': ['jq'],
\   'xml': ['xmllint'],
\   'python': ['black'],
\}
let g:ale_python_black_options='--line-length=100'
let g:ale_completion_enabled = 1

" disable virtual text insertion
let g:ale_virtualtext_cursor = 0
let g:ale_virtualtext_prefix = ''
let g:ale_virtualtext = 0

Plug 'preservim/nerdcommenter'

filetype plugin on
"let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
nnoremap ee :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap e :call nerdcommenter#Comment(0,"toggle")<CR>

Plug 'ervandew/supertab'

let g:SuperTabDefaultCompletionType = "<c-n>"

Plug 'preservim/tagbar'
nnoremap l :TagbarToggle<CR>
let g:tagbar_width = 60
let g:tagbar_left = 1
let g:tagbar_sort = 0

call plug#end()

" add markdown handling after plugin section as some of it interferes with it otherwise
augroup markdown_syntax_off
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal syntax=OFF nospell
augroup END

