return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Diagnostics biar gak kedip-kedip (lebih enteng)
      diagnostics = {
        underline = true,
        update_in_insert = false, -- JANGAN update pas lagi ngetik, berat!
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              files = {
                maxSize = 1000000, -- Limit file size 1MB
                exclude = { 
                  "**/node_modules/**", 
                  "**/vendor/**/Tests/**", 
                  "**/storage/framework/views/**",
                  "**/storage/framework/cache/**",
                  "**/vendor/**/Documentation/**",
                },
              },
              completion = {
                fullyQualifyImportPositions = true,
              },
              index = {
                staticConstantOptions = "all",
              },
              memory = 2048,
            },
          },
        },
      },
    },
  },
}
