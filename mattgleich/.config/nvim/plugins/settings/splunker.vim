set nospell
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.snippets,*.json,*.md,*.tex*.py,*.Dockerfile,*.go,*.js,*.ts,*.tsx,*.rs call spelunker#check()
augroup END
