map <Tab> gt
map <S-Tab> gT
"don't show banner in vim file explorer
let g:netrw_banner = 0
"set column guideline
set cc=100 
"set color of column guideline    
highlight ColorColumn ctermbg=254 
set history=1000
"set max text width
set textwidth=100
set signcolumn=yes
" change color of signcolumn (gutter)
highlight SignColumn ctermbg=lightgrey
" disable '~' symbols
set fillchars=eob:\ 
" tabnew shortcut
ca tn tabnew .


call plug#begin()

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

Plug 'vim-airline/vim-airline'
" don't show file type and environment stuff (git)
let g:airline_section_x=''
let g:airline_section_b=''
" show full path
" let g:airline_section_c='%F'

Plug 'dense-analysis/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   'json': ['jq'],
\   'xml': ['xmllint'],
\   'python': ['black'],
\}
let g:ale_python_black_options='--line-length=100'
let g:ale_completion_enabled = 1

Plug 'preservim/nerdcommenter'
filetype plugin on
"let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
nnoremap ee :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap e :call nerdcommenter#Comment(0,"toggle")<CR>

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"

Plug 'MattesGroeger/vim-bookmarks'


call plug#end()

