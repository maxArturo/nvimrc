local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "rust_analyzer",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
