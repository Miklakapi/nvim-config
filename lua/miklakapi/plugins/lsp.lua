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
                ensure_installed = {
                    "lua_ls",
                    "vtsls",
                    "vue_ls",
                    "intelephense",
                    "gopls",
                    "pyright",
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            vim.lsp.config("lua_ls", {
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

            vim.lsp.config("vtsls", {})

            vim.lsp.config("vue_ls", {})

            vim.lsp.config("intelephense", {})

            vim.lsp.config("gopls", {})

            vim.lsp.config("pyright", {})

            vim.lsp.enable({
                "lua_ls",
                "vtsls",
                "vue_ls",
                "intelephense",
                "gopls",
                "pyright",
            })
        end,
    },
}
