return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe", 
      transparent_background = true,
      color_overrides = {
        frappe = {
          sky = "#89dceb", -- Baby Blue
          pink = "#f5c2e7", -- Rose Pink
        },
      },
      integrations = {
        blink_cmp = true,
        native_lsp = { enabled = true },
        treesitter = true,
      },
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}
