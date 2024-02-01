-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     vim.cmd "set formatoptions-=cro"
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
--   callback = function()
--     vim.cmd "quit"
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
--   callback = function()
--     local status_ok, luasnip = pcall(require, "luasnip")
--     if not status_ok then
--       return
--     end
--     if luasnip.expand_or_jumpable() then
--       -- ask maintainer for option to make this silent
--       -- luasnip.unlink_current()
--       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
--     end
--   end,
-- })

-- quick exit and prevent these filetypes from 
-- showing up on buffer lists
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

-- keep windows resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Check if any buffers were changed outside of Vim.
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

-- Set up tree-sitter based folding
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "set foldmethod=expr"
    vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
    vim.cmd "set nofoldenable" --disable folding at startup
  end,
})

-- quickly highlight whatever you yanked
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end,
})

-- markdown-specific settings
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

