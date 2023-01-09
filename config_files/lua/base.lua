vim.cmd('autocmd!')

-- vim.api.nvim_exec ('language en_US', true)
vim.g.mapleader = " "

-- vim.opt.encoding = 'uft-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'uft-8'

-- vim.wo : window-scope
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true        -- 右下にまだ実行していないコマンドを表示
vim.opt.cmdheight = 1
vim.opt.laststatus = 2        -- 常にステータスラインを表示
vim.opt.expandtab = true
vim.opt.scrolloff = 10
-- vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'     -- 文字列置換をインタラクティブに表示する
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true             -- Auto Indent
vim.opt.si = true             -- Smart indet
vim.opt.backspace = 'start,eol,indent'   

-- vim.opt.clipboard:append{'unnamedplus'}




