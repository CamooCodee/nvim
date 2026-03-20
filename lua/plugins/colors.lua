-- return {
--     "navarasu/onedark.nvim",
--     name = "onedark",
--     priority = 1000,
--     config = function()
--         require("onedark").setup({
--             style = "darker",
--             transparent = true,
--         })
--
--         vim.cmd.colorscheme("onedark")
--     end
-- }
--

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--         transparent = true,
--         styles = {
--             sidebars = "transparent",
--             floats = "transparent",
--         },
--     },
--     config = function(_, opts)
--         require("tokyonight").setup(opts)
--         vim.cmd.colorscheme("tokyonight")
--     end
-- }

return {
    "shaunsingh/moonlight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.g.moonlight_italic_comments = true
        vim.g.moonlight_disable_background = true
    end,
    config = function()
        vim.cmd.colorscheme("moonlight")
    end
}
