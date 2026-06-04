local keymap = vim.keymap.set

keymap("n", "<leader>pv", vim.cmd.Ex, {
    desc = "Open file explorer",
})

keymap("n", "<C-d>", "<C-d>zz", {
    desc = "Scroll down and center",
})

keymap("n", "<C-u>", "<C-u>zz", {
    desc = "Scroll up and center",
})

keymap("n", "<C-j>", vim.cmd.cnext, {
    desc = "Next quickfix item",
})

keymap("n", "<C-k>", vim.cmd.cprev, {
    desc = "Previous quickfix item",
})

keymap("n", "n", "nzzzv", {
    desc = "Next search result centered",
})

keymap("n", "N", "Nzzzv", {
    desc = "Previous search result centered",
})

keymap("v", "J", ":m '>+1<CR>gv=gv", {
    desc = "Move selected lines down",
})

keymap("v", "K", ":m '<-2<CR>gv=gv", {
    desc = "Move selected lines up",
})

keymap("n", "Y", [["+yy]], {
    desc = "Yank line to system clipboard",
})

keymap("v", "Y", [["+y]], {
    desc = "Yank selection to system clipboard",
})

keymap("n", "<C-f>", "<cmd>silent !tmux neww tmuxs<CR>", {
    desc = "Open tmux session picker"
})

keymap("n", "<leader>pr", function()
    vim.cmd("write")
    vim.cmd("source %")
    vim.cmd("Lazy reload lualine.nvim")
    vim.notify("Plugins reloaded", vim.log.levels.INFO)
end, {
    desc = "Reload current plugin config",
})
