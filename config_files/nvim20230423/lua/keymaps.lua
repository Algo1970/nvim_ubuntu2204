-- jj -> ESC
vim.keymap.set('i', 'jj', '<ESC>')

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

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- filer
vim.api.nvim_set_keymap('n', '<leader>f', ':<C-u>Ex<CR>', {noremap = true})

-- vim.api.nvim_set_keymap('n', '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', ':<C-u>w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':<C-u>q<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<C-l>', ':<C-u>bnext<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-h>', ':<C-u>bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-W>j', ':<C-u>resize +3<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>k', ':<C-u>resize -3<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>l', ':<C-u>vertical resize +5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>h', ':<C-u>vertical resize -5<CR>', { silent = true })
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

