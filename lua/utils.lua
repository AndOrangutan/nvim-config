local M = {}
local cmd = vim.cmd



-- We want to be able to access utils in all our configuration files so we add the module to the _G global variable
_G.utils = M
return M    -- export modules
