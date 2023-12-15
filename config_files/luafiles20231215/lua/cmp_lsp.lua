-- cmp setting -----------------------------------------------------------------
local cmp = require('cmp')
local snippy = require("snippy")
local lspkind = require('lspkind')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    enabled = function()
        -- disable completion in comments
        local context = require('cmp.config.context')
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment") 
                and not context.in_syntax_group("Comment")
        end 
    end ,

    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)
            require('snippy').expand_snippet(args.body)
        end,
    },
    
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            -- elseif snippy.can_expand_or_advance() then
            --     snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            -- elseif snippy.can_jump(-1) then
            --     snippy.previous()
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            -- For vsnip users.
            -- { name = 'vsnip' }, 
            { name = 'cmp_nvim_r' },
            -- For snippy users.
            { name = 'snippy' }
        }, 
        {
            { name = 'buffer' },
        },
        {
            { name = 'latex_symbols' }
        }
    ),
    
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			-- require('cmp-under-comparator').under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		}
	}, 
    
    formatting = {
        format = lspkind.cmp_format({
            mode = 'text_symbol', 
            maxwidth = 50
        })
    }
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})


require'cmp_nvim_r'.setup({
  filetypes = {'r', 'rmd', 'quarto'},
  doc_width = 58
  })

local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local bkmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

vim.lsp.set_log_level("INFO")

local lsp_keymaps = function(bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	bkmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	bkmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	bkmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	bkmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	bkmap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	bkmap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- bkmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	bkmap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	bkmap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

local on_attach = function(client, bufnr)
	-- client.resolved_capabilities.document_formatting = false
	-- if client.config.flags then
	-- 	client.config.flags.allow_incremental_sync	 = true
	-- end
	lsp_keymaps(bufnr)
end

-- local caps = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = cmp_nvim_lsp.update_capabilities(caps)
local capabilities = cmp_nvim_lsp.default_capabilities()

nvim_lsp["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- nvim_lsp["elmls"].setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

nvim_lsp["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp["typst_lsp"].setup({
    -- settings = {
    --     exportPdf = "onSave"
    -- },
	on_attach = on_attach,
	capabilities = capabilities,
})

require'lspconfig'.r_language_server.setup{}
require'lspconfig'.jedi_language_server.setup{}



local mason = require('mason')
local mason_lsp = require("mason-lspconfig")

mason.setup()
mason_lsp.setup({
    ensure_installed = { 'pyright' }
})

-- require('goto-preview').setup({
-- 	default_mappings = true
-- })

-- require('nvim-lightbulb').setup()

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
