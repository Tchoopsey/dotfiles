-- lsp keymaps

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "lua_ls",
        "rust_analyzer",
    },

    automatic_installation = false,

    handlers = {
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup{}
        end,
        ["lua_ls"] = function ()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }
        end,

    }
    
})
require("fidget").setup{}

local ls = require("luasnip")

local cmp = require('cmp')
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        --['<C-n'] = cmp.
        --['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-f>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-l>'] = cmp.mapping(function (fallback)
            if ls.jumpable() then
                ls.jump(1)
            elseif ls.check_backspace() then
                fallback()
            else
                fallback()
            end
        end),
        ['<C-h>'] = cmp.mapping(function (fallback)
            if ls.jumpable(-1) then
                ls.jump(-1)
            else
                fallback()
            end
        end)
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' },
        { name = 'path' },
    },

    {
        { name = 'buffer' },
    }),

    vim.diagnostic.config({
        update_in_insert = true
    })
})

require("luasnip.loaders.from_vscode").lazy_load()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').rust_analyzer.setup {
    capabilities = capabilities
}
require('lspconfig').clangd.setup{
    capabilities = capabilities
}
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--}
