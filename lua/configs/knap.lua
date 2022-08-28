local wk = require("which-key")

local gknapsettings = {

    --textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
    --textopdfviewerrefres = "none",
    --textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"

    mdoutputext = "pdf",
    mdtopdf = "pandoc %docroot% -o %outputfile%",
    mdtopdfviewerlaunch = "zathura %ouputfile%",
    mdtopdfciewerrefresh = "none",

    markdownoutputext = "pdf",
    markdowntopdf = "pandoc %docroot% -o %outputfile%",
    markdowntopdfviewerlaunch = "zathura %ouputfile%",
    markdowntopdfciewerrefresh = "none",





    delay = 250,

}

vim.g.knap_settings = gknapsettings

wk.register({
    ["<F5>"] = { function() require("knap").process_once() end, "Knap Process Once"},
    ["<F6>"] = { function() require("knap").close_viewer() end, "Knap Close Viewer"},
    ["<F7>"] = { function() require("knap").toggle_autopreviewing() end, "Knap Toggle Autoprevewing"},
    ["<F8>"] = { function() require("knap").forward_jump() end, "Knap Forward Jump"},
}, { mode =  "n" })


