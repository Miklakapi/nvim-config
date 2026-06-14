local keymap = vim.keymap.set
local scroll_lines = 15

local function goToNextQuickfixItem()
    local ok = pcall(vim.cmd.cnext)

    if ok then
        return
    end

    pcall(vim.cmd.cfirst)
end

local function goToPreviousQuickfixItem()
    local ok = pcall(vim.cmd.cprev)

    if ok then
        return
    end

    pcall(vim.cmd.clast)
end

keymap("n", "<leader>pv", vim.cmd.Ex, {
    desc = "Open file explorer",
})

keymap("n", "<C-d>", scroll_lines .. "jzz", {
    desc = "Move down and center",
})

keymap("n", "<C-u>", scroll_lines .. "kzz", {
    desc = "Move up and center",
})

keymap("n", "<C-j>", goToNextQuickfixItem, {
    desc = "Next quickfix item",
})

keymap("n", "<C-k>", goToPreviousQuickfixItem, {
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

keymap("x", "P", [["_dP]], {
    desc = "Paste without yanking replaced selection",
})

keymap("n", "<C-f>", function()
    vim.fn.jobstart({ "tmux", "new-window", "tmuxs" }, {
        detach = true,
    })
end, {
    desc = "Open tmux session picker",
})

keymap("i", "<C-l>", "<Del>", {
    desc = "Delete character after cursor",
})

keymap("i", "<C-b>", "<C-o>dw", {
    desc = "Delete word after cursor",
})
