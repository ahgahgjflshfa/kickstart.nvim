return {
  'nvim-lualine/lualine.nvim',
  event = 'BufEnter',
  opts = function()
    local opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard' } },
      },
      extensions = { 'lazy' },
    }

    return opts
  end,
}
