return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Posisi UI di kanan
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_win_position = "right"
      vim.g.db_ui_winwidth = 40
    end,
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
    },
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Nambahin source dadbod-completion ke blink.cmp biar SQL autocomplete jalan
      opts.sources = opts.sources or {}
      opts.sources.providers = opts.sources.providers or {}
      
      opts.sources.providers.dadbod = {
        name = "Dadbod",
        module = "vim_dadbod_completion.blink",
        score_offset = 100,
      }
      
      if type(opts.sources.default) == "table" then
        table.insert(opts.sources.default, "dadbod")
      end
    end,
  },
}
