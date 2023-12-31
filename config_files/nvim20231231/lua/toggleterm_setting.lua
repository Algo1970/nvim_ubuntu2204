local Terminal  = require('toggleterm.terminal').Terminal

-- lazygit setting
local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    -- float_opts = {
    --   border = "double",
    float_opts = {
      border = "double",
      border =  'curved' 
    },
    hidden = true })
function _lazygit_toggle()
  lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- terminal setting
local bashterm = Terminal:new({ cmd = "bash", hidden = true })
function _bash_toggle()
  bashterm:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _bash_toggle()<CR><ESC><C-w>k", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>te", "<cmd>lua _bash_toggle()i<CR>", {noremap = true, silent = true})

-- r repl setting
-- local rterm = Terminal:new({ cmd = "R", hidden = true })
-- function _r_toggle()
--   rterm:toggle()
-- end
-- vim.api.nvim_set_keymap("n", "<leader>rl", "<cmd>lua _r_toggle()<CR><ESC><C-w>k", {noremap = true, silent = true})

-- python repl setting
local pyterm = Terminal:new({ cmd = "ipython", hidden = true })
function _py_toggle()
  pyterm:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>py", "<cmd>lua _py_toggle()<CR><ESC><C-w>k", {noremap = true, silent = true})

-- lua repl setting
local luaterm = Terminal:new({ cmd = "lua", hidden = true })
function _lua_toggle()
  luaterm:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>lu", "<cmd>lua _lua_toggle()<CR><ESC><C-w>k", {noremap = true, silent = true})

-- general repl setting
vim.api.nvim_set_keymap("n", "<localleader>l", "<cmd>ToggleTermSendCurrentLine<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<localleader>s", ":'<,'>ToggleTermSendVisualSelection<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<localleader>p", "vipj:ToggleTermSendVisualSelection<CR>", {noremap = true, silent = true})

require("toggleterm").setup{
--   -- size can be a number or function which is passed the current terminal
--   size = 20 | function(term)
--     if term.direction == "horizontal" then
--       return 15
--     elseif term.direction == "vertical" then
--       return vim.o.columns * 0.4
--     end
--   end,
  -- open_mapping = [[<c-\>]],
  -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
  -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
  -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
  -- hide_numbers = true, -- hide the number column in toggleterm buffers
  -- shade_filetypes = {},
  -- autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  -- highlights = {
  --   -- highlights which map to a highlight group name and a table of it's values
  --   -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
  --   Normal = {
  --     guibg = "<VALUE-HERE>",
  --   },
  --   NormalFloat = {
  --     link = 'Normal'
  --   },
  --   FloatBorder = {
  --     guifg = "<VALUE-HERE>",
  --     guibg = "<VALUE-HERE>",
  --   },
  -- },
  -- shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  -- shading_factor = '<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = false,
  -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
  -- terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  -- persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
  -- close_on_exit = true, -- close the terminal window when the process exits
  --  -- Change the default shell. Can be a string or a function returning a string
  -- shell = vim.o.shell,
  -- auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- -- This field is only relevant if direction is set to 'float'
  -- float_opts = {
  --   -- The border key is *almost* the same as 'nvim_open_win'
  --   -- see :h nvim_open_win for details on borders however
  --   -- the 'curved' border is a custom border type
  --   -- not natively supported but implemented in this plugin.
  --   border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
  --   -- like `size`, width and height can be a number or function which is passed the current terminal
  --   width = <value>,
  --   height = <value>,
  --   winblend = 3,
  --   zindex = <value>,
  -- },
  -- winbar = {
  --   enabled = false,
  --   name_formatter = function(term) --  term: Terminal
  --     return term.name
  --   end
  -- },
}
