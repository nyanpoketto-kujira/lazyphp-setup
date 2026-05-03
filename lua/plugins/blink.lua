return {
  {
    'saghen/blink.cmp',
    opts = {
      completion = {
        list = { selection = { preselect = true, auto_insert = true } },
        menu = { auto_show = true },
        ghost_text = { enabled = true },
        trigger = {
          prefetch_on_insert = true,
          show_on_keyword = true,
          show_on_trigger_character = true,
          default_timeout_ms = 50, -- Kasih dikit biar gak kaget
        },
      },
      -- Ultra fast response
      delay = {
        completion = 0,
        providers = 0,
      },
      -- Matiin cmdline completion biar gak crash pas pencet Tab di command
      cmdline = { enabled = false },
      
      -- Optimalisasi buat Windows
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
      },
    },
  },
}
