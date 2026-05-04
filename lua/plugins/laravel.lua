return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", "<cmd>Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", "<cmd>Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>lm", "<cmd>Laravel make<cr>", desc = "Laravel Make" },
    },
    config = function()
      require("laravel").setup({
        features = {
          null_ls = {
            enable = false,
          },
          route_info = {
            enable = true,
            position = "right",
          },
        },
      })
    end,
  },
}
