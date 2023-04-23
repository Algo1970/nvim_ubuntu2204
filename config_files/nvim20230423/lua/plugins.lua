
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
  -- use 'easymotion/vim-easymotion'

  use 'jalvesaq/Nvim-R'
  use 'jalvesaq/cmp-nvim-r'


  use 'tyru/open-browser.vim'

end)




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

-- 'simeji/winresizer' ----------------------------------------------------
-- vim.cmd 'let g:winresizer_start_key = "<C-t>"'
--vim.cmd 'let g:winresizer_keycode_up = "\<UP>"'
--vim.cmd 'let g:winresizer_keycode_down = "\<DOWN>"'
--vim.cmd ''


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
vim.keymap.set('n', '<localleader>py', '<cmd>IronReplHere<cr>')
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

-- local view = require("iron.view")
-- repl_open_cmd = view.split("40%")




-- Nvim-R setting
require'cmp'.setup {
  sources = {
    { name = 'cmp_nvim_r' },
  }
}

require'cmp_nvim_r'.setup({
  filetypes = {'r', 'rmd', 'quarto'},
  doc_width = 58
  })

-- cmp.setup({
--     formatting = {
--         fields = {'abbr', 'kind', 'menu'},
--         format = lspkind.cmp_format({
--             mode = 'symbol', -- show only symbol annotations
--             maxwidth = 50, -- prevent the popup from showing more than provided characters
--             ellipsis_char = '...', -- the truncated part when popup menu exceed maxwidth
--             before = function(entry, item)
--                 local menu_icon = {
--                     nvim_lsp = '',
--                     vsnip = '',
--                     path = '',
--                     cmp_zotcite = 'z',
--                     cmp_nvim_r = 'R'
--                 }
--                 item.menu = menu_icon[entry.source.name]
--                 return item
--             end,
--         })
--     },
--     sources = cmp.config.sources({
--         { name = 'vsnip' },
--         { name = 'cmp_zotcite' },
--         { name = 'cmp_nvim_r' },
--         { name = 'nvim_lsp' },
--         { name = 'path', option = { trailing_slash = true } },
--     }),
-- })





-- 'airblade/vim-gitgutter' ----------------------------------------------------
vim.cmd 'let g:netrw_nogx = 1'
vim.keymap.set('n', 'go', '<Plug>(openbrowser-open)<cr>')
vim.keymap.set('n', 'gq', '<Plug>(openbrowser-smart-search)<cr>')
