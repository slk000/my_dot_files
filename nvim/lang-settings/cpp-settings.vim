" function! Test()
"     echo "c"
" endfunction
function! Compile() 
    w
    AsyncRun g++ -w -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" 
endfunction
function! Run()
    AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" 
endfunction
nnoremap <silent> <F3> :call Compile() <cr>
":call Run() <cr>
nnoremap <silent> <F4> :call Run()<cr> 
