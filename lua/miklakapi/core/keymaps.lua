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
