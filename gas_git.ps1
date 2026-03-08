# Script Otomatis Git untuk TP MOD 3
# NIM: 103022430006

Write-Host "--- Memulai Proses Git Otomatis ---" -ForegroundColor Cyan

# 1. Inisialisasi Git jika belum ada
if (!(Test-Path .git)) {
    git init
    Write-Host "[OK] Git Initialized." -ForegroundColor Green
}

# 2. Membuat file .gitignore agar tidak error Permission Denied
$ignoreContent = @(
    ".vs/",
    "[Bb]in/",
    "[Oo]bj/",
    "*.user",
    "*.suo",
    "*.exe",
    "*.pdb"
)
$ignoreContent | Out-File -FilePath .gitignore -Encoding ascii -Force
Write-Host "[OK] .gitignore created/updated." -ForegroundColor Green

# 3. Membersihkan cache agar folder sampah benar-benar terhapus dari pantauan Git
Write-Host "Cleaning Git cache..." -ForegroundColor Yellow
git rm -r --cached . --ignore-unmatch | Out-Null

# 4. Menambahkan file dan Commit
git add .
git commit -m "Update otomatis: Perbaikan logika kalkulator dan .gitignore"
Write-Host "[OK] Files committed." -ForegroundColor Green

# 5. Mengatur Remote Repository (HTTPS)
$repoUrl = "https://github.com/Thbetyfu/Tp_MOD3.git"
git remote remove origin 2>$null
git remote add origin $repoUrl
Write-Host "[OK] Remote set to $repoUrl" -ForegroundColor Green

# 6. Push ke GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main --force

Write-Host "--- Selesai! Cek repository GitHub kamu sekarang ---" -ForegroundColor Cyan