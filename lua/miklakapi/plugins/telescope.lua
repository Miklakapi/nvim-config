return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({})

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {
            desc = "Find files",
        })

        vim.keymap.set("n", "<leader>ps", builtin.live_grep, {
            desc = "Live grep",
        })

        vim.keymap.set("n", "<leader>pb", builtin.buffers, {
            desc = "Find buffers",
        })

        vim.keymap.set("n", "<C-p>", builtin.git_files, {
            desc = "Find git files",
        })
    end,
}
