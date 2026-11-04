@echo off
rem Start de Bello-omgeving met de Pico-emulator (Docker Desktop moet draaien) en opent de startpagina.
cd /d "%~dp0"
if not exist .env copy .env.example .env >nul
docker compose --profile pico up -d
if errorlevel 1 (
  echo.
  echo Starten mislukt. Draait Docker Desktop? Anders: diagnose.cmd en de zip naar de docent.
  pause
  exit /b 1
)
echo.
echo Bello start op (eerste keer: images ophalen, een paar minuten). De pagina ververst zichzelf.
start "" http://localhost:8000
