-- 'ibhagwan/fzf-lua' ----------------------------------------------------------
opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').git_status()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require('fzf-lua').live_grep()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require('fzf-lua').oldfiles()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>k', "<cmd>lua require('fzf-lua').keymaps()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>lua require('fzf-lua').commands()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>r', "<cmd>lua require('fzf-lua').registers()<CR>", opt)

-- 'junegunn/fzf.vim' ----------------------------------------------------------
vim.cmd "let g:fzf_preview_window = ['right:70%', 'ctrl-/']"

