local ok, dapui = pcall(require, "dapui")
if not ok then
    return
end

vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>")
dapui.setup()
