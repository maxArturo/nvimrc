require "user.launch"   --validated
require "user.options"  --validated
require "user.leader"   --validated
spec "user.whichkey"
spec "user.colorscheme" --validated
spec "user.devicons"    --validated
spec "user.telescope" -- need re-evaluate hotkeys
spec "user.harpoon"
spec "user.illuminate"
spec "user.nvimtree"
spec "user.lualine"
spec "user.navic"
spec "user.vim-fugitive"
spec "user.breadcrumbs"
spec "user.autopairs"
spec "user.alpha"
spec "user.project"
spec "user.toggleterm"
-- spec "user.treesitter"
-- spec "user.mason"
-- spec "user.schemastore"
-- spec "user.lspconfig"
-- spec "user.cmp"
-- spec "user.none-ls"
-- spec "user.comment" -- not touching this for now, it should work with treesitter later
-- spec "user.indentline" -- not touching this for now, it should work with treesitter later
-- spec "user.neotest"
-- spec "user.neogit"
require "user.lazy"
require "user.keymaps"
require "user.autocmds"
