local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'pylsp', 'terraformls'
})

local homebrew_prefix = vim.fn.getenv("HOMEBREW_PREFIX") or "/opt/homebrew"

lsp.configure("terraformls", {
  init_options = {
    terraform = {
      path = homebrew_prefix .. "/bin/terraform",
    }
  },
})

lsp.skip_server_setup({'pyright', 'pyflakes'})

lsp.setup()
