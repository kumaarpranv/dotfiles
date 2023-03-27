local ok, dap = pcall(require, "dap")
if not ok then
  return
end

local lldb_path = "/usr/bin/lldb-vscode" -- adjust as needed
local os_name = vim.loop.os_uname().sysname
if os_name  == "Linux" then
  lldb_path = "/usr/bin/lldb-vscode" -- adjust as needed
elseif os_name == "Windows_NT" then 
  lldb_path = "C:\\Users\\kumaa\\.vscode\\extensions\\vadimcn.vscode-lldb-1.8.1\\lldb\\bin\\lldb" -- adjust as needed
end

dap.adapters.lldb = {
	type = "executable",
	command = lldb_path, -- adjust as needed
	name = "lldb",
}

local lldb = {
	name = "Launch lldb",
	type = "lldb", -- matches the adapter
	request = "launch", -- could also attach to a currently running process
	program = function()
		return vim.fn.input(
			"Path to executable: ",
			vim.fn.getcwd() .. "/",
			"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

dap.configurations.rust = {
	lldb -- different debuggers or more configurations can be used here
}

vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>d,", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>d.", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>d/", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>d,", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>d.", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>d/", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
