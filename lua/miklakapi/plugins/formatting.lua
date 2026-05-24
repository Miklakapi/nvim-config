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
        },

        format_on_save = function(buffer)
            local disabled_filetypes = {
                php = true,
            }

            if disabled_filetypes[vim.bo[buffer].filetype] then
                return
            end

            return {
                timeout_ms = 1000,
                lsp_fallback = true,
            }
        end,
    },
}
