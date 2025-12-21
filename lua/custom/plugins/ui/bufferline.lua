return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'BufEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  opts = function()
    return {
      highlights = require('catppuccin.special.bufferline').get_theme(),
      options = {
        diagnostics = 'nvim_lsp',

        diagnostics_indicator = function(_, _, diag)
          local icons = {
            Error = '',
            Warn = '',
          }
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,

        custom_filter = function(buf_number, buf_numbers)
          -- Hide help buffers
          if vim.bo[buf_number].filetype == 'help' then
            return false
          end

          -- Hide specific filetypes like defx, NvimTree
          local hide_types = { 'defx', 'snacks_dashboard', 'qf' }
          for _, ft in ipairs(hide_types) do
            if vim.bo[buf_number].filetype == ft then
              return false
            end
          end

          -- Hide by buffer name (e.g., quickfix)
          if vim.fn.bufname(buf_number):match 'quickfix' then
            return false
          end
          return true
        end,
      },
    }
  end,
}
