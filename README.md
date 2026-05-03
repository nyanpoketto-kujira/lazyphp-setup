# 🚀 Gacor Neovim Setup (Cross-Platform)

Setup Neovim/Neovide yang udah dioptimasi buat **Windows & Linux**. Dibangun di atas LazyVim dengan sentuhan auto-save, transparansi, dan performa tinggi.

## 🛠️ Cara Install (PC Baru)

### 1. Prerequisites (Wajib ada)
- **Neovim 0.10+**
- **Git**
- **Nerd Font** (Rekomendasi: `FiraCode Nerd Font`)
- **Ripgrep & FD** (Buat nyari file cepet)
- **Node.js & PHP** (Buat LSP)

### 2. Clone Repository
Buka terminal/powershell, jalanin command ini:

**Windows (PowerShell):**
```powershell
git clone https://github.com/USERNAME/REPO_NAME.git $env:LOCALAPPDATA\nvim
```

**Linux/macOS:**
```bash
git clone https://github.com/USERNAME/REPO_NAME.git ~/.config/nvim
```

### 3. Jalankan Neovim
Tinggal ketik `nvim` atau buka `neovide`. Neovim bakal otomatis install semua plugin (Lazy.nvim).

---

## 🔥 Fitur Unggulan
- **Auto-Save:** Save otomatis pas pindah window atau balik ke normal mode.
- **Ultra-Fast Suggestion:** Blink.cmp udah di-tweak tanpa delay.
- **Cross-Platform:** Deteksi OS otomatis buat settingan font & clipboard.
- **Transparan:** Setup Neovide acrylic/blur yang bening.

## ⚠️ Catatan Penting
- **Windows Defender:** Selalu exclude folder `nvim` dan `nvim-data` biar nggak delay.
- **Mason:** Begitu buka pertama kali, cek `:Mason` buat pastiin LSP terinstall.
