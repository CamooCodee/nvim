local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>fd", function ()
    builtin.find_files({
        hidden = true,
        file_ignore_patterns = { ".git/" }
    });
end)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>ff", function () 
    builtin.grep_string({search = vim.fn.input("Grep > ") });
end)
