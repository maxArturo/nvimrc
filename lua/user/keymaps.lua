local wk = require "which-key"

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

wk.register {
  t = {
    name = "Tab",
    n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
    N = { "<cmd>tabnew %<cr>", "New Tab" },
    o = { "<cmd>tabonly<cr>", "Only" },
    c = { "<cmd>tabclose<cr>", "Close" },
    h = { "<cmd>-tabmove<cr>", "Move Left" },
    l = { "<cmd>+tabmove<cr>", "Move Right" },
  },
  ["<leader>"] = {
    ["bd"] = { "<cmd>:bunload<cr>:tabclose<cr>gT", "Close current buffer" },
    ["ba"] = { "<cmd>:bufdo bd<cr>", "close all buffers" },
    ["l"] = { "<cmd>:bnext<cr>", "Next buffer" },
    ["h"] = { "<cmd>:bprevious<cr>", "Prev buffer" },
    ["w"] = { "<cmd>:w!<cr>", "write file" },
  },
  ["<c-h>"] = { "<C-w>h", "Move to left window"},
  ["<c-j>"] = { "<C-w>j", "Move to right window"},
  ["<c-k>"] = { "<C-w>k", "Move to upper window"},
  ["<c-l>"] = { "<C-w>l", "Move to lower window"},
  ["<space>"] = {"<cmd>:let @/ = \"\"<CR>", "Clear latest search"},
  ["g*"]= { "g*zz", "case-insensitive search"},
  ["n"] = {"nzz",  "search next occurrence" },
  ["N"] = {"Nzz",  "search prev occurrence" },
  ["*"] = {"*zz",  "search for current string udner cursor"},
} 

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move to literal ends of lines
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
