require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "rust", "c_sharp", "python", "hcl", "terraform", "javascript", "typescript", "go", "gomod", "gowork", "gotmpl"},
	highlight = { enable = true },
	indent = { enable = true },
}
