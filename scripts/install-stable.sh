#!/bin/bash

echo -e "\e[36m=========================================\e[0m"
echo -e "\e[36m🐘 LazyPHP Setup Installer (Stable) 🐘\e[0m"
echo -e "\e[36m=========================================\e[0m"

# 1. Install Dependencies
echo -e "\n\e[36m[*] Menginstal Dependencies Dasar...\e[0m"
if command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y git ripgrep fd-find fzf nodejs npm php-cli gcc curl unzip wl-clipboard xclip
    
    # Symlink fdfind ke fd (Ubuntu specfic issue)
    if [ -f /usr/bin/fdfind ] && [ ! -f /usr/bin/fd ]; then
        sudo ln -s /usr/bin/fdfind /usr/bin/fd
    fi
elif command -v dnf &> /dev/null; then
    sudo dnf install -y git ripgrep fd-find fzf nodejs npm php-cli gcc curl unzip wl-clipboard xclip
else
    echo -e "\e[31m[!] Package manager tidak didukung oleh script stable ini (Hanya apt/dnf).\e[0m"
    exit 1
fi

echo -e "\n\e[36mPilih Editor yang mau diinstal (via Pre-built binaries):\e[0m"
echo "1. Neovim & Neovide (Rekomendasi)"
echo "2. Neovim saja (Terminal)"
echo "3. Neovide saja (GUI)"
echo "4. Lewati (Sudah punya Neovim 0.10+)"
read -p "Masukkan pilihan (1-4): " choice

# Fungsi download & install Neovim
install_neovim() {
    echo -e "\n\e[36m[*] Mendownload & Menginstal Neovim terbaru...\e[0m"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
    rm nvim-linux64.tar.gz
    echo -e "\e[32m[OK] Neovim terinstal di /usr/local/bin/nvim\e[0m"
}

# Fungsi download & install Neovide
install_neovide() {
    echo -e "\n\e[36m[*] Mendownload & Menginstal Neovide terbaru...\e[0m"
    curl -LO https://github.com/neovide/neovide/releases/latest/download/neovide-linux-x86_64.tar.gz
    tar -xzf neovide-linux-x86_64.tar.gz
    sudo mv neovide /usr/local/bin/
    rm neovide-linux-x86_64.tar.gz
    echo -e "\e[32m[OK] Neovide terinstal di /usr/local/bin/neovide\e[0m"
}

if [ "$choice" == "1" ]; then
    install_neovim
    install_neovide
elif [ "$choice" == "2" ]; then
    install_neovim
elif [ "$choice" == "3" ]; then
    install_neovide
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
