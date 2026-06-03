return {
    "lewis6991/gitsigns.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local gitsigns = require("gitsigns")

        local function map(buffer, mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = buffer,
                desc = desc,
            })
        end

        local function setGitsignsColors()
            vim.api.nvim_set_hl(0, "GitSignsAdd", {
                fg = "#50fa7b",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsChange", {
                fg = "#f1fa8c",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsDelete", {
                fg = "#ff5555",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsTopdelete", {
                fg = "#ff5555",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsChangedelete", {
                fg = "#ffb86c",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsUntracked", {
                fg = "#8be9fd",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsStagedAdd", {
                fg = "#50fa7b",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsStagedChange", {
                fg = "#f1fa8c",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsStagedDelete", {
                fg = "#ff5555",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsStagedTopdelete", {
                fg = "#ff5555",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsStagedChangedelete", {
                fg = "#ffb86c",
                bg = "NONE",
            })

            vim.api.nvim_set_hl(0, "GitSignsStagedUntracked", {
                fg = "#8be9fd",
                bg = "NONE",
            })
        end

        local signs = {
            add = {
                text = "┃",
            },
            change = {
                text = "┃",
            },
            delete = {
                text = "_",
            },
            topdelete = {
                text = "‾",
            },
            changedelete = {
                text = "~",
            },
            untracked = {
                text = "┆",
            },
        }

        local signs_staged = {
            add = {
                text = "┃",
            },
            change = {
                text = "┃",
            },
            delete = {
                text = "_",
            },
            topdelete = {
                text = "‾",
            },
            changedelete = {
                text = "~",
            },
            untracked = {
                text = "┆",
            },
        }

        setGitsignsColors()

        gitsigns.setup({
            signs = signs,
            signs_staged = signs_staged,

            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,

            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },

            on_attach = function(buffer)
                map(buffer, "n", "]h", function()
                    gitsigns.next_hunk()
                end, "Next git hunk")

                map(buffer, "n", "[h", function()
                    gitsigns.prev_hunk()
                end, "Previous git hunk")

                map(buffer, "n", "<leader>hp", function()
                    gitsigns.preview_hunk()
                end, "Preview git hunk")

                map(buffer, "n", "<leader>hs", function()
                    gitsigns.stage_hunk()
                end, "Stage git hunk")

                map(buffer, "n", "<leader>hr", function()
                    gitsigns.reset_hunk()
                end, "Reset git hunk")

                map(buffer, "n", "<leader>hS", function()
                    gitsigns.stage_buffer()
                end, "Stage git buffer")

                map(buffer, "n", "<leader>hR", function()
                    gitsigns.reset_buffer()
                end, "Reset git buffer")

                map(buffer, "n", "<leader>hb", function()
                    gitsigns.blame_line({
                        full = true,
                    })
                end, "Blame git line")

                map(buffer, "n", "<leader>hd", function()
                    gitsigns.diffthis()
                end, "Diff git file")
            end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                setGitsignsColors()
            end,
        })
    end,
}
