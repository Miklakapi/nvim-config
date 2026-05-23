return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        local treesitter = require("nvim-treesitter")

        local languages = {
            "lua",
            "vim",
            "vimdoc",
            "javascript",
            "typescript",
            "tsx",
            "vue",
            "php",
            "html",
            "css",
            "scss",
            "json",
            "yaml",
            "python",
            "bash",
            "markdown",
            "markdown_inline",
            "go",
            "gomod",
            "gosum",
            "gowork",
        }

        treesitter.setup()

        treesitter.install(languages)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
