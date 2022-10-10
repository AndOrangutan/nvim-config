local wk = require("which-key")

vim.cmd[[autocmd BufUnload * lua if (vim.b.knap_viewerpid) then os.execute("pkill -f live-server") end]]

local gknapsettings = {

    mdoutputext = "html",

    mdtohtml = "pandoc %docroot% -o %outputfile% --standalone --template=easy_template.html --toc",
    mdtohtmlviewerlaunch = "live-server --quiet --browser=qutebrowser --open=%outputfile% --watch=%outputfile% --wait=1000",
    htmltohtmlviewerlaunch = "live-server --quiet --browser=qutebrowser --open=%outputfile% --watch=%outputfile% --wait=800",

    htmltohtmlviewerrefresh = "none",
    mdtohtmlbufferasstdin = true,
    mdtohtmlviewerrefresh = "none",




    --htmltohtml = "A=%outputfile% ; B=\"${A%.html}-preview.html\" ; sed 's/<\\/head>/<meta http-equiv=\"refresh\" content=\"1\" ><\\/head>/' \"$A\" > \"$B\"",
    --htmltohtmlviewerlaunch": "A=%outputfile% ; B=\"${A%.html}-preview.html\" ; firefox \"$B\"",
    --htmltohtmlviewerrefresh": "none",
    --mdtohtml": "A=%outputfile% ; B=\"${A%.html}-preview.html\" ; pandoc --standalone %docroot% -o \"$A\" && sed 's/<\\/head>/<meta http-equiv=\"refresh\" content=\"1\" ><\\/head>/' \"$A\" > \"$B\" ",
    --mdtohtmlviewerlaunch": "A=%outputfile% ; firefox \"${A%.html}-preview.html\"",
    --mdtohtmlviewerrefresh": "none",

    mdtopdf = "pandoc -f markdown --standalone -o %outputfile% --template eisvogel.tex --pdf-engine=xelatex -V 'monofont:Fantasque Sans Mono'",
    mdtopdfviewerlaunch = "zathura %outputfile%",
    mdtopdfviewerrefresh = "none",
    mdtopdfbufferasstdin = true,

    delay = 100,
}

vim.g.knap_settings = gknapsettings

wk.register({
    ["<F5>"] = { function() require("knap").process_once() end, "Knap Process Once"},
    ["<F6>"] = { function() require("knap").close_viewer() end, "Knap Close Viewer"},
    ["<F7>"] = { function() require("knap").toggle_autopreviewing() end, "Knap Toggle Autoprevewing"},
    ["<F8>"] = { function() require("knap").forward_jump() end, "Knap Forward Jump"},
}, { mode =  "n", silent = false })


