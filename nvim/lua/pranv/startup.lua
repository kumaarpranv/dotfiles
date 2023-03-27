vim.opt.termguicolors = true

local ok, _ = pcall(require, "impatient")
if not ok then
  return
end

require('pranv.utils.tabby')
require('pranv.lsp.lsp')
require('pranv.lsp.treesitter')
