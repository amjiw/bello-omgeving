@echo off
rem Haalt de nieuwste versie van de Bello-omgeving op en herstart. Je mijn_code.py blijft staan.
rem Internet nodig; meestal een paar megabytes, alleen bij grote wijzigingen meer.
cd /d "%~dp0"
if not exist .env copy .env.example .env >nul
echo Nieuwste docker-compose.yml ophalen...
curl -fsSL -o docker-compose.nieuw https://raw.githubusercontent.com/amjiw/bello-omgeving/main/docker-compose.yml
if exist docker-compose.nieuw (
  move /y docker-compose.nieuw docker-compose.yml >nul
) else (
  echo   geen verbinding met GitHub, ik gebruik de huidige docker-compose.yml
)
echo Nieuwste versie ophalen...
docker compose --profile pico pull
if errorlevel 1 (
  echo.
  echo Ophalen mislukt. Internet? Docker Desktop? Anders: diagnose.cmd en de zip naar de docent.
  pause
  exit /b 1
)
docker compose --profile pico up -d
docker image prune -f >nul
echo.
echo Bijgewerkt. Open http://localhost:8000 en kijk onder "wat is er nieuw".
start "" http://localhost:8000
pause
