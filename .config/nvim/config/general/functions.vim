" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us,pl
  autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us,pl
  autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

" Print to pdf
function! Printpdf()
    hardcopy > %.ps | !ps2pdf %.ps && rm %.ps
endfunction

" Save file as root
command! Root :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Spell check with fzf
function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
