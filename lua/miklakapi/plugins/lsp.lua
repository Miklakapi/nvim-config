local vue_language_server_path = vim.fn.stdpath("data") ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local servers = {
    "lua_ls",
    "vtsls",
    "vue_ls",
    "eslint",
    "cssls",
    "intelephense",
    "gopls",
    "pyright",
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })

            vim.lsp.config("vtsls", {
                capabilities = capabilities,
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "vue",
                },
                settings = {
                    vtsls = {
                        tsserver = {
                            globalPlugins = {
                                {
                                    name = "@vue/typescript-plugin",
                                    location = vue_language_server_path,
                                    languages = {
                                        "vue",
                                    },
                                    configNamespace = "typescript",
                                },
                            },
                        },
                    },
                },
            })

            vim.lsp.config("vue_ls", {
                capabilities = capabilities,
            })

            vim.lsp.config("eslint", {
                capabilities = capabilities,
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "vue",
                },
                settings = {
                    workingDirectories = {
                        mode = "auto",
                    },
                    format = false,
                },
            })

            vim.lsp.config("cssls", {
                capabilities = capabilities,
                filetypes = {
                    "css",
                    "scss",
                    "less",
                },
                settings = {
                    css = {
                        validate = true,
                    },
                    scss = {
                        validate = true,
                    },
                    less = {
                        validate = true,
                    },
                },
            })

            vim.lsp.config("intelephense", {
                capabilities = capabilities,
            })

            vim.lsp.config("gopls", {
                capabilities = capabilities,
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            vim.lsp.enable(servers)
        end,
    },
}
