local keymap = vim.keymap

-- option : n = normal, nx = normal + visual

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select All
keymap.set('n', '<C-a>','gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', {silent = true})
-- Split window
keymap.set('n', '<Leader>ss', ':split<Return><C-w>w', {silent = true})
keymap.set('n', '<Leader>sv', ':vsplit<Return><C-w>w', {silent = true})
-- Move window
keymap.set('n', ',', '<C-w>w')
keymap.set('', '<S-left>', '<C-w>h')
keymap.set('', '<S-down>', '<C-w>j')
keymap.set('', '<S-up>', '<C-w>k')
keymap.set('', '<S-right>', '<C-w>l')
-- REsize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
