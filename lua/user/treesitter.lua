local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { 
      "lua", 
      "vim",
      "vimdoc",
      "markdown", 
      "markdown_inline", 
      "bash", 
    },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
  }
end

return M
