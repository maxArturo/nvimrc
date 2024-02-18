-- all options here need to be run
-- before lazy due to plugin-specific reasons

-- for terrible reasons this lives here
-- https://github.com/monkoose/nvlime/issues/3

vim.cmd(string.format(
  [[
    let g:nvlime_cl_impl = "my_sbcl"

    function! NvlimeBuildServerCommandFor_my_sbcl(nvlime_loader, nvlime_eval)
        return ["sbcl",
                    \ "--load", "%s/quicklisp/setup.lisp",
                    \ "--load", a:nvlime_loader,
                    \ "--eval", a:nvlime_eval]
    endfunction
]], vim.fn.expand("~")
))

local nvlime_leader = ";"

vim.g.nvlime_config = {
      leader = nvlime_leader,
      implementation = "my_sbcl",
      autodoc = {
        enabled = true,
        max_level = 5,
        max_lines = 50,
      },
      main_window = {
        position = "right",
        size = "",
      },
      floating_window = {
        border = "single",
        scroll_step = 5,
      },
      cmp = { enabled = true },
      arglist = { enabled = true },
    }

vim.g.nvlime_mappings = {
  global = {
    normal = {
      scroll_down = "<C-n>",
    }
  },
  lisp = {
    normal = {
      repl = {
        send_expr = nvlime_leader .. "e",
        show = nvlime_leader .. "c",
        clear = nvlime_leader .. "-"
      }
    }
  }
}

-- additional mappings left here for reference

-- vim.g.nvlime_mappings = {
--         global = {
--             normal = {
--                 close_current_window = "q",
--                 keymaps_help = {"<LocalLeader>?"},
--                 close_nvlime_windows = "<LocalLeader>wc",
--                 close_floating_window = "<Esc>",
--                 scroll_up = "<C-u>",
--                 scroll_down = "<C-n>",
--                 split_left = "<C-w>h",
--                 split_right = "<C-w>l",
--                 split_above = "<C-w>k",
--                 split_below = "<C-w>j"
--             }
--         },
--         lisp = {
--             normal = {
--                 interaction_mode = "<LocalLeader><CR>",
--                 load_file = "<LocalLeader>l",
--                 disassemble = {
--                     expr = "<LocalLeader>aa",
--                     symbol = "<LocalLeader>as",
--                 },
--                 set_package = "<LocalLeader>p",
--                 set_breakpoint = "<LocalLeader>b",
--                 show_threads = "<LocalLeader>T",
--                 connection = {
--                     new = "<LocalLeader>cc",
--                     switch = "<LocalLeader>cs",
--                     rename = "<LocalLeader>cR",
--                     close = "<LocalLeader>cd"
--                 },
--                 server = {
--                     new = "<LocalLeader>rr",
--                     show = "<LocalLeader>rv",
--                     show_selected = "<LocalLeader>rV",
--                     stop = "<LocalLeader>rs",
--                     stop_selected = "<LocalLeader>rS",
--                     rename = "<LocalLeader>rR",
--                     restart = "<LocalLeader>rt"
--                 },
--                 repl = {
--                     show = "<LocalLeader>so",
--                     clear = "<LocalLeader>sC",
--                     send_atom_expr = "<LocalLeader>ss",
--                     send_atom = "<LocalLeader>sa",
--                     send_expr = "<LocalLeader>se",
--                     send_toplevel_expr = "<LocalLeader>st",
--                     prompt = "<LocalLeader>si"
--                 },
--                 macro = {
--                     expand = "<LocalLeader>mm",
--                     expand_once = "<LocalLeader>mo",
--                     expand_all = "<LocalLeader>ma"
--                 },
--                 compile = {
--                     expr = "<LocalLeader>ce",
--                     toplevel_expr = "<LocalLeader>ct",
--                     file = "<LocalLeader>cf"
--                 },
--                 xref = {
--                     ["function"] = {
--                         callers = "<LocalLeader>xc",
--                         callees = "<LocalLeader>xC"
--                     },
--                     symbol = {
--                         references = "<LocalLeader>xr",
--                         bindings = "<LocalLeader>xb",
--                         definition = "<LocalLeader>xd",
--                         set_locations = "<LocalLeader>xs"
--                     },
--                     macro = { callers = "<LocalLeader>xe" },
--                     class = { methods = "<LocalLeader>xm" },
--                     prompt = "<LocalLeader>xi"
--                 },
--                 describe = {
--                     operator = "<LocalLeader>do",
--                     atom = "<LocalLeader>da",
--                     prompt = "<LocalLeader>di"
--                 },
--                 apropos = {prompt = "<LocalLeader>ds"},
--                 arglist = {show = "<LocalLeader>dr"},
--                 documentation = {
--                     operator = "<LocalLeader>ddo",
--                     atom = {"K", "<LocalLeader>dda"},
--                     prompt = "<LocalLeader>ddi"
--                 },
--                 inspect = {
--                     atom_expr = "<LocalLeader>ii",
--                     atom = "<LocalLeader>ia",
--                     expr = "<LocalLeader>ie",
--                     toplevel_expr = "<LocalLeader>it",
--                     symbol = "<LocalLeader>is",
--                     prompt = "<LocalLeader>in"
--                 },
--                 trace = {
--                     show = "<LocalLeader>td",
--                     toggle = "<LocalLeader>tt",
--                     prompt = "<LocalLeader>ti"
--                 },
--                 undefine = {
--                     ["function"] = "<LocalLeader>uf",
--                     symbol = "<LocalLeader>us",
--                     prompt = "<LocalLeader>ui"
--                 }
--             },
--             insert = {
--                 space_arglist = "<Space>",
--                 cr_arglist = "<CR>"
--             },
--             visual = {
--                 repl = { send_selection = "<LocalLeader>s" },
--                 ["compile"] = { selection = "<LocalLeader>c" },
--                 ["inspect"] = { selection = "<LocalLeader>i" }
--             }
--         },
--         input = {
--             normal = { complete = "<CR>" },
--             insert = {
--                 keymaps_help = "<F1>",
--                 complete = "<CR>",
--                 next_history = "<C-n>",
--                 prev_history = "<C-p>",
--                 leave_insert = "<Esc>"
--             }
--         },
--         repl = {
--             normal = {
--                 interrupt = "<C-c>",
--                 clear = "C",
--                 inspect_result = "i",
--                 yank_result = "y",
--                 next_result = { "<Tab>", "<C-n>" },
--                 prev_result = { "<S-Tab>", "<C-p>" }
--             }
--         },
--         sldb = {
--             normal = {
--                 action = "<CR>",
--                 details = "d",
--                 frame = {
--                     toggle_details = "d",
--                     source = "S",
--                     source_split = "<C-s>",
--                     source_vsplit = "<C-v>",
--                     source_tab = "<C-t>",
--                     restart = "r",
--                     eval_expr = "e",
--                     send_expr = "E",
--                     disassemble = "D",
--                     return_result = "R",
--                     step = "s"
--                 },
--                 local_var = {
--                     ["source"] = "O",
--                     inspect = "i"
--                 },
--                 step_over = "x",
--                 step_out = "o",
--                 abort = "a",
--                 continue = "c",
--                 inspect_condition = "C"
--             }
--         },
--         apropos = { normal = { inspect = "i" } },
--         inspector = {
--             normal = {
--                 action = "<CR>",
--                 current = {
--                     send = "s",
--                     source = "o"
--                 },
--                 inspected = {
--                     send = "S",
--                     source = "O",
--                     previous = "<C-o>",
--                     next = "<C-i>"
--                 },
--                 next_field = "<C-n>",
--                 prev_field = { "<S-Tab>", "<C-p" },
--                 refresh = "R"
--             }
--         },
--         notes = {
--             normal = {
--                 source = "<CR>",
--                 source_split = "<C-s>",
--                 source_vsplit = "<C-v>",
--                 source_tab = "<C-t>"
--             }
--         },
--         server = {
--             normal = {
--                 connect = "<LocalLeader>c",
--                 stop = "<LocalLeader>s"
--             }
--         },
--         threads = {
--             normal = {
--                 interrupt = "<C-c>",
--                 kill = "K",
--                 invoke_debugger = "D",
--                 refresh = "r"
--             }
--         },
--         trace = {
--             normal = {
--                 action = "<CR>",
--                 refresh = "R",
--                 inspect_value = "i",
--                 send_value = "s",
--                 next_field = { "<Tab>", "<C-n>" },
--                 prev_field = { "<S-Tab>", "<C-p" }
--             }
--         },
--         xref = {
--             normal = {
--                 source = "<CR>",
--                 source_split = "<C-s>",
--                 source_vsplit = "<C-v>",
--                 source_tab = "<C-t>"
--             }
--         },
--         mrepl = {
--             normal = {
--                 clear = "<LocalLeader>C",
--                 disconnect = "<LocalLeader>D"
--             },
--             insert = {
--                 space_arglist = "<Space>",
--                 cr_arglist = "<C-j>",
--                 submit = "<CR>",
--                 interrupt = "<C-c>"
--             }
--         },
--     }


