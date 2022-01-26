local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local telescope = require("telescope")
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
        mappings = {
            n = {
                ["<M-p>"] = actions_layout.toggle_preview,
            },
            i = {
                ["<esc>"] = actions.close,
                ["<M-p>"] = actions_layout.toggle_preview,
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
            }
        },
        --vimgrep_arguments = {
        --    "rg",
        --    "--color=never",
        --    "--no-heading",
        --    "--with-filename",
        --    "--line_number",
        --    "--column",
        --    "--smart-case",
        --    "--trim",
        --    "-u"
        --},

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


MAPX.nname("<leader>f", "Telescope")
--nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_file()<cr>", "Telescope: Find File")
nnoremap("<leader>ff", "<cmd>lua require'config.telescope'.project_files()<cr>", "Telescope: Find File")
nnoremap("<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>", "Telescope: Live Grep")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", "Telescope: Buffers")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Telescope: Help Tags")
nnoremap("<leader>fm", "<cmd>lua require('telescope').load_extension('media_files')<cr>", "Telescope: Media Files")


local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

return M

