" Plugins
let g:coc_global_extensions =  [
    \ 'coc-snippets',
    \ 'coc-spell-checker',
    \ 'coc-snippets',
    \ 'coc-python',
    \ 'coc-cspell-dicts',
    \ 'coc-rust-analyzer',
    \ 'coc-highlight',
    \ 'coc-json',
    \ 'coc-cmake',
    \ 'coc-clangd',
    \ ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Autocompletion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<itab>'

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
" nmap <leader>qa  :CocAction<CR>
nmap <leader>qa  <Plug>(coc-codeaction)
xmap <leader>qa  <Plug>(coc-codeaction-selected)
nmap <leader>cl <Plug>(coc-codelens-action)
nmap <F3> <Plug>(coc-format)

autocmd CursorHold * silent call CocActionAsync('highlight')
