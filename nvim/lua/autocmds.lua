-- create group to assign commands
-- clear = true must be set to prevent loading an auto-command repeatedly every time a file is resourced
local aucmd_group = vim.api.nvim_create_augroup("custom au-commands", { clear = true })

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "autoformat Python files after saving using black",
    callback = function()
        local fn = vim.api.nvim_buf_get_name(0)
        vim.cmd(':silent exec "!black ' .. fn .. '"')
    end,
    group = aucmd_group,
})

--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    --pattern = { "*.cs" },
    --desc = "autoformat C# files after saving using csharpier",
    --callback = function()
        --local fn = vim.api.nvim_buf_get_name(0)
        --vim.cmd(':silent exec "!dotnet-csharpier ' .. fn .. '"')
    --end,
    --group = aucmd_group,
--})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.cxx", "*.hxx" },
    desc = "autoformat C++ files after saving using clang-format",
    callback = function()
        local style = ""

        if file_exists(".clang-format") then
            style = "file:.clang-format"
        elseif file_exists("../.clang-format") then
            style = "file:../.clang-format"
        end

        if style ~= "" then
            local fn = vim.api.nvim_buf_get_name(0)
            vim.cmd(':silent exec "!clang-format -i -style=' .. style .. ' ' .. fn .. '"')
        end
    end,
    group = aucmd_group,
})
