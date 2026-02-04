return {
  'nvim-flutter/flutter-tools.nvim',
  cond = function()
    local cwd = vim.fn.getcwd()
    local target_file = cwd .. '/pubspec.yaml'
    return vim.fn.filereadable(target_file) == 1
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = true,
}
