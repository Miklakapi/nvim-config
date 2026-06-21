local local_plugin_path = vim.fn.expand("~/Code/personal/nvim-multi-repo")
local use_local_plugin = vim.fn.isdirectory(local_plugin_path) == 1

local plugin_config = function()
    require("multi_repo").setup({
        on_select = function(repository)
            vim.cmd("topleft new")

            local temporary_window = vim.api.nvim_get_current_win()

            vim.cmd("lcd " .. vim.fn.fnameescape(repository.git_root))
            vim.cmd("Git")

            if vim.api.nvim_win_is_valid(temporary_window) then
                vim.api.nvim_win_close(temporary_window, true)
            end
        end,
    })

    vim.keymap.set("n", "<leader>pr", "<cmd>MultiRepo<cr>", {
        desc = "Open project repositories",
    })
end

if use_local_plugin then
    return {
        dir = local_plugin_path,
        name = "nvim-multi-repo",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
        },
        config = plugin_config,
    }
end

return {
    "Miklakapi/nvim-multi-repo",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "tpope/vim-fugitive",
    },
    config = plugin_config,
}
