if vim.g.neovide then
  if vim.loop.os_uname().sysname == 'Linux' then
    -- vim.g.neovide_transparency = 0.2
    vim.g.neovide_underline_automatic_scaling = false
    vim.g.neovide_scale_factor = 0.5
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_fullscreen = true
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("pranv")
