return {
  'folke/noice.nvim',
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
        ['vim.lsp.util.stylize_markdown'] = false,
        ['cmp.entry.get_documentation'] = false,
      },
      hover = {
        view = nil,
        enabled = false,
      },
      signature = {
        view = nil,
        enabled = false,
      },
      documentation = {
        opts = {
          lang = 'markdown',
          render = 'markdown',
        },
      },
    },
    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = true,
      lsp_doc_border = false,
    },
  },
}
