return {
    "stevearc/conform.nvim",
    event = {
        "BufWritePre",
    },
    cmd = {
        "ConformInfo",
    },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    async = true,
                    lsp_fallback = true,
                })
            end,
            desc = "Format file",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = {
                "stylua",
            },
            javascript = {
                "prettier",
            },
            javascriptreact = {
                "prettier",
            },
            typescript = {
                "prettier",
            },
            typescriptreact = {
                "prettier",
            },
            vue = {
                "prettier",
            },
            json = {
                "prettier",
            },
            css = {
                "prettier",
            },
            scss = {
                "prettier",
            },
            html = {
                "prettier",
            },
            yaml = {
                "prettier",
            },
            php = {
                "php_cs_fixer",
            },
        },

        format_on_save = function()
            return {
                timeout_ms = 1000,
                lsp_fallback = true,
            }
        end,
    },
}
