return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            luasnip.config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
            })
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local has_words_before = function()
                local line, column = unpack(vim.api.nvim_win_get_cursor(0))

                if column == 0 then
                    return false
                end

                local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]

                return current_line:sub(column, column):match("%s") == nil
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<C-e>"] = cmp.mapping.abort(),

                    ["<CR>"] = cmp.mapping(function()
                        if cmp.visible() and cmp.get_selected_entry() then
                            cmp.confirm({
                                select = false,
                            })
                        else
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<C-g>u<CR>", true, false, true),
                                "n",
                                false
                            )
                        end
                    end, {
                        "i",
                        "s",
                    }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                }),

                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                    },
                    {
                        name = "luasnip",
                    },
                    {
                        name = "path",
                    },
                }, {
                    {
                        name = "buffer",
                    },
                }),
            })

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    {
                        name = "buffer",
                    },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    {
                        name = "path",
                    },
                }, {
                    {
                        name = "cmdline",
                    },
                }),
            })
        end,
    },
}
