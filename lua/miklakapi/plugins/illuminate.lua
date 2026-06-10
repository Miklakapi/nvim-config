return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            delay = 100,
            under_cursor = true,
            large_file_cutoff = 10000,
            min_count_to_highlight = 2,
        })

        vim.api.nvim_set_hl(0, "IlluminatedWordText", {
            underline = true,
        })

        vim.api.nvim_set_hl(0, "IlluminatedWordRead", {
            underline = true,
        })

        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {
            underline = true,
        })
    end,
}
