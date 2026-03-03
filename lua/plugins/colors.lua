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

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end
}
