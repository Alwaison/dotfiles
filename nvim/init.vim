" Basic configuration
set number		" show line numbers
set relativenumber	" show relative numbers in line
set cursorline		" highlight current cursor line
set cc=80		" set an 80 column border
set encoding=UTF-8	" Set UTF-8 encoding for vim-devicons

" One Half theme config
syntax on
set t_Co=256
"colorscheme onehalflight
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" ack autoclose
let g:ack_autoclose = 1

" Plugins management
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
call plug#end()

" NERDTree config
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Open NERDTree in the current file
autocmd BufEnter * lcd %:p:h

lua require('basic')
