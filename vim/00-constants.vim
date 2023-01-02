let g:go_version_warning = 0
set nospell

" use system clipboard
set clipboard^=unnamedplus

" Backspace should work across lines
set bs=2

" set virtual envs
let g:python_host_prog = expand("~/virtual_envs/neovim2/bin/python")
let g:python3_host_prog = expand("~/virtual_envs/neovim3/bin/python")

" not actually constants - move these later.
" Default to static completion for SQL
let g:omni_sql_no_default_maps = 1
let g:omni_sql_default_compl_type = 'syntax'
