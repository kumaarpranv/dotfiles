local ok, dapgo = pcall(require, "dap-go")
if not ok then
  return
end

vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

dapgo.setup({
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
})

