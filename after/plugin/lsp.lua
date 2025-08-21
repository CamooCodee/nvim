local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'pylsp', 'terraformls', "gopls", "ts_ls", "eslint", "tailwindcss"
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

local ts_settings = {
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'json', 'jsonc' },
  settings = {
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayVariableTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayEnumMemberValueHints = true
      }
    },
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayVariableTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayEnumMemberValueHints = true
      }
    }
  }
}

lsp.configure('tailwindcss', {
  filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)`",
          "tw\\.[^`]+`([^`]*)`",
          "tw\\(([^)]*)\\)",
          "clsx\\(([^)]*)\\)",
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
          { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" }
        }
      }
    }
  }
})

lsp.configure('tsserver', ts_settings)
lsp.configure('ts_ls', ts_settings)

lsp.skip_server_setup({'pyright', 'pyflakes'})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
