local plugin = require('me.packer').register_plugin


plugin {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    cmd = 'DapContinue'
}

plugin {
    "leoluz/nvim-dap-go",
    requires = {"mfussenegger/nvim-dap"},
    cmd = 'DapContinue'
}
