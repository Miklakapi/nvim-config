return {
    "tpope/vim-fugitive",
    cmd = {
        "Git",
        "G",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GRename",
        "GDelete",
        "GRemove",
        "GBrowse",
    },
    keys = {
        {
            "<leader>gs",
            vim.cmd.Git,
            desc = "Git status",
        },
        {
            "<leader>gb",
            function()
                vim.cmd("Git blame")
            end,
            desc = "Git blame",
        },
        {
            "<leader>gd",
            function()
                vim.cmd("Gdiffsplit")
            end,
            desc = "Git diff split",
        },
        {
            "<leader>gp",
            function()
                vim.cmd("Git push")
            end,
            desc = "Git push",
        },
        {
            "<leader>gl",
            function()
                vim.cmd("Git pull")
            end,
            desc = "Git pull",
        },
    },
}
