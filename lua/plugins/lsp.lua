-- Deteksi Versi PHP otomatis bre
local function get_php_version()
  if vim.fn.executable("php") == 1 then
    local result = vim.fn.system({"php", "-r", "echo PHP_MAJOR_VERSION . '.' . PHP_MINOR_VERSION . '.' . PHP_RELEASE_VERSION;"})
    if result and type(result) == "string" then
      result = result:gsub("%s+", "") -- Hapus enter/spasi
      if result ~= "" then
        return result
      end
    end
  end
  return "8.2.0" -- Fallback kalau php gak ketemu
end

local php_version = get_php_version()

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Diagnostics biar lebih sensitif tapi tetep aman
      diagnostics = {
        underline = true,
        update_in_insert = true, -- AKTIFIN lagi biar error langsung keliatan pas ngetik
        virtual_text = { 
          spacing = 4, 
          prefix = "●",
          source = "if_many", -- Tunjukin sumber errornya (intelephense/html/dll)
        },
        severity_sort = true,
        signs = true,
      },
      servers = {
        html = {
          filetypes = { "html", "javascriptreact", "typescriptreact", "blade" },
        },
        emmet_ls = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "blade" },
        },
        phpactor = {
          enabled = true,
        },
        intelephense = {
          enabled = true,
          settings = {
            intelephense = {
              stubs = {
                "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
                "hash", "filter", "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json",
                "ldap", "libxml", "mbstring", "mcrypt", "mysql", "mysqli", "password", "pcntl", "pcre",
                "PDO", "pdo_mysql", "Phar", "readline", "recode", "Reflection", "regex", "session",
                "SimpleXML", "soap", "sockets", "sodium", "SPL", "standard", "superglobals", "sysvmsg",
                "sysvsem", "sysvshm", "tokenizer", "xml", "xdebug", "xmlreader", "xmlrpc", "xmlwriter",
                "yaml", "zip", "zlib", "wordpress", "woocommerce", "acf-pro", "wordpress-globals",
                "wp-cli", "genesis", "polylang", "swoole", "laravel", "eloquent", "redis",
              },
              environment = {
                phpVersion = php_version,
              },
              diagnostics = {
                enable = true,
                run = "onType", -- Langsung jalan pas ngetik
              },
              files = {
                maxSize = 1000000,
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
