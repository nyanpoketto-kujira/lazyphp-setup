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

## 🛠️ Cara Install

### 1. Prerequisites (Wajib ada)
- **Neovim 0.10+**
- **Git**
- **Nerd Font** (Rekomendasi: `FiraCode Nerd Font`)
- **Node.js, PHP, & Composer** (Wajib untuk LSP Intelephense & Phpactor)

### 2. Clone Repository

**Windows (PowerShell):**
```powershell
git clone https://github.com/nyanpoketto-kujira/nvim-config.git $env:LOCALAPPDATA\nvim
```

**Linux/macOS:**
```bash
git clone https://github.com/nyanpoketto-kujira/nvim-config.git ~/.config/nvim
```

### 3. Jalankan Neovim
Buka Terminal dan ketik `nvim` atau buka aplikasi `neovide`. Neovim akan otomatis menginstal ratusan plugin di balik layar.

---

## ⚠️ Catatan Penting
- **Windows Defender:** Selalu `exclude` folder `nvim` dan `nvim-data` di setting *Anti-Virus* biar performa LSP nggak kecekek!
- **Mason:** Begitu buka pertama kali, ketik `:Mason` buat memastikan server LSP (intelephense, tailwind, html) selesai terinstal.
- **Transparansi:** Jika pakai Linux/macOS, pastikan *window compositor* lu mendukung *blur*.

---
*Dibuat dengan 🔥 oleh **nyanpoketto-kujira***
