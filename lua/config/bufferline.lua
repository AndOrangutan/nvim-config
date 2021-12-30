require('bufferline').setup {
    options = {
        numbers = "none",
        middle_mouse_command = nil,                  -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = false,     --| "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
        end,
        offsets = {{filetype = "NvimTree", text = "File Explorer"}},
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = { '', '' }, --"slant" | "thick" | "thin" | { '', '' }`
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'id'
    }
}

--m.nname("<alt>", "Alt")
nnoremap("<M-.>", ":BufferLineCycleNext<CR>", "silent", "Bufferline: Cycle Next Buffer")
nnoremap("<M-,>", ":BufferLineCyclePrev<CR>", "silent", "Bufferline: Cycle Prev Buffer")
nnoremap("<M-char-62>", ":BufferLineMoveNext<CR>", "silent", "Bufferline: Move Next Buffer")
nnoremap("<M-char-60>", ":BufferLineMovePrev<CR>", "silent", "Bufferline: Move Prev Buffer")

