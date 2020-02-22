" noremap <silent><expr> <c-space> coc#refresh()
"
" call coc#config('coc.preferences', {
			" \ "autoTrigger": "always",
			" \ "maxCompleteItemCount": 10,
			" \ "codeLens.enable": 1,
			" \ "diagnostic.virtualText": 1,
			" \})
"
" let s:coc_extensions = [
			" \ 'coc-dictionary',
			" \ 'coc-json',
			" \ 'coc-ultisnips',
			" \ 'coc-tag',
			" \]
"
" for extension in s:coc_extensions
	" call coc#add_extension(extension)
" endfor
"
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction
"
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

