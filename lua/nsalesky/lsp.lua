-- Load LSP
local lsp_configs = {
  "basedpyright",
  "rust_analyzer",
  "bashls",
  "gopls",
  "svelte",
  "hls",
  "nixd",
}

for _, f in pairs(vim.api.nvim_get_runtime_file("lua/nsalesky/lsp/*.lua", true)) do
  local server_name = vim.fn.fnamemodify(f, ":t:r")
  table.insert(lsp_configs, server_name)
end

-- Enable LSPs with custom configs
vim.lsp.enable(lsp_configs)
