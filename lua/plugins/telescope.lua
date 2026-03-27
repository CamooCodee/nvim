return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>fd",
            function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    file_ignore_patterns = { ".git/", "tmp/", "node_modules", ".venv" }
                })
            end
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end
        },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").grep_string()
            end
        }
        --     {
        --         "<leader>gr",
        --         function()
        --             require("telescope.builtin").lsp_references()
        --         end
        --     }
    },
    config = function()
        require("telescope").setup()
    end
}
