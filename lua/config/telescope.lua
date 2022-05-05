local pequire = require("utils").pequire
local wk = pequire("which-key")

--local actions = pequire("telescope.actions")
--local actions_layout = pequire("telescope.actions.layout")
local telescope = pequire("telescope")
--local builtin = require("telescope.builtins")

telescope.load_extension('fzf')
telescope.load_extension('media_files')

telescope.setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        --vimgrep_arguments = {
        --    "rg",
        --    "--color=never",
        --    "--no-heading",
        --    "--with-filename",
        --    "--line_number",
        --    "--column",
        --    "--smart-case",
        --},
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },

    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg",
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

wk.register({
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>ff"] = {"<cmd>lua require'config.telescope'.project_files()<cr>", "Telescope: Find File"},
    ["<leader>fg"] = {"<cmd>Telescope live_grep hidden=true<cr>", "Telescope: Live Grep"},
    ["<leader>fb"] = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Telescope: Buffers"},
    ["<leader>fh"] = {"<cmd>lua require('telescope.builtin').help_tags()<cr>", "Telescope: Help Tags"},
    ["<leader>fm"] = {"<cmd>lua require('telescope').load_extension('media_files')<cr>", "Telescope: Media Files"},
    ["<leader>fd"] = {"<cmd>lua require('telescope').extensions.dict.synonyms()<cr>", "Telescope: Dictionary"},
}, {})

local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

return M

