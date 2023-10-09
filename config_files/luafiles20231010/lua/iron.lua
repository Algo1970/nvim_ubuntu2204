
--- iron settings ---
local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    -- repl_open_cmd = require('iron.view').bottom(40),
    repl_open_cmd = require('iron.view').right(50),
    -- repl_open_cmd = require('iron.view').left(80),
    -- repl_open_cmd = require('iron.view').split("40%"),
    -- repl_open_cmd = require('iron.view').split.vertical("40%"),

    -- repl_open_cmd = require('iron.view').split.vertical("40%"),

  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    -- visual_send = "<space>sc",
    visual_send = "<C-L>",
    send_file = "<space>sf",
    -- send_line = "<space>sl",
    -- send_line = "<C-l>",
    send_line = "<localleader>l",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines

  -- repl_open_cmd = view.split("40%", {
  -- winfixwidth = false,
  -- winfixheight = false,
  -- -- any window-local configuration can be used here
  -- number = true
  -- }),
}

-- iron also has a list of commands, see :h iron-commands for all available commands
-- vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
-- vim.keymap.set('n', '<space>py', '<cmd>IronRepl<cr>')
-- vim.keymap.set('n', '<localleader>py', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>ih', '<cmd>IronReplHere<cr>')
vim.keymap.set('n', '<space>ir', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

-- local view = require("iron.view")
-- repl_open_cmd = view.split("40%")




