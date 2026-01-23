local colors = require('catppuccin.palettes').get_palette 'macchiato'

return {
  {
    'karb94/neoscroll.nvim',
    event = 'BufEnter',
    opts = {},
  },
  {
    'petertriho/nvim-scrollbar',
    event = 'BufEnter',
    opts = {
      handle = {
        color = colors.surface2,
      },
      marks = {
        Search = { color = colors.peach },
        Error = { color = colors.maroon },
        Warn = { color = colors.yellow },
        Info = { color = colors.sky },
        Hint = { color = colors.lavender },
        Misc = { color = colors.mauve },
      },
      excluded_buftypes = {
        'terminal',
        'nofile',
        'prompt',
        'quickfix',
      },
      excluded_filetypes = {
        'blink-cmp-menu',
        'snacks_picker_list',
        'snacks_dashboard',
      },
      handlers = {
        cursor = false,
        gitsigns = true,
      },
    },
  },
}
