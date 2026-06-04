return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
        local lualine = require("lualine")

        local colors = {
            bg = "#0f1117",
            fg = "#e6edf3",

            cyan = "#00bcd4",
            cyan_dark = "#12343b",

            amber = "#ffb454",
            amber_dark = "#3a2a13",

            pink = "#ff4d8d",
            pink_dark = "#3a1729",

            purple = "#b48ead",
            purple_dark = "#2d2335",

            red = "#ff5c7a",
            red_dark = "#3a1720",

            diff_add = "#a6e3a1",
            diff_change = "#ffb454",
            diff_delete = "#ff5c7a",

            file = "#181825",
            inactive = "#6f7785",
        }

        local theme = {
            normal = {
                a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
                b = { fg = colors.cyan, bg = colors.cyan_dark },
                c = { fg = colors.fg, bg = colors.file },
            },
            insert = {
                a = { fg = colors.bg, bg = colors.amber, gui = "bold" },
                b = { fg = colors.amber, bg = colors.amber_dark },
                c = { fg = colors.fg, bg = colors.file },
            },
            visual = {
                a = { fg = colors.bg, bg = colors.pink, gui = "bold" },
                b = { fg = colors.pink, bg = colors.pink_dark },
                c = { fg = colors.fg, bg = colors.file },
            },
            replace = {
                a = { fg = colors.bg, bg = colors.red, gui = "bold" },
                b = { fg = colors.red, bg = colors.red_dark },
                c = { fg = colors.fg, bg = colors.file },
            },
            command = {
                a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
                b = { fg = colors.purple, bg = colors.purple_dark },
                c = { fg = colors.fg, bg = colors.file },
            },
            inactive = {
                a = { fg = colors.inactive, bg = colors.bg },
                b = { fg = colors.inactive, bg = colors.bg },
                c = { fg = colors.inactive, bg = colors.bg },
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
                    {
                        "diff",
                        colored = true,
                        diff_color = {
                            added = {
                                fg = colors.diff_add,
                            },
                            modified = {
                                fg = colors.diff_change,
                            },
                            removed = {
                                fg = colors.diff_delete,
                            },
                        },
                    },
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
