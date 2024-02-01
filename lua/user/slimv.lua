local M = {
  "kovisoft/slimv",
  lazy = true,
  event = "BufEnter *.lisp",
}

function M.config()
  vim.cmd('let g:slimv_leader = ";"')
end

return M
