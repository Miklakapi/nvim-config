return {
    "lewis6991/gitsigns.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local gitsigns = require("gitsigns")

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
        })
    end,
}
