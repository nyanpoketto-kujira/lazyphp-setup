# 🐋 Nvim/Neovide Kujira Setup (VTuber Edition)

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?style=for-the-badge&logo=neovim)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue.svg?style=for-the-badge&logo=lua)](https://lua.org)
[![LazyVim](https://img.shields.io/badge/LazyVim-Setup-blueviolet.svg?style=for-the-badge)](https://www.lazyvim.org)

Selamat datang di **Kujira Setup**! 🐋 Ini adalah konfigurasi Neovim/Neovide pribadi milik **nyanpoketto-kujira** (VTuber) yang udah dioptimasi buat performa tinggi, visual estetik (bening), dan *workflow* sat-set.

## ✨ Fitur Unggulan
- 💾 **Auto-Save ala PHPStorm:** Save otomatis pas pindah window atau balik ke normal mode.
- ⚡ **Ultra-Fast Suggestion:** `blink.cmp` udah di-tweak tanpa delay (0ms response).
- 🌐 **Cross-Platform:** Deteksi OS otomatis buat settingan font & clipboard.
- 🪟 **Bening (Neovide):** Setup Neovide acrylic/blur yang bening dan estetik, cocok buat *streaming* atau ngoding santai.
- 🐘 **Laravel Ready:** Support Blade, Tailwind, dan Intelephense yang udah di-tweak performanya.

## 🛠️ Cara Install (PC Baru)

### 1. Prerequisites (Wajib ada)
- **Neovim 0.10+**
- **Git**
- **Nerd Font** (Rekomendasi: `FiraCode Nerd Font`)
- **Ripgrep & FD** (Buat nyari file cepet)
- **Node.js & PHP** (Buat LSP)

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
Tinggal ketik `nvim` atau buka `neovide`. Neovim bakal otomatis install semua plugin via Lazy.nvim.

---

## ⚠️ Catatan Penting
- **Windows Defender:** Selalu exclude folder `nvim` dan `nvim-data` biar nggak ada delay scanning.
- **Mason:** Begitu buka pertama kali, ketik `:Mason` buat pastiin LSP (intelephense, tailwind, dsb) terinstall sempurna.
- **Transparency:** Kalau di Linux nggak transparan, pastikan compositor lu aktif.

---
Dibuat dengan 🔥 oleh **nyanpoketto-kujira**
