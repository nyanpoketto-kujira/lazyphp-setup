return {
  {
    'saghen/blink.cmp',
    opts = {
      completion = {
        -- JANGAN otomatis pilih/masukin suggesti, biar gak "ngegas"
        list = { selection = { preselect = false, auto_insert = false } },
        menu = { auto_show = true },
        ghost_text = { enabled = false }, -- Matiin dulu biar gak pusing
        trigger = {
          prefetch_on_insert = true,
          show_on_keyword = true,
          show_on_trigger_character = true,
          default_timeout_ms = 150, -- Kasih delay biar gak terlalu agresif
        },
      },
      -- Ultra fast response
      delay = {
        completion = 50, -- Kasih delay dikit biar gak kaget
        providers = 50,
      },
      -- Matiin cmdline completion biar gak crash pas pencet Tab di command
      cmdline = { enabled = false },
      
      -- Optimalisasi buat Windows
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
      },

      -- Prioritas Provider
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          path = {
            score_offset = -10, -- Sikat abis prioritasnya ke bawah
            min_keyword_length = 3, -- Jangan muncul cuma gara-gara ngetik /
          },
          lsp = {
            score_offset = 1,
          },
          snippets = {
            score_offset = -5, -- Snippet juga jangan ganggu
          },
        },
      },
    },
  },
}
