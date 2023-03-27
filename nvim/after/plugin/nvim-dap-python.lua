local ok_dap, dap = pcall(require, "dap")
local ok, dappython = pcall(require, "dap-python")
if (not ok) or (not ok_dap) then
  return
end
local python_path = ""
if vim.loop.os_uname().sysname == 'Linux' then
  python_path = "/home/pranav/miniconda3/bin/python"
  -- python_path = "/home/anaconda3/bin/python"
else
  python_path = "C:\\Users\\kumaa\\miniconda3\\python.exe"
end
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return python_path
    end;
  },
}
dappython.setup(python_path)
-- dappython.test_runner = 'pytest'
