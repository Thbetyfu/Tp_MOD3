# Script Otomatis Git untuk TP MOD 3
# NIM: 103022430006

Write-Host "--- Memulai Proses Git Otomatis ---" -ForegroundColor Cyan

if (!(Test-Path .git)) {
    git init
    Write-Host "[OK] Git Initialized." -ForegroundColor Green
}

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
Write-Host "Cleaning Git cache..." -ForegroundColor Yellow
git rm -r --cached . --ignore-unmatch | Out-Null
git add .
git commit -m "Update otomatis: Perbaikan logika kalkulator dan .gitignore"
Write-Host "[OK] Files committed." -ForegroundColor Green

$repoUrl = "https://github.com/Thbetyfu/Tp_MOD3.git"
git remote remove origin 2>$null
git remote add origin $repoUrl
Write-Host "[OK] Remote set to $repoUrl" -ForegroundColor Green

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main --force

Write-Host "--- Selesai! Cek repository GitHub kamu sekarang ---" -ForegroundColor Cyan
