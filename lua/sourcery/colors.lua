local util = require("sourcery.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("sourcery.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",

    dark0  = "#292f3a",
    dark1  = "#2e3440", -- background
    dark2  = "#343346",
    dark3  = "#3e3d50",
    dark4  = "#494859",
    dark5  = "#545363",
    dark6  = "#5f5e6d",

   light0  = "#eaeaec",
   light1  = "#dfdfe2",
   light2  = "#d4d4d8",
   light3  = "#cac9ce",
   light4  = "#b4b4bb",
   light5  = "#a9a9b1",
   light6  = "#696977",

    black    =  "#29283c",
    red      =  "#eca8a8",
    green    =  "#ccd389",
    yellow   =  "#efd5a0",
    blue     =  "#a5c6e1",
    purple   =  "#e1bee9",
    cyan     =  "#c7ebe6",
    white    =  "#bbbbcb",
    gray     =  "#C5C8C6",

    light_black    =  "#2e2e3f",
    light_red      =  "#ffc4c4",
    light_green    =  "#eff6ab",
    light_yellow   =  "#ffe6b5",
    light_blue     =  "#c9e6fd",
    light_purple   =  "#f7d7ff",
    light_cyan     =  "#ddfcf8",
    light_white    =  "#e1e1ef",
    light_gray     =  "#E6EAE8",

    faded_red         = "#ec8989",
    faded_green       = "#c9d36a",
    faded_yellow      = "#ceb581",
    faded_blue        = "#8abae1",
    faded_purple      = "#db9fe9",
    faded_aqua        = "#abebe2",
    faded_orange      = "#E69E83",

    comment_gray = "#7e848f",
    selection_gray = "#3e4452",
    indentline_gray = "#3a4049",
    colorcolumn_gray = "#232323",
  }

  util.bg = colors.dark1
  colors.bg_dark = colors.dark1
  colors.bg = colors.dark1
  colors.fg = colors.light1
  colors.fg_dark = colors.light0

  colors.diff = {
    add = util.darken(colors.green, 0.15),
    delete = util.darken(colors.red, 0.15),
    change = util.darken(colors.blue, 0.15),
    text = colors.blue,
  }
  colors.gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" }
  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" }

  colors.git.ignore = colors.dark4
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = (config.transparentSidebar and colors.none) or config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = util.darken(colors.blue, 0.7)
  colors.bg_search = colors.blue
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.faded_green

  util.color_overrides(colors, config)

  return colors
end

return M
