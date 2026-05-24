return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    event = {
        "BufReadPost",
        "BufNewFile",
    },
    keys = {
        {
            "<leader>tc",
            function()
                require("treesitter-context").toggle()
            end,
            desc = "Toggle Treesitter context",
        },
    },
    opts = {
        enable = true,
        max_lines = 3,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 1,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
    },
}
