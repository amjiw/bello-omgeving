@echo off
rem Start de Bello-omgeving met de Pico-emulator (Docker Desktop moet draaien) en opent de startpagina.
rem Controleert eerst of de docent een nieuwe versie heeft uitgebracht; zonder internet slaat hij dat over.
cd /d "%~dp0"
if not exist .env copy .env.example .env >nul
echo Controleren op een nieuwe versie (zonder internet: overgeslagen)...
docker compose --profile pico pull --quiet >nul 2>&1
if errorlevel 1 echo   geen verbinding met de server, ik start de versie die op deze laptop staat.
docker compose --profile pico up -d
if errorlevel 1 (
  echo.
  echo Starten mislukt. Draait Docker Desktop? Anders: diagnose.cmd en de zip naar de docent.
  pause
  exit /b 1
)
docker image prune -f >nul 2>&1
echo.
echo Bello start op (eerste keer: images ophalen, een paar minuten). De pagina ververst zichzelf.
start "" http://localhost:8000
