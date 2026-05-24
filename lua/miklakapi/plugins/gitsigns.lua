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

        gitsigns.setup({
            signs = {
                add = {
                    text = "+",
                },
                change = {
                    text = "~",
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
    end,
}
