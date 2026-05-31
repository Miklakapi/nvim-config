local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("HighlightYank", {
    clear = true,
})

local miklakapi_group = augroup("Miklakapi", {
    clear = true,
})

local function lsp_keymap(buffer, mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
        buffer = buffer,
        desc = desc,
    })
end

autocmd("TextYankPost", {
    group = yank_group,
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 120,
        })
    end,
})

autocmd("LspAttach", {
    group = miklakapi_group,
    callback = function(event)
        local buffer = event.buf

        lsp_keymap(buffer, "n", "gd", function()
            vim.lsp.buf.definition()
        end, "Go to definition")

        lsp_keymap(buffer, "n", "K", function()
            vim.lsp.buf.hover()
        end, "Show documentation")

        lsp_keymap(buffer, "n", "gr", function()
            vim.lsp.buf.references()
        end, "Show references")

        lsp_keymap(buffer, "n", "vd", function()
            vim.diagnostic.open_float()
        end, "Show line diagnostic")

        lsp_keymap(buffer, "n", "vca", function()
            vim.lsp.buf.code_action()
        end, "Code action")

        lsp_keymap(buffer, "n", "vrn", function()
            vim.lsp.buf.rename()
        end, "Rename symbol")

        lsp_keymap(buffer, "n", "[d", function()
            vim.diagnostic.jump({
                count = 1,
                float = true
            })
        end, "Next diagnostic")

        lsp_keymap(buffer, "n", "]d", function()
            vim.diagnostic.jump({
                count = -1,
                float = true,
            })
        end, "Previous diagnostic")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.opt_local.autoindent = true
    end,
})
