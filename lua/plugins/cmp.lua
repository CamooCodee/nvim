return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim"
    },
    config = function()
        local cmp = require('cmp')

        vim.o.completeopt = 'menu,menuone,fuzzy'

        local lspkind = require('lspkind')

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    max_height = 8,
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-e>'] = cmp.mapping.abort(),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
            },
            formatting = {
                fields = { 'abbr', 'icon', 'menu' },
                format = lspkind.cmp_format({
                    maxwidth = {
                        menu = 50,
                        abbr = 50,
                    },
                    ellipsis_char = '...',
                })
            }
        })
    end
}
