local keymap = vim.keymap.set
local scroll_lines = 15

keymap("n", "<leader>pv", vim.cmd.Ex, {
    desc = "Open file explorer",
})

keymap("n", "<C-d>", scroll_lines .. "jzz", {
    desc = "Move down and center",
})

keymap("n", "<C-u>", scroll_lines .. "kzz", {
    desc = "Move up and center",
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

keymap("n", "{", function()
    vim.cmd.normal({ "}", bang = true })
end, {
    silent = true,
    desc = "Next paragraph",
})

keymap("n", "}", function()
    vim.cmd.normal({ "{", bang = true })
end, {
    silent = true,
    desc = "Previous paragraph",
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

keymap("n", "<C-f>", function()
    vim.fn.jobstart({ "tmux", "new-window", "tmuxs" }, {
        detach = true,
    })
end, {
    desc = "Open tmux session picker",
})
