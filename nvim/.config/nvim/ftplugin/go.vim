augroup auto_format 
  autocmd!
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting_seq_sync(nil, 500) 
augroup END
