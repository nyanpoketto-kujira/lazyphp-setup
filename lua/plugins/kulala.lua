return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>R", "<cmd>lua require('kulala').run()<cr>", desc = "Run HTTP Request" },
      { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle HTTP Headers/Body" },
      { "<leader>Re", "<cmd>lua require('kulala').set_selected_env()<cr>", desc = "Set HTTP Environment" },
    },
    opts = {
      -- default kulala options
    },
  },
}
