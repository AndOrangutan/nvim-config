local M = {}

function M.pequire(req, err)
    local plugin_status, _ = pcall(require, req)
    if not plugin_status then
        -- not loaded
        if err then
            vim.notify(err, "error")
        else
            vim.notify("Something broke in '" .. req .. "' ¯\\_(ツ)_/¯", "error")
        end
    end
    return _
end


--lua/code_action_utils.lua

local lsp_util = vim.lsp.util

function M.code_action_listener()
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = lsp_util.make_range_params()
  params.context = context
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, result)
    -- do something with result - e.g. check if empty and show some indication such as a sign
  end)
end

return M
