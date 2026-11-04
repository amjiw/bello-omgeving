# Diagnose van de Bello-omgeving: alles wat de docent nodig heeft om mee te kijken, in een zip.
# Niet in de zip: .env (daar staan je sleutels in).
$ErrorActionPreference = "Continue"
$hier = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $hier
$stempel = Get-Date -Format "yyyyMMdd_HHmm"
$map = Join-Path $env:TEMP "bello_diagnose_$stempel"
New-Item -ItemType Directory -Force $map | Out-Null

function Vang($naam, $blok) {
    $pad = Join-Path $map $naam
    try { & $blok 2>&1 | Out-File -FilePath $pad -Encoding utf8 } catch { $_ | Out-File -FilePath $pad -Encoding utf8 }
}

Vang "00_systeem.txt" {
    "Datum: $(Get-Date)"
    "Versie uitgedeeld: $(Get-Content VERSIE_UITGEDEELD -ErrorAction SilentlyContinue)"
    "Windows: $([System.Environment]::OSVersion.VersionString)"
    "RAM (GB): $([math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1))"
    "Vrije schijf C (GB): $([math]::Round((Get-PSDrive C).Free / 1GB, 1))"
    "Processor: $((Get-CimInstance Win32_Processor).Name)"
}
Vang "01_docker_version.txt" { docker version }
Vang "02_docker_info.txt"    { docker info }
Vang "03_compose_ps.txt"     { docker compose ps -a }
Vang "04_images.txt"         { docker images }
Vang "05_compose_logs.txt"   { docker compose logs --no-color --tail 500 }
Vang "06_versie_container.txt" { docker compose exec -T max cat /opt/container/VERSIE }
Vang "07_console.log"        { docker compose exec -T max tail -c 100000 /opt/viewer/console.log }
Vang "08_tutor_log.jsonl"    { docker compose exec -T max sh -c "tail -n 200 /werk/tutor/log.jsonl 2>/dev/null" }
Vang "09_mijn_code.py"       { docker compose exec -T max cat /werk/controllers/max_student/mijn_code.py }
Vang "10_poorten.txt"        { netstat -ano | Select-String ":8000|:8080|:8090|:1234|:1883|:9001|:7071|:3080" }
Copy-Item docker-compose.yml $map -ErrorAction SilentlyContinue

$zip = Join-Path $hier "diagnose_$stempel.zip"
if (Test-Path $zip) { Remove-Item $zip }
Compress-Archive -Path (Join-Path $map "*") -DestinationPath $zip
Remove-Item -Recurse -Force $map
Write-Host ""
Write-Host "Klaar: $zip"
Write-Host "Stuur dit bestand naar de docent (Teams). Je .env zit er niet in."
