local vue_language_server_path = vim.fn.stdpath("data") ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local function get_node_module_path(module_name)
    local current_dir = vim.fn.getcwd()

    while current_dir ~= "/" do
        local module_path = current_dir .. "/node_modules/" .. module_name

        if vim.fn.isdirectory(module_path) == 1 then
            return module_path
        end

        current_dir = vim.fn.fnamemodify(current_dir, ":h")
    end

    return nil
end

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

            local ts_lit_plugin_path = get_node_module_path("ts-lit-plugin")

            local vtsls_global_plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = vue_language_server_path,
                    languages = {
                        "vue",
                    },
                    configNamespace = "typescript",
                },
            }

            if ts_lit_plugin_path ~= nil then
                table.insert(vtsls_global_plugins, {
                    name = "ts-lit-plugin",
                    location = ts_lit_plugin_path,
                    languages = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                    },
                })
            end

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
                    typescript = {
                        tsdk = "./node_modules/typescript/lib",
                        preferences = {
                            includePackageJsonAutoImports = "auto",
                        },
                    },
                    javascript = {
                        preferences = {
                            includePackageJsonAutoImports = "auto",
                        },
                    },
                    vtsls = {
                        tsserver = {
                            globalPlugins = vtsls_global_plugins,
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
                filetypes = {
                    "php",
                },
                settings = {
                    intelephense = {
                        files = {
                            maxSize = 5000000,
                        },
                        diagnostics = {
                            undefinedTypes = true,
                            undefinedFunctions = true,
                            undefinedConstants = true,
                            undefinedClassConstants = true,
                            undefinedMethods = true,
                            undefinedProperties = true,
                            undefinedVariables = true,
                        },
                    },
                },
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
