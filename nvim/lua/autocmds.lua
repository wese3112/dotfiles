-- create group to assign commands
-- clear = true must be set to prevent loading an auto-command repeatedly every time a file is resourced
local aucmd_group = vim.api.nvim_create_augroup("custom au-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "autoformat Python files after saving using black",
    callback = function()
        local fn = vim.api.nvim_buf_get_name(0)
        vim.cmd(':silent exec "!black ' .. fn .. '"')
    end,
    group = aucmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.cs" },
    desc = "autoformat C# files after saving using csharpier",
    callback = function()
        local fn = vim.api.nvim_buf_get_name(0)
        vim.cmd(':silent exec "!dotnet-csharpier ' .. fn .. '"')
    end,
    group = aucmd_group,
})
