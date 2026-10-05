-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

return {
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
    },
    disabled_filetypes = {
      statusline = { "NvimTree" },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "mode",
        fmt = string.upper,
        color = { fg = colors.magenta, bg = colors.bg, gui = "bold" },
      },
      {
        "filename",
        color = { gui = "bold" },
        path = 1,
        padding = { right = 1 },
        fmt = function(name)
          if vim.b.startup_scratch then
            return "[No Name]"
          end
          return name
        end,
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.orange },
        },
        padding = { right = 1 },
      },
      {
        "branch",
        icon = "",
        padding = { right = 1 },
        fmt = function(name)
          if name == "master" or name == "main" or name == "" then
            return ""
          end
          return name
        end,
      },
      {
        -- LSP client name
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if next(clients) == nil then
            return "No LSP"
          end
          return clients[1].name
        end,
        icon = "",
        color = { fg = colors.green, gui = "bold" },
        padding = { right = 1 },
      },
      {
        "location",
        color = { fg = colors.orange, gui = "bold" },
        padding = { right = 1 },
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 1,
        colors = { gui = "bold" },
        color = { link = "LineNr" },
        fmt = function(name)
          if vim.b.startup_scratch then
            return "Scratch"
          end
          return name
        end,
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
