local local_plugin_path = vim.fn.expand("~/Code/personal/nvim-docker")
local use_local_plugin = vim.fn.isdirectory(local_plugin_path) == 1

local plugin_config = function()
    require("docker").setup({
        window = {
            width = 0.9,
            height = 0.85,
            containers_width = 0.35,
        },

        logs = {
            tail = 200,
            auto_select = true,
        },

        status_icons = {
            running = "󰡨",
            restarting = "󰑐",
            stopped = "󰝤",
            failed = "󰅖",
            unknown = "󰋗",
        },

        status_highlights = {
            running = "DiagnosticOk",
            restarting = "DiagnosticWarn",
            stopped = "Comment",
            failed = "DiagnosticError",
            unknown = "DiagnosticInfo",
        },
    })

    vim.keymap.set("n", "<leader>d", "<cmd>Docker<cr>", {
        desc = "Open Docker containers",
    })

    vim.keymap.set("n", "<leader>D", "<cmd>DockerCompose<cr>", {
        desc = "Open Docker Compose containers",
    })
end

if use_local_plugin then
    return {
        dir = local_plugin_path,
        name = "nvim-docker",
        config = plugin_config,
    }
end

return {
    "Miklakapi/nvim-docker",
    config = plugin_config,
}
