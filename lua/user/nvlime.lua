-- NOTE:
-- This works in conjunction with 'user.pluginopts' due to the way the
-- nvlime plugin works.

local M = {
  "monkoose/nvlime",
  dependencies = {
    "monkoose/parsley",
    "vim-scripts/paredit.vim"
  },
  ft = "lisp",
  commit = "936df43"
}

return M
