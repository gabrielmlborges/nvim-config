return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            "rafamadriz/friendly-snippets",
        },
    },
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        "hrsh7th/nvim-cmp",
        config = function ()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            require("cmp").setup {
                snippet = {
                    expand = function (args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = require("cmp").config.window.bordered(),
                    documentation = require("cmp").config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = require("cmp").config.sources{
                    { name = "nvim_lsp" },
                    { name = "luasnip"},
                },
            }
        end,
    },
}
