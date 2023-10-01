-- snippy_setting

-- https://github.com/dcampos/nvim-snippy
require('snippy').setup({
    enable_auto = true,
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
            -- ['<S-Tab>'] = 'previous',
            ['<C-L>'] = 'next',
            ['<C-H>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
})

-- https://github.com/dcampos/nvim-snippy/wiki/Mappings
-- local mappings = require('snippy.mapping')
--
-- vim.keymap.set('i', '<Tab>', mappings.expand_or_advance('<Tab>'))
-- vim.keymap.set('s', '<Tab>', mappings.next('<Tab>'))
-- vim.keymap.set({ 'i', 's' }, '<S-Tab>', mappings.previous('<S-Tab>'))
-- vim.keymap.set('x', '<Tab>', mappings.cut_text, { remap = true })
-- vim.keymap.set('n', 'g<Tab>', mappings.cut_text, { remap = true })
