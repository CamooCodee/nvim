require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
                shorting_target = 0
            }
        }
    }
}
