require ("themes.onedark")
require ("themes.catppuccin")
--require ("themes.tokyonight")

-- cursor color: #61AFEF
--local colorscheme = "catppuccin"
--local colorscheme = "onedark"
local colorscheme = "tokyonight"

-- local colorscheme = "darkplus"
-- local colorscheme = "github_light"
-- require "user.conf.github-nvim-theme"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- if colorscheme == "onedark" then
--   require "user.themes.onedark"
-- elseif colorscheme == "catppuccin" then
--   require "user.themes.catppuccin"
-- end
