local pequire = require("utils").pequire

local parser_configs = pequire('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}
parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}
parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

pequire'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",
--        {
--        "bash",
--        "bibtex",
--        "c",
--        "c_sharp",
--        "clojure",
--        "cmake",
--        "comment",
--        "commonlisp",
--        "cpp",
--        "css",
--        "cuda",
--        "dockerfile",
--        "fennel",
--        --"gdscript",
--        "go",
--        --"gdresource",
--        "graphql",
--        "html",
--        "java",
--        "javascript",
--        "json",
--        "kotlin",
--        "latex",
--        "lua",
--        "make",
--        "markdown",
--        "norg",
--        "norg_meta",
--        "norg_table",
--        "perl",
--        "php",
--        "python",
--        "r",
--        "regex",
--        "ruby",
--        "rust",
--        "toml",
--        "typescript",
--        "vim",
--        "yaml",
--    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    additional_vim_regex_highlighting = true,

    -- List of parsers to ignore installing
    ignore_install = { "swift" },

    highlight = { -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        --disable = { "c", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = {"markdown", "tex"},
    },
    indent = {
        enable = true
    },
}

