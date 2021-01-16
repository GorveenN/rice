" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Highlight currently open buffer in NERDTree
function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

" if nerdtree is only window, kill nerdtree so buffer can die
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | :bdelete | endif

let nerdtreequitonopen = 1
let NERDTreeShowHidden = 1
let nerdchristmastree = 1
let g:NERDTreeMinimalUI = 1
let g:nerdtreewinsize = 25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeAutoCenter = 1
" let g:NERDTreeIndicatorMapCustom = {
"         \ "modified"  : "✹",
"         \ "staged"    : "➕",
"         \ "untracked" : "⭐",
"         \ "renamed"   : "",
"         \ "unmerged"  : "═",
"         \ "deleted"   : "✖",
"         \ "dirty"     : "✗",
"         \ "clean"     : "✔︎",
"         \ 'ignored'   : '☒',
"         \ "unknown"   : "?"
"         \ }
