vim.keymap.set("n", "<C-v>", "<Esc>pi")
vim.keymap.set("i", "<C-v>", "<Esc>pi")
vim.keymap.set("n", "<C-q>", vim.cmd.close)
vim.keymap.set("i", "<C-q>", vim.cmd.close)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>rc", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>rv", [[:s/\%V\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-z>", "<cmd>e#<CR>")
vim.keymap.set("i", "<C-z>", "<cmd>e#<CR>")

vim.keymap.set("n", "tn", ":$tabnew<CR>")
vim.keymap.set("n", "tc", ":tabclose<CR>")
vim.keymap.set("n", "to", ":tabonly<CR>")
vim.keymap.set("n", "tl", ":tabn<CR>")
vim.keymap.set("n", "th", ":tabp<CR>")
-- move current tab to previous position
vim.keymap.set("n", "<leader>th", ":-tabmove<CR>")
-- move current tab to next position
vim.keymap.set("n", "<leader>tl", ":+tabmove<CR>")

vim.keymap.set("n", "<leader>z", "<C-^>")
