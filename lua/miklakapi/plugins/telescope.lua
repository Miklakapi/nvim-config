return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "<leader>pf",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>pb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Find buffers",
        },
        {
            "<C-p>",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Find git files",
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({})
    end,
}
