return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufEnter',
  dependencies = {
    {
      'HiPhish/rainbow-delimiters',
      lazy = true,
      url = 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
      config = function()
        local rainbow_delimiters = require 'rainbow-delimiters'

        local strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        }
        local query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        }
        local priority = {
          [''] = 110,
          lua = 210,
        }
        local highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        }

        require('rainbow-delimiters.setup').setup {
          strategy = strategy,
          query = query,
          priority = priority,
          highlight = highlight,
        }
      end,
    },
  },

  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config

  config = function()
    local highlight = {
      'RainbowRed',
      'RainbowYellow',
      'RainbowBlue',
      'RainbowOrange',
      'RainbowGreen',
      'RainbowViolet',
      'RainbowCyan',
    }

    local hooks = require 'ibl.hooks'
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
      vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
      vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
      vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
      vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
      vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
      vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    require('ibl').setup {
      scope = {
        enabled = true,
        highlight = highlight,
      },

      -- comment this line to diable a indent highlighting
      indent = {
        char = '│',
        tab_char = '│',
        highlight = highlight,
      }, -- add color to other indents

      -- exclude
      exclude = {
        filetypes = {
          'Trouble',
          'alpha',
          'dashboard',
          'help',
          'lazy',
          'mason',
          'neo-tree',
          'notify',
          'snacks_dashboard',
          'snacks_notif',
          'snacks_terminal',
          'snacks_win',
          'toggleterm',
          'trouble',
        },
      },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
