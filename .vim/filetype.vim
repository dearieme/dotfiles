" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.tt2   setfiletype tt2html
  au! BufRead,BufNewFile *.tt    setfiletype tt2html
augroup END

