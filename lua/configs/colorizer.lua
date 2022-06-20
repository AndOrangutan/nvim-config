
require("colorizer").setup({
    '*',
    css = {
        css     = true,
        names   = true,
    },
    html = {
        css     = true,
        names   = true,
    },
    '!vim',
}, {
    RGB     = true,
    RRGGBB  = true,
    names   = false,
    RRGGBBAA= true,
    rgb_fn  = true,
    mode    = 'background'
})
