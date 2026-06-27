local function get_default_php_path_mappings()
    local project_root = vim.fn.getcwd()

    return {
        ["/builds"] = project_root,
    }
end

local function get_project_dap_path_mappings_file_path()
    local project_root = vim.fn.getcwd()

    return project_root .. "/.mkdev/dap-path-mappings"
end

local function read_project_dap_path_mappings()
    local mappings_file_path = get_project_dap_path_mappings_file_path()

    if vim.fn.filereadable(mappings_file_path) ~= 1 then
        return {}
    end

    local path_mappings = {}

    for _, line in ipairs(vim.fn.readfile(mappings_file_path)) do
        local trimmed_line = vim.fn.trim(line)

        if trimmed_line ~= "" and not vim.startswith(trimmed_line, "#") then
            local container_path, local_path = trimmed_line:match("^([^=]+)%s*=%s*(.+)$")

            if container_path ~= nil and local_path ~= nil then
                container_path = vim.fn.trim(container_path)
                local_path = vim.fn.trim(local_path)

                path_mappings[container_path] = local_path
            end
        end
    end

    return path_mappings
end

local function merge_tables(base_table, override_table)
    local result = vim.deepcopy(base_table)

    for key, value in pairs(override_table) do
        result[key] = value
    end

    return result
end

local function get_php_path_mappings()
    local default_path_mappings = get_default_php_path_mappings()
    local project_path_mappings = read_project_dap_path_mappings()

    return merge_tables(default_path_mappings, project_path_mappings)
end

return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            ---@type any
            local dap = require("dap")

            dap.adapters.php = {
                type = "executable",
                command = "node",
                args = {
                    vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
                },
            }

            dap.configurations.php = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for Xdebug",
                    port = 9003,
                    pathMappings = get_php_path_mappings(),
                },
            }

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
                desc = "Toggle debug breakpoint",
            })

            vim.keymap.set("n", "<leader>dc", dap.continue, {
                desc = "Debug continue",
            })

            vim.keymap.set("n", "<leader>do", dap.step_over, {
                desc = "Debug step over",
            })

            vim.keymap.set("n", "<leader>di", dap.step_into, {
                desc = "Debug step into",
            })

            vim.keymap.set("n", "<leader>dO", dap.step_out, {
                desc = "Debug step out",
            })

            vim.keymap.set("n", "<leader>dr", dap.repl.open, {
                desc = "Debug REPL",
            })

            vim.keymap.set("n", "<leader>dt", dap.terminate, {
                desc = "Debug terminate",
            })
        end,
    },
}
