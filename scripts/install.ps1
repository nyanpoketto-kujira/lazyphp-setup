# install.ps1
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🐘 LazyPHP Setup Installer (Windows) 🐘" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# 1. Cek Scoop
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "[!] Scoop belum terinstall. Menginstal Scoop..." -ForegroundColor Yellow
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
} else {
    Write-Host "[OK] Scoop sudah terinstall." -ForegroundColor Green
}

# Tambah bucket yang mungkin butuh untuk beberapa package (seperti nerd-fonts)
scoop bucket add extras | Out-Null
scoop bucket add nerd-fonts | Out-Null

# 2. Cek & Install Dependencies
$deps = @("git", "ripgrep", "fd", "fzf", "nodejs", "php", "gcc", "FiraCode-NF")
Write-Host "`n[*] Menginstal Dependencies..." -ForegroundColor Cyan
foreach ($dep in $deps) {
    # Check if installed using Get-Command or checking scoop directory
    $isInstalled = scoop list | Select-String "\b$dep\b"
    if (-not $isInstalled) {
        Write-Host "-> Menginstal $dep..."
        scoop install $dep
    } else {
        Write-Host "[OK] $dep sudah terinstall." -ForegroundColor Green
    }
}

# 3. Pilihan Neovim / Neovide
Write-Host "`nPilih Editor yang mau diinstal:" -ForegroundColor Cyan
Write-Host "1. Neovim & Neovide (Rekomendasi)"
Write-Host "2. Neovim saja (Terminal)"
Write-Host "3. Neovide saja (GUI)"
Write-Host "4. Lewati (Sudah punya)"
$choice = Read-Host "Masukkan pilihan (1-4)"

if ($choice -eq '1') {
    scoop install neovim neovide
} elseif ($choice -eq '2') {
    scoop install neovim
} elseif ($choice -eq '3') {
    scoop install neovide
}

# 4. Clone / Pasang LazyPHP Setup
Write-Host "`n[*] Menyiapkan LazyPHP Setup..." -ForegroundColor Cyan
$nvim_dir = "$env:LOCALAPPDATA\nvim"

if (Test-Path $nvim_dir) {
    $backup_dir = "$env:LOCALAPPDATA\nvim.bak.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Write-Host "[!] Folder $nvim_dir sudah ada. Melakukan backup ke $backup_dir..." -ForegroundColor Yellow
    Rename-Item -Path $nvim_dir -NewName $backup_dir
}

git clone https://github.com/nyanpoketto-kujira/lazyphp-setup.git $nvim_dir

Write-Host "`n=========================================" -ForegroundColor Green
Write-Host "✅ Instalasi Selesai! Buka terminal baru dan jalankan 'nvim' atau 'neovide'." -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
