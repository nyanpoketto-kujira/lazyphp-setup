#!/bin/bash

echo -e "\e[36m=========================================\e[0m"
echo -e "\e[36m🐘 LazyPHP Setup Installer (macOS) 🐘\e[0m"
echo -e "\e[36m=========================================\e[0m"

# 1. Cek Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "\e[33m[!] Homebrew belum terinstall. Menginstal Homebrew...\e[0m"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "\e[32m[OK] Homebrew sudah terinstall.\e[0m"
fi

echo -e "\n\e[36m[*] Menginstal Dependencies Dasar...\e[0m"
# Menginstal dependency dasar
brew install git ripgrep fd fzf node php gcc curl

# Menginstal font FiraCode Nerd Font
echo -e "\n\e[36m[*] Menginstal FiraCode Nerd Font...\e[0m"
brew install --cask font-fira-code-nerd-font

echo -e "\n\e[36mPilih Editor yang mau diinstal:\e[0m"
echo "1. Neovim & Neovide (Rekomendasi)"
echo "2. Neovim saja (Terminal)"
echo "3. Neovide saja (GUI)"
echo "4. Lewati (Sudah punya)"
read -p "Masukkan pilihan (1-4): " choice

if [ "$choice" == "1" ]; then
    brew install neovim --cask neovide
elif [ "$choice" == "2" ]; then
    brew install neovim
elif [ "$choice" == "3" ]; then
    brew install --cask neovide
fi

# 3. Clone / Pasang LazyPHP Setup
echo -e "\n\e[36m[*] Menyiapkan LazyPHP Setup...\e[0m"
NVIM_DIR="$HOME/.config/nvim"

if [ -d "$NVIM_DIR" ]; then
    BACKUP_DIR="$HOME/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)"
    echo -e "\e[33m[!] Folder $NVIM_DIR sudah ada. Melakukan backup ke $BACKUP_DIR...\e[0m"
    mv "$NVIM_DIR" "$BACKUP_DIR"
fi

git clone https://github.com/nyanpoketto-kujira/lazyphp-setup.git "$NVIM_DIR"

echo -e "\n\e[32m=========================================\e[0m"
echo -e "\e[32m✅ Instalasi Selesai! Buka terminal baru dan jalankan 'nvim' atau 'neovide'.\e[0m"
echo -e "\e[32m=========================================\e[0m"
