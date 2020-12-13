" Basic Key Mappings

imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l
" g Leader key
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
" tnoremap <Esc> <C-\><C-n>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

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

" Mapping to open NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Reformat document
nnoremap <F4> :Autoformat<CR>

" Vista
nnoremap <F8> :Vista!!<CR>
nnoremap <silent><leader>vf :Vista finder coc<CR>

nnoremap <C-m> :Make<CR>

