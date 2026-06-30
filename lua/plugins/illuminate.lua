return {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            providers = { "lsp" },
            delay = 100,
            under_cursor = true,
            min_count_to_highlight = 2,
            large_file_cutoff = 2000,
            large_file_overrides = { providers = { "lsp", "treesitter" } },
        })

        vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3b3d57" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3b3d57" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#4a3a5c" })
    end,
}
