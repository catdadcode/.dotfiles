-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Hack to eliminate constant offset encoding warnings in insert mode when clangd is attached.
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16" }
-- require("lspconfig").clangd.setup({ capabilities = capabilities })
