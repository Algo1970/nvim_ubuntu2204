-- require('base')
-- require('hilights')
-- require('maps')


vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.ambiwidth = "single"
vim.opt.wildmenu = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. '/.vim/backup'
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.nrformats = "bin,hex"
vim.opt.swapfile = false
vim.opt.formatoptions:remove('t')
vim.opt.formatoptions:append('mM')

-- move window
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sh', '<C-w>h')

vim.keymap.set('n', 'sJ', '<C-w>J')
vim.keymap.set('n', 'sK', '<C-w>K')
vim.keymap.set('n', 'sL', '<C-w>L')
vim.keymap.set('n', 'sH', '<C-w>H')

-- set s+sv separate window
vim.keymap.set('n', 'ss', '<C-w>s')
vim.keymap.set('n', 'sv', '<C-w>v')
-- set s+nptT move tab
vim.keymap.set('n', 'sn', 'gt') 
vim.keymap.set('n', 'sp', 'gT')
vim.keymap.set('n', 'st', ':<C-u>tabnew<CR>')

-- original keymap
vim.keymap.set('n', 'py', ':IronRepl<CR>sH')



require("packer").startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- use 'williamboman/nvim-lsp-installer'

  -- nvim-cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  -- }
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  --use 'cocopon/iceberg.vim'
  
  use 'sainnhe/sonokai'
  --use 'tomasr/molokai'
  --use 'tanvirtin/monokai.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  -- use 'nvim-treesitter/playground'
  use 'obaland/vfiler.vim'
  use 'obaland/vfiler-fzf'
  use 'ibhagwan/fzf-lua'
  -- use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons'}}
  -- use "SirVer/ultisnipq"
  -- use "honza/vim-snippets"
  use 'mattn/emmet-vim'
  -- use 'folke/noice.nvim'
  use 'tpope/vim-commentary'
  use 'hkupty/iron.nvim'
  -- use 'jalveseq/Nvim-R'
  -- use 'easymotion/vim-easymotion'
end)






vim.g.mapleader = " "
-- vim.api.nvim_set_keymap('n', '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', ':<C-u>w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':<C-u>q<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':<C-u>bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':<C-u>bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-W>+', ':<C-u>resize +5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>-', ':<C-u>resize -5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>>', ':<C-u>vertical resize +10<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W><', ':<C-u>vertical resize -10<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>j', '<CMD>wincmd j<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>k', '<CMD>wincmd k<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>h', '<CMD>wincmd h<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>l', '<CMD>wincmd l<CR>', {silent=true})
-- 'ibhagwan/fzf-lua' ----------------------------------------------------------
opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').git_status()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require('fzf-lua').live_grep()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require('fzf-lua').oldfiles()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", opt)
-- 'tpope/vim-fugitive' --------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>GG', ':<C-u>Git<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GC', ':<C-u>Git commit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GP', ':<C-u>Git push<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GL', ':<C-u>Git log --oneline<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GD', ':<C-u>vert Gdiffsplit !~1', {noremap = true})

-- 'easymotion/vim-easymotion' --------------------------------------------------------
-- vim.cmd 'map  <Leader>f <Plug>(easymotion-bd-f)'
-- vim.cmd 'nmap <Leader>f <Plug>(easymotion-overwin-f)'
-- vim.cmd 'nmap f <Plug>(easymotion-overwin-f2)'
-- vim.cmd 'let g:EasyMotion_smartcase = 1'
-- vim.cmd 'let g:EasyMotion_do_mapping = 0' 
-- vim.cmd 'let g:EasyMotion_keys = "fjdkslaureiwoqpvncm"'




local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})



require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
-- require("mason-lspconfig").setup()
local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {}

    if server_name == "sumneko_lua" then
        opts.settings = {
            Lua = {
                diagnostics = { globals = { 'vim' } },
            }
        }
    end

    nvim_lsp[server_name].setup(opts)
  end
})

require'lspconfig'.gopls.setup{}

-- require('lualine').setup()





-- colorscheme -----------------------------------------------------------------
vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight NonText ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight Folded ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none'
--vim.cmd 'colorscheme iceberg'
vim.cmd 'colorscheme sonokai'
--vim.cmd 'colorscheme molokai'
--vim.cmd 'colorscheme monokai'

-- 'vim-airline/vim-airline' ---------------------------------------------------
vim.cmd 'let g:airline_symbols_ascii = 1'
vim.cmd 'let g:airline#extensions#tabline#enabled = 1'
vim.cmd 'let g:airline#extensions#whitespace#mixed_indent_algo = 1'

-- 'vim-airline/vim-airline-themes' --------------------------------------------
--vim.cmd 'let g:airline_theme = "papercolor"'
vim.cmd 'let g:airline_theme = "murmur"'

-- 'airblade/vim-gitgutter' ----------------------------------------------------
vim.cmd 'let g:gitgutter_sign_added = "+"'
vim.cmd 'let g:gitgutter_sign_modified = "^"'
vim.cmd 'let g:gitgutter_sign_removed = "-"'
vim.cmd 'highlight GitGutterAdd    guifg=#009900 ctermfg=2'
vim.cmd 'highlight GitGutterChange guifg=#bbbb00 ctermfg=3'
vim.cmd 'highlight GitGutterDelete guifg=#ff2222 ctermfg=1'
vim.cmd 'highlight GitGutterAddLine          ctermbg=2'
vim.cmd 'highlight GitGutterChangeLine       ctermbg=3'
vim.cmd 'highlight GitGutterDeleteLine       ctermbg=1'

-- 'junegunn/fzf.vim' ----------------------------------------------------------
vim.cmd "let g:fzf_preview_window = ['right:70%', 'ctrl-/']"


-- 'ibhagwan/fzf-lua' ----------------------------------------------------------
require('vfiler/config').setup {
  options = {
    auto_cd = true,
    auto_resize = true,
    keep = true,
    layout = 'left',
    name = 'explorer',
    width = 30,
    columns = 'indent,icon,name',
  },
}
-- require('vfiler').start()



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
    -- repl_open_cmd = require('iron.view').right(80),
    -- repl_open_cmd = require('iron.view').split("40%"),
    -- repl_open_cmd = require('iron.view').split.vertical("40%"),
    repl_open_cmd = require('iron.view').split.vertical("40%"),

  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
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
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')




