local ok, blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

vim.opt.list = true
vim.opt.listchars:append "eol:↴"
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
blankline.setup {
    -- for example, context is off by default, use this to turn it on
    char = "",
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    space_char_blankline = " ",
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
}
