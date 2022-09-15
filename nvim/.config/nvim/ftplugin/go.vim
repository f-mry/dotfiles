" augroup auto_format 
"   autocmd!
"   autocmd BufWritePre *.go lua vim.lsp.buf.format({async = false}) 
" augroup END
