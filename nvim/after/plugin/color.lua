--vim.g.tokyonight_transparent_sidebar = true
--vim.g.tokyonight_transparent = true
vim.opt.background = "dark"
local ok, nightfox = pcall(require, "nightfox")
if (not ok) then
  return
end

nightfox.setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "bold",
      conditionals = "bold",
      functions = "bold",
      constants = "bold",
    }
  }
})
vim.cmd.colorscheme("nightfox")
