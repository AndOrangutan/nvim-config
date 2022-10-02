
local wk = require("which-key")

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())

require("nvim-autopairs").setup({
    disable_filetype = { "fzf" },
    enable_check_bracket_line = true,
    check_ts = true,
    fast_wrap = {},
})

wk.register({
    ["<M-e>"] = { "Autopairs Fastwrap" },
})


local npairs = require'nvim-autopairs'
local Rule   = require'nvim-autopairs.rule'
local endwise = require('nvim-autopairs.ts-rule').endwise

npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']'),
-- 'then$' is a lua regex
-- 'end' is a match pair
-- 'lua' is a filetype
-- 'if_statement' is a treesitter name. set it = nil to skip check with treesitter
    endwise('then$', 'end', 'lua', 'if_statement')
}
