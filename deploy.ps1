# deploy.ps1 — 각 애드온을 com.mojang 개발 폴더에 배포합니다
param(
    [string]$Addon = ""  # 특정 애드온 이름 지정 (비우면 전체 배포)
)

$comMojang = "$env:APPDATA\Minecraft Bedrock\Users\Shared\games\com.mojang"

if (-not (Test-Path $comMojang)) {
    Write-Host "❌ com.mojang 폴더를 찾을 수 없습니다: $comMojang" -ForegroundColor Red
    Write-Host "   Minecraft 설정 → 일반 → 저장소 → 파일 저장 위치를 '외부'로 변경하세요." -ForegroundColor Yellow
    exit 1
}

function Deploy-Addon {
    param([string]$AddonName, [string]$AddonPath)

    $bp = Join-Path $AddonPath "behavior_pack"
    $rp = Join-Path $AddonPath "resource_pack"

    if (Test-Path $bp) {
        $bpDest = "$comMojang\development_behavior_packs\$AddonName-bp"
        if (Test-Path $bpDest) { Remove-Item $bpDest -Recurse -Force }
        Copy-Item -Path $bp -Destination $bpDest -Recurse
        Write-Host "  ✅ Behavior Pack → $bpDest" -ForegroundColor Green
    }

    if (Test-Path $rp) {
        $rpDest = "$comMojang\development_resource_packs\$AddonName-rp"
        if (Test-Path $rpDest) { Remove-Item $rpDest -Recurse -Force }
        Copy-Item -Path $rp -Destination $rpDest -Recurse
        Write-Host "  ✅ Resource Pack → $rpDest" -ForegroundColor Green
    }
}

$root = $PSScriptRoot

if ($Addon -ne "") {
    $addonPath = Join-Path $root $Addon
    if (-not (Test-Path $addonPath)) {
        Write-Host "❌ 애드온 폴더를 찾을 수 없습니다: $addonPath" -ForegroundColor Red
        exit 1
    }
    Write-Host "📦 '$Addon' 배포 중..." -ForegroundColor Cyan
    Deploy-Addon -AddonName $Addon -AddonPath $addonPath
} else {
    # 루트 폴더 안의 모든 애드온 폴더 배포
    $addons = Get-ChildItem -Path $root -Directory | Where-Object { $_.Name -notmatch '^\.' }
    foreach ($dir in $addons) {
        if ((Test-Path (Join-Path $dir.FullName "behavior_pack")) -or (Test-Path (Join-Path $dir.FullName "resource_pack"))) {
            Write-Host "📦 '$($dir.Name)' 배포 중..." -ForegroundColor Cyan
            Deploy-Addon -AddonName $dir.Name -AddonPath $dir.FullName
        }
    }
}

Write-Host ""
Write-Host "🎮 배포 완료! Minecraft에서 /reload 를 실행하세요." -ForegroundColor Yellow
