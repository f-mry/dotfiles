local ok, mason = pcall(require, "mason-lspconfig")
if not ok then
    return
end

mason.setup()

local lspconfig_installed, lspconfig = pcall(require, "lspconfig")
if not lspconfig_installed then
    return
end
local coq_installed, coq = pcall(require, "coq")

local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({float = false})<CR>zz', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({float = false})<CR>zz', opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format{async = true}<CR>", opts)
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    buf_set_keymap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    -- if client.server_capabilities.document_formatting then
    -- elseif client.server_capabilities.document_range_formatting then
    -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if coq_installed then
    capabilities = coq.lsp_ensure_capabilities(capabilities)
end

local servers = {
    intelephense = true,
    tsserver = true,
    svelte = true,
    eslint = true,
    tailwindcss = { autostart = false },
    texlab = true,
    emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        autostart = false,
    },
    marksman = { autostart = false },
    bashls = true,
    pylsp = true,
    vimls = true,
    dockerls = true,
    yamlls = true,
    rust_analyzer = true,

    golangci_lint_ls = {
        autostart = true,
        root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
        init_options = {
            command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1", "-c",
                "/home/farhanmry/.config/golangci-lint/lsp-config.yaml" };
        }
    },
    gopls = {
        root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
        -- root_dir = function(fname)
        --     local Path = require "plenary.path"

        --     local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
        --     local absolute_fname = Path:new(fname):absolute()

        --     if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
        --         return absolute_cwd
        --     end

        --     return lspconfig_util.root_pattern("go.mod", ".git")(fname)
        -- end,

        settings = {
            gopls = {
                codelenses = {
                    test = true,
                    tidy = true,
                },
                analyses = { unusedparams = true },
                staticcheck = true,
                usePlaceholders = true,
                gofumpt = true,
            },
        },
        flags = {
            debounce_text_changes = 200,
        },
    },

    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000
                },
                telemetry = { enable = false }
            }
        }
    }

}

local setup_server = function(server, config)
    if not config then
        return
    end

    if type(config) ~= "table" then
        config = {}
    end

    config = vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = nil,
        },
    }, config)

    lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
    setup_server(server, config)
end


-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
    vim.fn.sign_define("DiagnosticSign" .. name,
        { text = icon, numhl = "LspDiagnosticsDefault" .. name, texthl = "DiagnosticSign" .. name })
end

lspSymbol("Error", "")
lspSymbol("Warn", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            prefix = "",
            spacing = 0
        },
        signs = true,
        underline = true,
        -- set this to true if you want diagnostics to show in insert mode
        update_in_insert = false
    }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single"
}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single"
}
)


vim.diagnostic.config({
    float = {
        border = "single"
    }
})



-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end
