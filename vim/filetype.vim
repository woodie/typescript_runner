if exists("did_load_filetypes_userafter")
  finish
endif
let did_load_filetypes_userafter = 1
augroup filetypedetect
  au! BufNewFile,BufRead *.ts setf typescript
augroup END
