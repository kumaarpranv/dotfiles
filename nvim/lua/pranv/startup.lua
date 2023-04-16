vim.opt.termguicolors = true

local ok, _ = pcall(require, "impatient")
if not ok then
  return
end

local startupGrp = vim.api.nvim_create_augroup("startup", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  -- command = "silent! lua vim.highlight.on_yank()",
  callback = function()
    local curbufnr = vim.api.nvim_get_current_buf()
    local buflist = vim.api.nvim_list_bufs()
    for i, bufnr in ipairs(buflist) do
      if #(buflist)-(i+1) <= 4 then
        break
      end
      if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then -- nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_is_valid(v)
        vim.api.nvim_buf_delete(bufnr, {})
        -- vim.cmd('bd ' .. tostring(bufnr))
      end
    end
  end,
  group = startupGrp,
})

require('pranv.utils.tabby')
require('pranv.lsp.lsp')
require('pranv.lsp.treesitter')
