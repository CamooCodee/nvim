local ignore = {
    ".git/",
    "node_modules/",
    ".venv/",
    ".poetry-venv/",
    "__pycache__/",
    ".DS_Store",
    "uv.lock",
    "tmp/",
}

local function rg_find_command()
    local cmd = { "rg", "--files", "--hidden", "--no-ignore" }
    for _, pat in ipairs(ignore) do
        table.insert(cmd, "--glob")
        table.insert(cmd, "!" .. pat)
    end
    return cmd
end

local function to_lua_patterns(list)
    local out = {}
    for _, pat in ipairs(list) do
        table.insert(out, (pat:gsub("([%.%-])", "%%%1")))
    end
    return out
end

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
                    find_command = rg_find_command(),
                })
            end,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
        },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").grep_string()
            end,
        },
        -- {
        --     "<leader>gr",
        --     function()
        --         require("telescope.builtin").lsp_references()
        --     end,
        -- },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = to_lua_patterns(ignore),
            },
        })
    end,
}
