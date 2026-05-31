return {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode").setup({
            transparent = true,
            italic_comments = true,
            disable_nvimtree_bg = true,
            terminal_colors = true,
        })

        vim.cmd.colorscheme("vscode")
    end,
}
