" Keep viminfo
set viminfo=%,'100,\"100,:100,n~/.vim/viminfo

" Vim jumps to the last position when reading a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

