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
    cond = function()
      return vim.loop.fs_stat("artisan") ~= nil
    end,
    keys = {
      { "<leader>aa", "<cmd>Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>ar", "<cmd>Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>am", "<cmd>Laravel make<cr>", desc = "Laravel Make" },
    },
    opts = {},
    init = function()
      -- AUTO-PATCH UNTUK WINDOWS USERS
      -- laravel.nvim punya bug hardcoded slash '/' di Windows. Kita otomatis patch pas Neovim nyala.
      local is_windows = vim.loop.os_uname().version:find("Windows")
      if is_windows then
        local plugin_dir = vim.fn.stdpath("data") .. "/lazy/laravel.nvim"
        local file_path = plugin_dir .. "/lua/laravel/providers/extensions_provider.lua"
        
        -- Cek apakah file ada (plugin udah ke-download)
        if vim.fn.filereadable(file_path) == 1 then
          local lines = vim.fn.readfile(file_path)
          local patched = false
          for i, line in ipairs(lines) do
            if line:match('ext:match%("lua/%(%p%*%)%%%.lua%$"%)') then
              lines[i] = line:gsub('lua/%(%p%*%)%%%.lua%$', 'lua[\\\\/](.*)%%.lua$'):gsub('gsub%("大", "%."%)', 'gsub("[\\\\/]", ".")')
              -- Karena gsub agak ribet buat escape, kita hardcode replace aja barisnya
              lines[i] = '      local m = ext:match("lua[\\\\/](.*)%%.lua$"):gsub("[\\\\/]", ".")'
              patched = true
              break
            end
          end
          if patched then
            vim.fn.writefile(lines, file_path)
          end
        end
      end
    end,
  },
}
