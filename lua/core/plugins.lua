local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use({'rose-pine/neovim', as = "rose-pine",
    config = function()
        vim.cmd('colorscheme rose-pine')
    end
})
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-treesitter/playground'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'buffer' },
                }),
                completion = {
                    autocomplete = { 'InsertEnter', 'TextChanged' }
                }
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
   }
    use {
        "folke/lazydev.nvim",
    }
    use {
        'neovim/nvim-lspconfig',
        after = 'nvim-cmp',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local ok, lazydev = pcall(require, "lazydev")
            if ok then
                lazydev.setup({
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                })
            else
                print("Failed to precall lazydev")
            end

            require('lspconfig').lua_ls.setup {
                capabilities = capabilities
            }

            require('lspconfig').pyright.setup {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "basic"
                        }
                    }
                },
                before_init = function(_, config)
                    -- First check for .venv in project root
                    local venv_path = vim.fn.getcwd() .. "/.venv"
                    local is_windows = vim.fn.has("win32") == 1
                    local python_path

                    if is_windows then
                        python_path = venv_path .. "/Scripts/python.exe"
                    else
                        python_path = venv_path .. "/bin/python"
                    end

                    -- Check if the python executable exists
                    if vim.fn.executable(python_path) == 1 then
                        config.settings.python.pythonPath = python_path
                    else
                        local poetry_env = vim.fn.trim(vim.fn.system("cd " .. vim.fn.getcwd() .. " && poetry env info -p 2>/dev/null"))
                        if vim.v.shell_error == 0 then
                            if is_windows then
                                python_path = poetry_env .. "/Scripts/python.exe"
                            else
                                python_path = poetry_env .. "/bin/python"
                            end

                            if vim.fn.executable(python_path) == 1 then
                                config.settings.python.pythonPath = python_path
                            end
                        end
                    end

                end,
                on_attach = function(client, bufnr)
                    print("Pyright attached!")
                end
            }

        end,
    }
    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    }
    use {
        'Hoffs/omnisharp-extended-lsp.nvim'
    }
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
