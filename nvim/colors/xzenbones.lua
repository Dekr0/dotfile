local colors_name = "zenbones_darker"
vim.g.colors_name = colors_name

local lush = require('lush')
local hsluv = lush.hsluv
local palette = require('zenbones.palette')
local util = require('zenbones.util')

local bg = vim.o.background
local palette = util.palette_extend({
    bg = hsluv '#1c1917', -- Cappuccino dark tone
    fg = palette.dark.fg,
    rose = palette.dark.rose,
    leaf = palette.dark.leaf,
    wood = palette.dark.wood,
    water = palette.dark.water,
    blossom = palette.dark.blossom,
    sky = palette.dark.sky,
}, bg)

-- Generate the lush specs using the generator util
local generator = require("zenbones.specs")
local base_specs = generator.generate(
    palette,
    bg,
    generator.get_global_config(colors_name, bg)
)

-- Pass the specs to lush to apply
lush(base_specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
