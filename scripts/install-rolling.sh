#!/bin/bash

echo -e "\e[36m=========================================\e[0m"
echo -e "\e[36m🐘 LazyPHP Setup Installer (Rolling) 🐘\e[0m"
echo -e "\e[36m=========================================\e[0m"

# Cek package manager
if command -v pacman &> /dev/null; then
    PM="sudo pacman -S --needed --noconfirm"
elif command -v zypper &> /dev/null; then
    PM="sudo zypper install -y"
else
    echo -e "\e[31m[!] Package manager tidak didukung oleh script rolling release ini (Hanya Arch/openSUSE).\e[0m"
    echo "Silakan gunakan install-stable.sh jika kamu menggunakan Debian/Ubuntu."
    exit 1
fi

echo -e "\n\e[36m[*] Menginstal Dependencies...\e[0m"
$PM git ripgrep fd fzf npm php gcc unzip xclip

echo -e "\n\e[36mPilih Editor yang mau diinstal:\e[0m"
echo "1. Neovim & Neovide (Rekomendasi)"
echo "2. Neovim saja (Terminal)"
echo "3. Neovide saja (GUI)"
echo "4. Lewati (Sudah punya)"
read -p "Masukkan pilihan (1-4): " choice

if [ "$choice" == "1" ]; then
    $PM neovim neovide
elif [ "$choice" == "2" ]; then
    $PM neovim
elif [ "$choice" == "3" ]; then
    $PM neovide
fi

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
