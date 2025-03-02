require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "c_sharp", "python", "hcl", "terraform", "javascript", "typescript"},
	highlight = { enable = true },
	indent = { enable = true },
}
