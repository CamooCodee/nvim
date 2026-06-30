return {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
        require("scrollbar").setup({
            handle = {
                hide_if_all_visible = true,
            },
            handlers = {
                cursor = false,
                diagnostic = true,
            },
        })
    end,
}
