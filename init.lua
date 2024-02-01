require "user.util"   --validated
require "user.launch"   --validated
require "user.options"  --validated
require "user.leader"   --validated
spec "user.whichkey"
spec "user.colorscheme" --validated
spec "user.devicons"    --validated
spec "user.telescope" -- need re-evaluate hotkeys
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
spec "user.treesitter"
spec "user.mason"
spec "user.lspconfig"
spec "user.schemastore"
spec "user.cmp"
spec "user.none-ls"
spec "user.comment"
spec "user.slimv"
spec "user.trouble"
-- spec "user.neotest"
spec "user.indentline"
require "user.lazy"
require "user.keymaps"
require "user.autocmds"

