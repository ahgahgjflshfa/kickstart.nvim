return {
  {
    'mrcjkb/rustaceanvim',
    ft = { 'rust' },
    init = function()
      local opts = {
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>cR', function()
              vim.cmd.RustLsp 'codeAction'
            end, { desc = 'Code Action', buffer = bufnr })

            vim.keymap.set('n', '<leader>dr', function()
              vim.cmd.RustLsp 'debuggables'
            end, { desc = 'Rust Debuggables', buffer = bufnr })
          end,

          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = { enable = true },
              },
              checkOnSave = { command = 'clippy' },
              diagnostics = { enable = true },
              procMacro = { enable = true },
              files = {
                exclude = {
                  '.direnv',
                  '.git',
                  '.jj',
                  '.github',
                  '.gitlab',
                  'bin',
                  'node_modules',
                  'target',
                  'venv',
                  '.venv',
                },
                watcher = 'client',
              },
              inlayHints = {
                typeHints = {
                  hideTypeAliases = true,
                },
              },
            },
          },
        },
      }

      -- DAP（只能在 init，不能在 config）
      if vim.fn.executable 'codelldb' == 1 then
        local codelldb = vim.fn.exepath 'codelldb'
        local ext = vim.loop.os_uname().sysname == 'Linux' and '.so' or '.dylib'
        local lib = vim.fn.expand('$MASON/opt/lldb/lib/liblldb' .. ext)

        opts.dap = {
          adapter = require('rustaceanvim.config').get_codelldb_adapter(codelldb, lib),
        }
      end

      vim.g.rustaceanvim = vim.tbl_deep_extend('force', vim.g.rustaceanvim or {}, opts)
    end,
  },
  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
