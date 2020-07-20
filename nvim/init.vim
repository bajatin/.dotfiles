call plug#begin('~/.config/nvim/plugged')

"ale linter
Plug 'w0rp/ale'

" airline (powerline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"colorscheme
Plug 'morhetz/gruvbox'

call plug#end()

" ================ Suggestions ======================
 
" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Srolling =========================

" Start scrolling when we're 8 lines away from margins
set scrolloff=8

" ================ Keyboard bindings ================

" Mapping U to Redo.
noremap U <c-r>
noremap <c-r> <NOP>


" indent via Tannoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >>_
vnoremap <S-Tab> <<_


" ================ Visualization ====================
 
syntax on
set background=dark
colorscheme gruvbox

" enable 256bit colors - also: override gnome-terminal's settings
set t_Co=256


" ================ Indentation ======================

set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" ================ Number column ====================

set number relativenumber

" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch


" ================ Abbreviations ====================

iab itn int
iab adn and
cmap Q q
cmap W w
cmap 1 !

"================ Plugins ==========================

" ################ Ale ##############################
 
" autocompletion
let g:ale_completion_enabled = 1

let g:ale_cpp_clang_executable = 'clang++-5.0'

" linter
 let g:ale_linters = {
            \   'cpp': ['clang']
            \}
let g:ale_cpp_clang_options = '-std=c++1z -O0 -Wextra -Wall -Wpedantic -I /usr/include/eigen3'

