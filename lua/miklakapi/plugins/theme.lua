-- lua/miklakapi/plugins/vscode.lua

return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            compile = false,
            undercurl = true,
            commentStyle = {
                italic = true,
            },
            keywordStyle = {
                italic = false,
            },
            statementStyle = {
                bold = false,
            },
            transparent = true,
            dimInactive = false,
            terminalColors = true,
            theme = "wave",
            background = {
                dark = "wave",
                light = "lotus",
            },
        })

        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
