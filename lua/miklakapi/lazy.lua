local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local lazy_exists = (vim.uv or vim.loop).fs_stat(lazypath) ~= nil

if not lazy_exists then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"

    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            import = "miklakapi.plugins",
        },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})
