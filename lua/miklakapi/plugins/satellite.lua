return {
    "lewis6991/satellite.nvim",
    event = {
        "BufReadPost",
        "BufNewFile",
    },
    dependencies = {
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        require("satellite").setup({
            excluded_filetypes = {
                "help",
                "lazy",
                "mason",
                "NvimTree",
                "neo-tree",
                "TelescopePrompt",
                "DressingInput",
                "cmp_docs",
                "cmp_menu",
                "noice",
                "prompt",
            },

            handlers = {
                gitsigns = {
                    signs = {
                        add = "┃",
                        change = "┃",
                        delete = "_",
                    },
                },

                search = {
                    enable = false,
                },

                marks = {
                    enable = false,
                },

                quickfix = {
                    enable = true,
                },
            },
        })
    end,
}
