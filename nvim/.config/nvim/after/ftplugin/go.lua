local ok, go = pcall(require, "go")
if ok then
    go.setup({
        disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
        comment_placeholder = '',
        gopls_cmd = nil
    })
end
