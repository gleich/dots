" fatih/vim-go
let g:go_def_mapping_enabled = 0 " Have coc manage go to definition

" justinmk/vim-sneak
let g:sneak#label = 1 " Display switch character

" lervag/vimtex
let g:tex_flavor = 'pdflatex' " Setting the formula type

" kamykn/spelunker.vim
set nospell " Turning off vim's native spell check
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.py,*.Dockerfile,*.go,*.js,*.ts,*.tsx call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.json,*.md,*.tex call spelunker#check_displayed_words()
augroup END

