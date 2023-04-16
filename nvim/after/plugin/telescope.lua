local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local ok, sessionlens = pcall(require, "session-lens")
if not ok then
  return
end

sessionlens.setup {
  path_display = {'shorten'},
  theme = 'ivy', -- default is dropdown
  theme_conf = { border = false },
  previewer = true
}

local actions = require("telescope.actions")

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("project")
telescope.load_extension("session-lens")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>");
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>");
vim.keymap.set("n", "<leader>fgs", "<cmd>Telescope grep_string<CR>");
vim.keymap.set("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>");
vim.keymap.set("n", "<leader>fgg", "<cmd>Telescope git_bcommits<CR>");
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>");
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>");
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>");
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>");
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>");
vim.keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>");
vim.keymap.set("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>");

