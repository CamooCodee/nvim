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

lsp.configure('gopls', {
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  settings = {
    gopls = {
      gofumpt = true,
      usePlaceholders = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        nilness = true,
        shadow = true,
        fieldalignment = true
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true
      },
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        regenerate_cgo = true
      }
    }
  }
})

lsp.skip_server_setup({'pyright', 'pyflakes'})

lsp.setup()
