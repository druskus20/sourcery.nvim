local util = require("sourcery.util")
local theme = require("sourcery.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
