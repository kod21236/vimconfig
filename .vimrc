source ~/.vim/bundle.vim

syntax on
filetype on
filetype plugin indent on

set splitbelow
set splitright


" Python-mode Start***************************************
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator, modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" Python-mode End*****************************************

" NerdTree Start******************************************
" NerdTree End********************************************

" vim-airline Start***************************************
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
set laststatus=2
" vim-airline End*****************************************

" vim-airline Start***************************************
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" vim-airline End*****************************************

" gedi-vim Start******************************************
let g:jedi#use_splits_not_buffers = "right"

" gedi-vim End********************************************


" Key mapping

map <F2> :NERDTreeToggle<CR>
" let g:jedi#goto_definitions_command = "<leader>d"

