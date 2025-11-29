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
        typescript = { enable = true }
      }
    }
  }
})

vim.lsp.enable('svelteserver')
