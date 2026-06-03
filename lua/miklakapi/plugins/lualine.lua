return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
        local lualine = require("lualine")

        local colors = {
            bg = "#11111b",
            fg = "#cdd6f4",
            blue = "#89b4fa",
            green = "#a6e3a1",
            purple = "#cba6f7",
            red = "#f38ba8",
            yellow = "#f9e2af",
            git = "#313244",
            file = "#181825",
        }

        local theme = {
            normal = {
                a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
                b = { fg = colors.fg, bg = colors.git },
                c = { fg = colors.fg, bg = colors.file },
            },
            insert = {
                a = { fg = colors.bg, bg = colors.green, gui = "bold" },
                b = { fg = colors.fg, bg = colors.git },
                c = { fg = colors.fg, bg = colors.file },
            },
            visual = {
                a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
                b = { fg = colors.fg, bg = colors.git },
                c = { fg = colors.fg, bg = colors.file },
            },
            replace = {
                a = { fg = colors.bg, bg = colors.red, gui = "bold" },
                b = { fg = colors.fg, bg = colors.git },
                c = { fg = colors.fg, bg = colors.file },
            },
            command = {
                a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
                b = { fg = colors.fg, bg = colors.git },
                c = { fg = colors.fg, bg = colors.file },
            },
            inactive = {
                a = { fg = colors.fg, bg = colors.bg },
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
        }

        lualine.setup({
            options = {
                theme = theme,
                icons_enabled = true,

                component_separators = {
                    left = "",
                    right = "",
                },

                section_separators = {
                    left = " ",
                    right = " ",
                },

                globalstatus = true,
            },

            sections = {
                lualine_a = {
                    "mode",
                },

                lualine_b = {
                    "branch",
                    "diff",
                },

                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                },

                lualine_x = {
                    "diagnostics",
                    "filetype",
                },

                lualine_y = {
                    "progress",
                },

                lualine_z = {
                    "location",
                },
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                },
                lualine_x = {
                    "location",
                },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
