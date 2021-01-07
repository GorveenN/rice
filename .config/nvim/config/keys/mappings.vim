" Basic Key Mappings

let mapleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv


" Cycle buffers with Tab and Shift+Tab
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Un-highlight search results
nnoremap <esc><esc> :silent! nohls<cr>

" Search for files
nnoremap <leader>f :Files<CR>

" Search for word in all files
nnoremap <leader>rg :Rg<CR>

" Show current buffer in nerdtree
nnoremap <leader>m :call MyNerdToggle()<CR>

" Show buffers
nnoremap <leader>b :Buffers<CR>

" Git wrapper
nnoremap <leader>gs :G<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gc :GCheckout<CR>
vmap <silent> u <esc>:Gdiff<cr>gv:diffget<cr><c-w><c-w>ZZ

" Mapping to open NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Reformat document
nnoremap <F4> :Autoformat<CR>

" Vista
nnoremap <F8> :Vista!!<CR>
nnoremap <silent><leader>vf :Vista finder coc<CR>

" Make
nnoremap <C-m> :Make<CR>

" Tmux/Vim navigation/resizing
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

let g:tmux_resizer_no_mappings = 1
let g:tmux_resizer_resize_count = 3
let g:tmux_resizer_vertical_resize_count = 3
nnoremap <silent> <M-h> :TmuxResizeLeft<CR>
nnoremap <silent> <M-j> :TmuxResizeDown<CR>
nnoremap <silent> <M-k> :TmuxResizeUp<CR>
nnoremap <silent> <M-l> :TmuxResizeRight<CR>

" Alternatively use this snippet
" Better window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" imap <C-h> <C-w>h
" imap <C-j> <C-w>j
" imap <C-k> <C-w>k
" imap <C-l> <C-w>l

" Use alt + hjkl to resize windows
" nnoremap <silent> <M-j>    :resize -2<CR>
" nnoremap <silent> <M-k>    :resize +2<CR>
" nnoremap <silent> <M-h>    :vertical resize -2<CR>
" nnoremap <silent> <M-l>    :vertical resize +2<CR>
