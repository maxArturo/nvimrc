local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>h",
  function()
    vim.cmd.RustLsp('externalDocs')
  end,
  { silent = true, buffer = bufnr }
)

