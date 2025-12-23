return {
  'Fildo7525/pretty_hover',
  event = 'LspAttach',
  config = function()
    require('pretty_hover').setup {
      border = 'none',
    }
    vim.keymap.set('n', 'K', require('pretty_hover').hover, { desc = 'Hover Doc', silent = true, noremap = true })
  end,
}
