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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" RUN CURRENT FILE """"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute current file
nnoremap <F5> :call ExecuteFile()<CR>

" Will attempt to execute the current file based on the `&filetype`
" You need to manually map the filetypes you use most commonly to the
" correct shell command.
function! ExecuteFile()
  let filetype_to_command = {
  \   'javascript': 'node',
  \   'coffee': 'coffee',
  \   'python': 'python',
  \   'html': 'open',
  \   'sh': 'sh'
  \ }
  let cmd = get(filetype_to_command, &filetype, &filetype)
  call RunShellCommand(cmd." %s")
endfunction

" Enter any shell command and have the output appear in a new buffer
" For example, to word count the current file:
"
"   :Shell wc %s
"
" Thanks to: http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
" command! -complete=shellcmd -nargs=+ Shell call RunShellCommand(<q-args>)
function! RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
 
