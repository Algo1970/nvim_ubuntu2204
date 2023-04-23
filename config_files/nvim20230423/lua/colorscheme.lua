
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
