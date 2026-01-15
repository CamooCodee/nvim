require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "rust", "c_sharp", "python", "hcl", "terraform", "javascript", "typescript", "go", "gomod", "gowork", "gotmpl", "yaml", "svelte", "css", "html"},
	highlight = { enable = true },
	indent = { enable = true },
}
require'treesitter-context'.setup{
  enable = true,
  multiwindow = false,
  max_lines = 4,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = 'outer',
  mode = 'cursor',
}
