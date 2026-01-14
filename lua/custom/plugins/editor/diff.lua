return {
  'esmuellert/codediff.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  cmd = 'CodeDiff',
  opts = {
    highlights = {
      explorer = {
        width = 30,
        view_mode = 'tree',
        file_filter = {
          ignore = {
            '*.lock',
            '.git/*',
          },
        },
      },
    },
  },
}
