--- DeepL setting ----
vim.cmd 'let g:deepl#endpoint = "https://api-free.deepl.com/v2/translate"'
vim.cmd 'let g:deepl#auth_key = "8c5676aa-1023-06f6-ddf8-b4f571695c0f:fx"'
vim.cmd 'vmap t<C-e> <Cmd>call deepl#translate#v("EN")<CR>'
vim.cmd 'vmap t<C-j> <Cmd>call deepl#translate#v("JA")<CR>'
