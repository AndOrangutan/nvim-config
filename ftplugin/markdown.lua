--local pequire = require("utils").pequire
local wk = require("which-key")



vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true

vim.g.markdown_fenced_langueges = {'html', 'python', 'lua', 'vim', 'typescript', 'bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'css', 'rust', 'sql'}



--nnoremap("<leader>s", "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle")

--vim.cmd[[
--set breakindent breakindentopt=sbr,list:-1 linebreak
--" this should be set up per filetype probably
--let &formatlistpat = '^line\s\+\d\+:\s*'
--]]


vim.api.nvim_create_user_command(
    "ZkNewTest",
    function (opts)
        vim.ui.input({ prompt = "Path: ", completion = "file" }, function (input) print(input) end)
    end,
    {}
)


wk.register({
    -- Intuitive movement key
    ["<c-p>"] = { "<cmd>PasteImg<cr>", ".md Paste Image" },
    --["j"] = { "gj", ".md Wrap [J]ump" },
    --["k"] = { "gk", ".md Wrap [K]ick" },
    ["^"] = { "g^", ".md Wrap Start" },
    ["0"] = { "g0", ".md Wrap Beginning" },
    ["$"] = { "g$", ".md Wrap End" },

    -- Zk
    ["<CR>"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "ZK Follow Link"},

    --["<leader>zn"] = {"<Cmd>ZkNew { dir = vim.fn.input('Subdir: ', '', 'file'), title = vim.fn.input('Title: '),  }<CR>", "[z]K [n]ew"},
    ["<leader>zs"] = { "<cmd>ZkNotes<cr>", "[z]K [s]earch Notes" },
    ["<leader>zn"] = { name = "[z]K [n]ew" },
    ["<leader>znc"] = { function ()
        vim.cmd[[ZkCd]]

        local code = string.lower(vim.fn.input('Class Code: '))
        local ucode = string.upper(code)

        -- Check if nil
        if code == "" then
            vim.notify("ZK: Please include code", "Float")
            return
        elseif vim.fn.isdirectory("classes/"..code) == 0 then
            vim.notify("A directory for "..ucode.." Doesn't Exist.", "Float")
            return
        end

        local title = vim.fn.input('Title: ')

        if title == "" then
            vim.notify("ZK: Please include title", "Float")
            return
        else
            require("zk").new({ dir = 'classes/'..code, title = ucode.." "..title })
        end
    end, "[z]K [n]ew [c]lass Note"},
    ["<leader>znd"] = {"<Cmd>ZkNew { dir = 'career/dailycodingproblem' } <CR>", "[z]K [n]nit [d]ailycodingproblem.com"},
})


