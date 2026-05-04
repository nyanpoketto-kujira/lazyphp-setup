# 🐘 LazyPHP (Kujira Setup)

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?style=for-the-badge&logo=neovim)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue.svg?style=for-the-badge&logo=lua)](https://lua.org)
[![PHP](https://img.shields.io/badge/PHP-8.2+-777BB4.svg?style=for-the-badge&logo=php&logoColor=white)](https://php.net)
[![LazyPHP](https://img.shields.io/badge/LazyPHP-Setup-blueviolet.svg?style=for-the-badge)](#)

Selamat datang di **LazyPHP**! 🐘 Ini adalah iterasi terbaru dari konfigurasi Neovim/Neovide milik **nyanpoketto-kujira** yang di-fork dari LazyVim, sekarang difokuskan 100% menjadi mesin tempur mematikan untuk *Fullstack Web Development* (terutama ekosistem Laravel/PHP).

## ✨ Fitur Unggulan
- 🐘 **Dewa Refactor & Diagnostics:** Kombinasi maut **Intelephense** (untuk *strict diagnostics* & *syntax check*) dan **Phpactor** (untuk refactoring kelas enterprise).
- 💾 **Auto-Save ala PHPStorm:** Save otomatis saat pindah window atau keluar dari *Insert Mode*.
- ⚡ **Ultra-Fast Suggestion:** `blink.cmp` dituning khusus untuk *zero-delay response*.
- 🌐 **Cross-Platform:** Deteksi OS otomatis buat *clipboard* dan resolusi font.
- 🪟 **Bening (Neovide):** Setup *acrylic/blur* estetik yang transparan menembus desktop, cocok buat *streaming*!
- 🔪 **Blade & Frontend Ready:** Dukungan *native* untuk Laravel Blade, TailwindCSS, dan Emmet.

## 🛠️ Cara Install (Otomatis)

Gua udah nyediain *Installer Script* buat lu yang nggak mau ribet install dependensi satu-satu. Script ini bakal otomatis nginstall Neovim, Neovide, Node.js, PHP, Ripgrep, dll.

### 🪟 Windows (PowerShell)
Buka PowerShell (as Administrator jika belum pernah pakai Scoop), lalu jalankan:
```powershell
iwr -useb https://raw.githubusercontent.com/nyanpoketto-kujira/lazyphp-setup/master/scripts/install.ps1 | iex
```

### 🐧 Linux (Arch / Manjaro / EndeavourOS)
Buat distro *Rolling Release*, jalankan:
```bash
curl -sL https://raw.githubusercontent.com/nyanpoketto-kujira/lazyphp-setup/master/scripts/install-rolling.sh | bash
```

### 🐧 Linux (Ubuntu / Debian / Mint)
Buat distro *Stable*, script ini bakal otomatis nge-download Neovim & Neovide versi terbaru (langsung dari rilis resmi, karena paket `apt` terlalu jadul):
```bash
curl -sL https://raw.githubusercontent.com/nyanpoketto-kujira/lazyphp-setup/master/scripts/install-stable.sh | bash
```

### 3. Jalankan Neovim
Buka Terminal baru dan ketik `nvim` atau buka aplikasi `neovide`. Neovim akan otomatis menginstal ratusan plugin di balik layar.

---

## ⚠️ Catatan Penting
- **Windows Defender:** Selalu `exclude` folder `nvim` dan `nvim-data` di setting *Anti-Virus* biar performa LSP nggak kecekek!
- **Mason:** Begitu buka pertama kali, ketik `:Mason` buat memastikan server LSP (intelephense, tailwind, html) selesai terinstal.
- **Transparansi:** Jika pakai Linux/macOS, pastikan *window compositor* lu mendukung *blur*.

---
*Dibuat dengan 🔥 oleh **nyanpoketto-kujira***
