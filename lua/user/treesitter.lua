local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
  }
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { 
      "lua", 
      "markdown", 
      "markdown_inline", 
      "bash", 
    },
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M
