-- autocomplete with nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
  capabilities = capabilities
})

vim.lsp.enable('luals')

vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
  capabilities = capabilities
})

vim.lsp.enable('rust_analyzer')

vim.lsp.config('tsserver', {
  cmd = { 'typescript-language-server', '--stdio' }, -- Command to start the server
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' }, -- File extensions it supports
  root_markers = { 'package.json', 'tsconfig.json', '.git' }, -- Files used to identify the project root
  capabilities = capabilities
})

vim.lsp.enable('tsserver')

vim.lsp.config('svelteserver', {
    cmd = { 'svelteserver', '--stdio' }, -- Command to start the server
    filetypes = { 'svelte' },           -- Only attaches to .svelte files
    root_markers = { 'package.json', 'svelte.config.js', '.git' },
    capabilities = capabilities,
    settings = {
        svelte = {
            plugin = {
                typescript = { enable = true },
                css = { enable = true },
                html = { enable = true }
            },
            language_server = {
                runtime = '/opt/homebrew/bin/node'
            }
        },
        typescript = {
            enable = true
        },
        javascript = {
            enable = true
        }
    }
})

vim.lsp.enable('svelteserver')

vim.lsp.config('tailwindcss', {
    cmd = { 'tailwindcss-language-server', '--stdio' },

    filetypes = {
        'css',
        'html',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'svelte',
        'vue',
        'astro'
    },

    root_markers = {
        'tailwind.config.js',
        'tailwind.config.cjs',
        'tailwind.config.ts',
        'postcss.config.js',
        'package.json',
        '.git'
    },

    capabilities = capabilities,

    settings = {
        tailwindCSS = {
            includeLanguages = {
                svelte = 'html',
                vue = 'html',
            },
            experimental = {
                classRegex = {
                    'clsx\\(([^)]*)\\)',
                    'cva\\(([^)]*)\\)',
                },
            },
        }
    }
})

vim.lsp.enable('tailwindcss')

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  capabilities = capabilities,
})

vim.lsp.enable('gopls')

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_markers = { 'main.c', '.git' },
  capabilities = capabilities,
})

vim.lsp.enable('clangd')

vim.lsp.config('basedpyright', {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { '.venv' },
    capabilities = capabilities,
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
                typeCheckingMode = 'standard',

                diagnosticSeverityOverrides = {
                },

                inlayHints = {
                    variableTypes = true,
                    callArgumentNames = true,
                    functionReturnTypes = true,
                    genericTypes = true,
                },
                venvPath = ".",
            },
        },
    },
})

vim.lsp.enable('basedpyright')

vim.lsp.config('terraformls', {
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'terraform', 'terraform-vars', 'hcl' },
  root_markers = { '.terraform', '.git' },
  capabilities = capabilities
})

vim.lsp.enable('terraformls')
