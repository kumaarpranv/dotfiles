
if vim.loop.os_uname().sysname == 'Windows_NT' then
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-\>]],
    direction = "horizontal",
    hide_numbers = true,
    shade_terminals = true,
    shade_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    close_on_exit = true,
    shell = vim.o.shell, -- change the default shell
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    on_close = function(term)
      vim.cmd [[checktime]]
    end,
})

local Terminal  = require('toggleterm.terminal').Terminal
local gitui = Terminal:new({ cmd = "gitui", hidden = true, direction="float" })
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction="float" })

_gitui_toggle = function ()
  gitui:toggle()
end
_lazygit_toggle = function ()
  lazygit:toggle()
end
vim.cmd([[autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><leader>\ <Cmd>exe v:count1 . "ToggleTerm"<CR>
" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><leader>\ <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])
vim.keymap.set("n", "<leader>gu", "<cmd>lua _gitui_toggle()<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>")
