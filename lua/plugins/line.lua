return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local colors      = {
            bg = '#212337',
            fg = '#b4c2f0',
            accent = '#7e6df2',
        }

        local my_theme    = {
            normal = {
                a = { fg = colors.bg, bg = colors.accent, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
        }
        -- reuse the same table for every mode
        my_theme.insert   = my_theme.normal
        my_theme.visual   = my_theme.normal
        my_theme.replace  = my_theme.normal
        my_theme.command  = my_theme.normal
        my_theme.inactive = my_theme.normal

        require('lualine').setup({
            sections = {
                lualine_c = { 'filename', 'diagnostics' },
            },
            options = { theme = my_theme },
        })
    end
}
