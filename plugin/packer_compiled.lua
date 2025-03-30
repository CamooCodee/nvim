-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/lukas/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?.lua;/Users/lukas/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?/init.lua;/Users/lukas/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?.lua;/Users/lukas/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/lukas/.cache/nvim/packer_hererocks/2.1.1736781742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["lazydev.nvim"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/lazydev.nvim",
    url = "https://github.com/folke/lazydev.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-cmp"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1K\0\1\0ê\6\1\0\n\0(\0Z6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\0049\4\n\0045\6\f\0009\a\b\0009\a\v\a)\tüÿB\a\2\2=\a\r\0069\a\b\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\b\0009\a\15\aB\a\1\2=\a\16\0069\a\b\0009\a\17\aB\a\1\2=\a\18\0069\a\b\0009\a\19\a5\t\20\0B\a\2\2=\a\21\6B\4\2\2=\4\b\0039\4\22\0009\4\23\0044\6\3\0005\a\24\0>\a\1\0064\a\3\0005\b\25\0>\b\1\aB\4\3\2=\4\23\0035\4\27\0005\5\26\0=\5\28\4=\4\29\3B\1\2\0019\1\2\0009\1\30\0015\3\31\0005\4 \0009\5\b\0009\5\t\0059\5\30\5B\5\1\2=\5\b\0044\5\3\0005\6!\0>\6\1\5=\5\23\4B\1\3\0019\1\2\0009\1\30\1'\3\"\0005\4#\0009\5\b\0009\5\t\0059\5\30\5B\5\1\2=\5\b\0049\5\22\0009\5\23\0054\a\3\0005\b$\0>\b\1\a4\b\3\0005\t%\0>\t\1\bB\5\3\2=\5\23\0045\5&\0=\5'\4B\1\3\1K\0\1\0\rmatching\1\0\1'disallow_symbol_nonprefix_matching\1\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\3\fsources\0\rmatching\0\fmapping\0\6:\1\0\1\tname\vbuffer\1\0\2\fsources\0\fmapping\0\1\3\0\0\6/\6?\fcmdline\15completion\17autocomplete\1\0\1\17autocomplete\0\1\3\0\0\16InsertEnter\16TextChanged\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\5\n<C-b>\0\t<CR>\0\n<C-e>\0\14<C-Space>\0\n<C-f>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\4\fsources\0\fmapping\0\15completion\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nã\3\0\2\f\0\18\2M6\2\0\0009\2\1\0029\2\2\2B\2\1\2'\3\3\0&\2\3\0026\3\0\0009\3\1\0039\3\4\3'\5\5\0B\3\2\2\b\3\0\0X\3\2€+\3\1\0X\4\1€+\3\2\0+\4\0\0\15\0\3\0X\5\4€\18\5\2\0'\6\6\0&\4\6\5X\5\3€\18\5\2\0'\6\a\0&\4\6\0056\5\0\0009\5\1\0059\5\b\5\18\a\4\0B\5\2\2\t\5\0\0X\5\4€9\5\t\0019\5\n\5=\4\v\5X\5'€6\5\0\0009\5\1\0059\5\f\0056\a\0\0009\a\1\a9\a\r\a'\t\14\0006\n\0\0009\n\1\n9\n\2\nB\n\1\2'\v\15\0&\t\v\tB\a\2\0A\5\0\0026\6\0\0009\6\16\0069\6\17\6\t\6\1\0X\6\19€\15\0\3\0X\6\4€\18\6\5\0'\a\6\0&\4\a\6X\6\3€\18\6\5\0'\a\a\0&\4\a\0066\6\0\0009\6\1\0069\6\b\6\18\b\4\0B\6\2\2\t\6\0\0X\6\3€9\6\t\0019\6\n\6=\4\v\6K\0\1\0\16shell_error\6v' && poetry env info -p 2>/dev/null\bcd \vsystem\ttrim\15pythonPath\vpython\rsettings\15executable\16/bin/python\24/Scripts/python.exe\nwin32\bhas\v/.venv\vgetcwd\afn\bvim\2\0/\0\2\5\0\2\0\0046\2\0\0'\4\1\0B\2\2\1K\0\1\0\22Pyright attached!\nprintˆ\5\1\0\t\0\29\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0006\3\0\0'\4\4\0B\1\3\3\15\0\1\0X\3\n€9\3\5\0025\5\t\0004\6\3\0005\a\6\0005\b\a\0=\b\b\a>\a\1\6=\6\n\5B\3\2\1X\3\3€6\3\v\0'\5\f\0B\3\2\0016\3\0\0'\5\r\0B\3\2\0029\3\14\0039\3\5\0035\5\15\0=\0\16\5B\3\2\0016\3\0\0'\5\r\0B\3\2\0029\3\17\0039\3\5\0035\5\18\0=\0\16\0055\6\22\0005\a\20\0005\b\19\0=\b\21\a=\a\23\6=\6\24\0053\6\25\0=\6\26\0053\6\27\0=\6\28\5B\3\2\1K\0\1\0\14on_attach\0\16before_init\0\rsettings\vpython\1\0\1\vpython\0\ranalysis\1\0\1\ranalysis\0\1\0\4\27useLibraryCodeForTypes\2\21typeCheckingMode\nbasic\19diagnosticMode\14workspace\20autoSearchPaths\2\1\0\4\14on_attach\0\16before_init\0\rsettings\0\17capabilities\0\fpyright\17capabilities\1\0\1\17capabilities\0\vlua_ls\14lspconfig\30Failed to precall lazydev\nprint\flibrary\1\0\1\flibrary\0\nwords\1\2\0\0\fvim%.uv\1\0\2\nwords\0\tpath\23${3rd}/luv/library\nsetup\flazydev\npcall\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["omnisharp-extended-lsp.nvim"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/omnisharp-extended-lsp.nvim",
    url = "https://github.com/Hoffs/omnisharp-extended-lsp.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/lukas/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1K\0\1\0ê\6\1\0\n\0(\0Z6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\0049\4\n\0045\6\f\0009\a\b\0009\a\v\a)\tüÿB\a\2\2=\a\r\0069\a\b\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\b\0009\a\15\aB\a\1\2=\a\16\0069\a\b\0009\a\17\aB\a\1\2=\a\18\0069\a\b\0009\a\19\a5\t\20\0B\a\2\2=\a\21\6B\4\2\2=\4\b\0039\4\22\0009\4\23\0044\6\3\0005\a\24\0>\a\1\0064\a\3\0005\b\25\0>\b\1\aB\4\3\2=\4\23\0035\4\27\0005\5\26\0=\5\28\4=\4\29\3B\1\2\0019\1\2\0009\1\30\0015\3\31\0005\4 \0009\5\b\0009\5\t\0059\5\30\5B\5\1\2=\5\b\0044\5\3\0005\6!\0>\6\1\5=\5\23\4B\1\3\0019\1\2\0009\1\30\1'\3\"\0005\4#\0009\5\b\0009\5\t\0059\5\30\5B\5\1\2=\5\b\0049\5\22\0009\5\23\0054\a\3\0005\b$\0>\b\1\a4\b\3\0005\t%\0>\t\1\bB\5\3\2=\5\23\0045\5&\0=\5'\4B\1\3\1K\0\1\0\rmatching\1\0\1'disallow_symbol_nonprefix_matching\1\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\3\fsources\0\rmatching\0\fmapping\0\6:\1\0\1\tname\vbuffer\1\0\2\fsources\0\fmapping\0\1\3\0\0\6/\6?\fcmdline\15completion\17autocomplete\1\0\1\17autocomplete\0\1\3\0\0\16InsertEnter\16TextChanged\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\5\n<C-b>\0\t<CR>\0\n<C-e>\0\14<C-Space>\0\n<C-f>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\4\fsources\0\fmapping\0\15completion\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\nã\3\0\2\f\0\18\2M6\2\0\0009\2\1\0029\2\2\2B\2\1\2'\3\3\0&\2\3\0026\3\0\0009\3\1\0039\3\4\3'\5\5\0B\3\2\2\b\3\0\0X\3\2€+\3\1\0X\4\1€+\3\2\0+\4\0\0\15\0\3\0X\5\4€\18\5\2\0'\6\6\0&\4\6\5X\5\3€\18\5\2\0'\6\a\0&\4\6\0056\5\0\0009\5\1\0059\5\b\5\18\a\4\0B\5\2\2\t\5\0\0X\5\4€9\5\t\0019\5\n\5=\4\v\5X\5'€6\5\0\0009\5\1\0059\5\f\0056\a\0\0009\a\1\a9\a\r\a'\t\14\0006\n\0\0009\n\1\n9\n\2\nB\n\1\2'\v\15\0&\t\v\tB\a\2\0A\5\0\0026\6\0\0009\6\16\0069\6\17\6\t\6\1\0X\6\19€\15\0\3\0X\6\4€\18\6\5\0'\a\6\0&\4\a\6X\6\3€\18\6\5\0'\a\a\0&\4\a\0066\6\0\0009\6\1\0069\6\b\6\18\b\4\0B\6\2\2\t\6\0\0X\6\3€9\6\t\0019\6\n\6=\4\v\6K\0\1\0\16shell_error\6v' && poetry env info -p 2>/dev/null\bcd \vsystem\ttrim\15pythonPath\vpython\rsettings\15executable\16/bin/python\24/Scripts/python.exe\nwin32\bhas\v/.venv\vgetcwd\afn\bvim\2\0/\0\2\5\0\2\0\0046\2\0\0'\4\1\0B\2\2\1K\0\1\0\22Pyright attached!\nprintˆ\5\1\0\t\0\29\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0006\3\0\0'\4\4\0B\1\3\3\15\0\1\0X\3\n€9\3\5\0025\5\t\0004\6\3\0005\a\6\0005\b\a\0=\b\b\a>\a\1\6=\6\n\5B\3\2\1X\3\3€6\3\v\0'\5\f\0B\3\2\0016\3\0\0'\5\r\0B\3\2\0029\3\14\0039\3\5\0035\5\15\0=\0\16\5B\3\2\0016\3\0\0'\5\r\0B\3\2\0029\3\17\0039\3\5\0035\5\18\0=\0\16\0055\6\22\0005\a\20\0005\b\19\0=\b\21\a=\a\23\6=\6\24\0053\6\25\0=\6\26\0053\6\27\0=\6\28\5B\3\2\1K\0\1\0\14on_attach\0\16before_init\0\rsettings\vpython\1\0\1\vpython\0\ranalysis\1\0\1\ranalysis\0\1\0\4\27useLibraryCodeForTypes\2\21typeCheckingMode\nbasic\19diagnosticMode\14workspace\20autoSearchPaths\2\1\0\4\14on_attach\0\16before_init\0\rsettings\0\17capabilities\0\fpyright\17capabilities\1\0\1\17capabilities\0\vlua_ls\14lspconfig\30Failed to precall lazydev\nprint\flibrary\1\0\1\flibrary\0\nwords\1\2\0\0\fvim%.uv\1\0\2\nwords\0\tpath\23${3rd}/luv/library\nsetup\flazydev\npcall\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "nvim-lspconfig")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
