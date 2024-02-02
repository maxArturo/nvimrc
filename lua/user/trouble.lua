local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>?"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Comment" },
  }
end

return M
