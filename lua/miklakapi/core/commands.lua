local function get_downloads_dir()
    return vim.fn.expand("~/Downloads")
end

local function get_current_file_path()
    return vim.fn.expand("%:p")
end

local function copy_current_file_to_downloads()
    local source_path = get_current_file_path()
    local downloads_dir = get_downloads_dir()

    if source_path == "" then
        vim.notify("Current buffer is not associated with a file.", vim.log.levels.WARN)
        return
    end

    if vim.fn.filereadable(source_path) == 0 then
        vim.notify("Current file does not exist on disk.", vim.log.levels.ERROR)
        return
    end

    if vim.fn.isdirectory(downloads_dir) == 0 then
        vim.notify("Downloads directory not found: " .. downloads_dir, vim.log.levels.ERROR)
        return
    end

    local filename = vim.fn.fnamemodify(source_path, ":t")
    local target_path = downloads_dir .. "/" .. filename

    if vim.fn.filereadable(target_path) == 1 then
        vim.notify("File already exists, not overwriting: " .. target_path, vim.log.levels.WARN)
        return
    end

    local file_content = vim.fn.readfile(source_path, "b")
    local copy_result = vim.fn.writefile(file_content, target_path, "b")

    if copy_result ~= 0 then
        vim.notify("Failed to copy file to: " .. target_path, vim.log.levels.ERROR)
        return
    end

    vim.notify("Copied current file to: " .. target_path, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("Download", function()
    copy_current_file_to_downloads()
end, {
    desc = "Copy current file to ~/Downloads",
})
