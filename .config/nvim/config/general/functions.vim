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

" Jump to the last known position when reopening a file.
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Diagnostics
let g:diagnostic_virtual_text_prefix = ''
let g:diagnostic_enable_virtual_text = 1

" Signify
let g:signify_sign_add = '▎'
let g:signify_sign_delete = '▎'
let g:signify_sign_delete_first_line = '▎'
let g:signify_sign_change = '▎'

" Completion
let g:completion_confirm_key = ""
let g:completion_trigger_keyword_length = 2
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_smart_case = 1
let g:completion_trigger_on_delete = 1

autocmd BufEnter *.hs set tabstop=2 shiftwidth=2
