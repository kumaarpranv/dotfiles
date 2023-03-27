local ok, autosession = pcall(require, "auto-session")
if not ok then
  return
end

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
autosession.setup {
  log_level = "error",
  auto_session_enable_last_session=true,
  cwd_change_handling = {
    restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
    pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    end,
  },
}

vim.keymap.set("n", "<leader>s", "<cmd>SaveSession<CR>")
vim.keymap.set("n", "<leader>sr", "<cmd>RestoreSession<CR>")
vim.keymap.set("n", "<leader>ss", "<cmd>SearchSession<CR>")
vim.keymap.set("n", "<leader>sd", "<cmd>Autosession delete<CR>")
