require("tokyonight").setup {
  style = "moon", -- styles: storm, moon, night, day
  transparent = false, -- true skips setting the background color
  terminal_colors = true, -- colors for :terminal
  styles = {
    -- style per syntax group
    -- any valid attr-list value, `:help attr-list`
    comments = { italic = true },
    keywords = { italic = true },
    -- functions = "NONE",
    -- variables = "NONE",
    -- background style: "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- darker background on sidebar-like windows
  day_brightness = 0.3, -- day style brightness, 0 to 1
  hide_inactive_statusline = false, -- replace inactive statuslines with a thin border
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- bold section headers in the lualine theme
}
