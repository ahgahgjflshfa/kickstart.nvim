local function term_nav(dir)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and '<c-' .. dir .. '>' or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end

return {
  'folke/snacks.nvim',
  event = 'VimEnter',
  priority = 1000,
  lazy = false,
  dependencies = {
    { 'folke/persistence.nvim', opts = {} },
  },
  --@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    terminal = {
      win = {
        keys = {
          nav_h = { '<C-h>', term_nav 'h', desc = 'Go to Left Window', expr = true, mode = 't' },
          nav_j = { '<C-j>', term_nav 'j', desc = 'Go to Lower Window', expr = true, mode = 't' },
          nav_k = { '<C-k>', term_nav 'k', desc = 'Go to Upper Window', expr = true, mode = 't' },
          nav_l = { '<C-l>', term_nav 'l', desc = 'Go to Right Window', expr = true, mode = 't' },
        },
      },
    },
    explorer = {
      replace_netrw = true,
      trash = true,
    },
    dashboard = {
      enabled = true,
      preset = {
        header = [[

                                                                   
      ████ ██████           █████      ██                     
    ███████████             █████                             
    █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
  █████████ ██████████ █████████ █████ █████ ████ █████   
███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true,
        },
        explorer = {
          hidden = true,
          follow_file = false,
          layout = {
            layout = { position = 'right' },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      '<leader><space>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>bb',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[b]uffers',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = '[e]xplorer',
    },
    -- find
    {
      '<leader>fc',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[c]onfig File',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = '[f]iles',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_files()
      end,
      desc = '[g]it Files',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = '[p]rojects',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = '[r]ecent',
    },
    -- git
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = '[b]ranches',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = '[l]og',
    },
    {
      '<leader>gL',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = '[L]og Line',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = '[s]tatus',
    },
    {
      '<leader>gS',
      function()
        Snacks.picker.git_stash()
      end,
      desc = '[S]tash',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = '[d]iff (Hunks)',
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Log [f]ile',
    },
    -- gh
    {
      '<leader>gi',
      function()
        Snacks.picker.gh_issue()
      end,
      desc = '[i]ssues (open)',
    },
    {
      '<leader>gI',
      function()
        Snacks.picker.gh_issue { state = 'all' }
      end,
      desc = '[I]ssues (all)',
    },
    {
      '<leader>gp',
      function()
        Snacks.picker.gh_pr()
      end,
      desc = '[p]ull Requests (open)',
    },
    {
      '<leader>gP',
      function()
        Snacks.picker.gh_pr { state = 'all' }
      end,
      desc = '[P]ull Requests (all)',
    },
    -- search
    {
      '<leader>sa',
      function()
        Snacks.picker.autocmds()
      end,
      desc = '[a]utocmds',
    },
    {
      '<leader>sb',
      function()
        Snacks.picker.lines()
      end,
      desc = '[b]uffer Lines',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.command_history()
      end,
      desc = '[c]ommand History',
    },
    {
      '<leader>sC',
      function()
        Snacks.picker.commands()
      end,
      desc = '[C]ommands',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[d]iagnostics',
    },
    {
      '<leader>sD',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'Buffer [D]iagnostics',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = '[h]elp Pages',
    },
    {
      '<leader>sH',
      function()
        Snacks.picker.highlights()
      end,
      desc = '[H]ighlights',
    },
    {
      '<leader>si',
      function()
        Snacks.picker.icons()
      end,
      desc = '[i]cons',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = '[k]eymaps',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = '[m]arks',
    },
    {
      '<leader>sM',
      function()
        Snacks.picker.man()
      end,
      desc = '[M]an Pages',
    },
    {
      '<leader>sq',
      function()
        Snacks.picker.qflist()
      end,
      desc = '[q]uickfix List',
    },
    {
      '<leader>su',
      function()
        Snacks.picker.undo()
      end,
      desc = '[u]ndo History',
    },
    -- LSP
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = '[g]oto [d]efinition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = '[g]oto [D]eclaration',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = '[g]oto [r]eferences',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = '[g]oto [I]mplementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = '[g]oto T[y]pe Definition',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP [s]ymbols',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace [S]ymbols',
    },
    -- Other
    {
      '<leader>n',
      function()
        if Snacks.config.picker and Snacks.config.picker.enabled then
          Snacks.picker.notifications()
        else
          Snacks.notifier.show_history()
        end
      end,
      desc = '[n]otification History',
    },
    {
      '<leader>tn',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All [n]otifications',
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = '[d]elete',
    },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = '[B]rowse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazy[g]it',
    },
    {
      '<c-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<c-_>',
      function()
        Snacks.terminal()
      end,
      desc = 'which_key_ignore',
    },
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
  },
}
