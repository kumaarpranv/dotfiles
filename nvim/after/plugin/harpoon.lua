local ok, harpoon = pcall(require, "harpoon")
if not ok then
    return
end

harpoon.setup({})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>q", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader><Right>", ui.nav_next)
vim.keymap.set("n", "<leader><Left>", ui.nav_prev)
