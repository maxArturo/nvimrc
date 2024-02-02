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


local no_list_buf = {
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
}

local quick_exit_only = {
  "fugitive",
  "",
}

-- quick exit 
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = Merge(no_list_buf, quick_exit_only),
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      ]]
  end,
})

-- no buflist
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = no_list_buf,
  callback = function()
    vim.cmd [[
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

-- set lisp local leader
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "lisp" },
  callback = function()
    vim.g.maplocalleader = ";"
  end,
})

-- and this reverts the local leader
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*" },
    callback = function()
        if vim.bo.filetype ~= "lisp" then
            return
        end
    vim.g.maplocalleader = ","
    end,
})
