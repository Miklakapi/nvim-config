local function find_project_files()
    require("telescope.builtin").find_files({
        find_command = {
            "fd",
            "--type",
            "f",
            "--hidden",
            "--follow",
            "--exclude",
            ".git",
        },
    })
end

local function grep_project_files()
    require("telescope.builtin").live_grep({
        additional_args = function()
            return {
                "--hidden",
                "--follow",
                "--glob",
                "!**/.git/**",
            }
        end,
    })
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "<leader>pf",
            find_project_files,
            desc = "Find files",
        },
        {
            "<leader>ps",
            grep_project_files,
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
