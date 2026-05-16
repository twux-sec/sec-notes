# publish.ps1 — sync vault → content/ + commit + push
#
# Usage :
#   .\publish.ps1              # sync + montre git status + demande commit/push
#   .\publish.ps1 -Yes         # mode 1-clic : sync + commit auto + push (zéro prompt)
#   .\publish.ps1 -DryRun      # montre ce qui serait copié, ne touche à rien
#   .\publish.ps1 -SkipPush    # commit mais ne push pas
#   .\publish.ps1 -KeepRepo    # ne pas écraser les fichiers du repo qui diffèrent du vault
#
# Convention :
# - Vault = source de vérité. Tout fichier .md ou attachment dans
#   challenges-CTF/<PLAT>/writeups/ est copié vers content/<PLAT>/.
# - Si le vault a un .md directement sous <PLAT>/ (ex: Bleuet V5), il est copié aussi.
# - Les notes/ du vault ne sont JAMAIS publiées.
# - Par défaut le repo est écrasé pour rester un miroir exact du vault.

param(
    [switch]$Yes,
    [switch]$DryRun,
    [switch]$SkipPush,
    [switch]$KeepRepo,
    [string]$VaultPath = "C:\Users\victo\Documents\DEV\vault-t\challenges-CTF",
    # Plateformes NON publiques (jamais syncees) :
    [string[]]$Exclude = @("Osint-FR")
)

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$contentDir = Join-Path $repoRoot "content"

if (-not (Test-Path $VaultPath)) {
    Write-Error "Vault non trouvé : $VaultPath"
    exit 1
}

Write-Host ">>> Sync vault -> content/" -ForegroundColor Cyan
Write-Host "    src : $VaultPath"
Write-Host "    dst : $contentDir"
Write-Host ""

$copied = 0
$skipped = 0
$conflicts = @()

foreach ($plat in Get-ChildItem -Path $VaultPath -Directory) {
    if ($Exclude -contains $plat.Name) {
        Write-Host "EXCLUDED   $($plat.Name)" -ForegroundColor DarkGray
        continue
    }
    $writeupsDir = Join-Path $plat.FullName "writeups"
    $sourceRoot = $null

    if (Test-Path $writeupsDir) {
        if (Get-ChildItem -Path $writeupsDir -ErrorAction SilentlyContinue) {
            $sourceRoot = $writeupsDir
        }
    } else {
        $directMd = Get-ChildItem -Path $plat.FullName -File -Filter "*.md" -ErrorAction SilentlyContinue
        if ($directMd.Count -gt 0) {
            $sourceRoot = $plat.FullName
        }
    }

    if (-not $sourceRoot) { continue }

    $destDir = Join-Path $contentDir $plat.Name

    foreach ($file in Get-ChildItem -Path $sourceRoot -Recurse -File) {
        $relPath = $file.FullName.Substring($sourceRoot.Length + 1)
        $destFile = Join-Path $destDir $relPath
        $destFileDir = Split-Path -Parent $destFile

        if (Test-Path $destFile) {
            $sameContent = (Get-FileHash $file.FullName).Hash -eq (Get-FileHash $destFile).Hash
            if ($sameContent) {
                $skipped++
                continue
            }
            $conflicts += "$($plat.Name)/$relPath"
            if ($KeepRepo) {
                Write-Host "SKIP-DIFF  $($plat.Name)/$relPath" -ForegroundColor DarkYellow
                $skipped++
            } else {
                if (-not $DryRun) {
                    Copy-Item -Path $file.FullName -Destination $destFile -Force
                }
                Write-Host "OVERWRITE $($plat.Name)/$relPath" -ForegroundColor Yellow
                $copied++
            }
        } else {
            if (-not $DryRun) {
                if (-not (Test-Path $destFileDir)) {
                    New-Item -ItemType Directory -Path $destFileDir -Force | Out-Null
                }
                Copy-Item -Path $file.FullName -Destination $destFile
            }
            Write-Host "NEW        $($plat.Name)/$relPath" -ForegroundColor Green
            $copied++
        }
    }
}

Write-Host ""
Write-Host "Bilan : $copied copies / $skipped skips" -ForegroundColor Cyan

if ($conflicts.Count -gt 0 -and $KeepRepo) {
    Write-Host ""
    Write-Host "/!\ $($conflicts.Count) fichiers different entre vault et repo (non ecrases) :" -ForegroundColor Yellow
    foreach ($c in $conflicts) { Write-Host "    $c" }
}

if ($DryRun) {
    Write-Host ""
    Write-Host "Mode -DryRun : rien copie." -ForegroundColor Magenta
    exit 0
}

Write-Host ""
Write-Host ">>> git status" -ForegroundColor Cyan
git status --short

$pending = git status --porcelain
if ([string]::IsNullOrWhiteSpace($pending)) {
    Write-Host ""
    Write-Host "Rien a commit." -ForegroundColor Green
    exit 0
}

Write-Host ""
if ($Yes) {
    $msg = "sync vault -> content/ ($(Get-Date -Format 'yyyy-MM-dd HH:mm'))"
    Write-Host "Mode -Yes : commit auto + push" -ForegroundColor Cyan
} else {
    $confirm = Read-Host "Commit et push ? (y/N)"
    if ($confirm -ne "y") {
        Write-Host "Abandonne. Modifs en place, pas commit."
        exit 0
    }
    $msg = Read-Host "Message de commit (vide = 'sync vault')"
    if ([string]::IsNullOrWhiteSpace($msg)) { $msg = "sync vault -> content/" }
}

git add -A
git commit -m $msg

if ($SkipPush) {
    Write-Host ""
    Write-Host "Commit fait, push skippe (-SkipPush)." -ForegroundColor Green
    exit 0
}

git push origin main
Write-Host ""
Write-Host "Pushe. GitHub Actions deploie dans ~1 min." -ForegroundColor Green
