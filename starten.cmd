@echo off
rem Start de Bello-omgeving met de Pico-emulator (Docker Desktop moet draaien) en opent de startpagina.
rem Controleert eerst of de docent een nieuwe versie heeft uitgebracht; zonder internet slaat hij dat over.
cd /d "%~dp0"
if not exist .env copy .env.example .env >nul
rem Draait er al een andere Bello-omgeving (andere map)? Dan botsen de poorten.
for %%d in ("%~dp0.") do set "MAP=%%~nxd"
set "BEZET="
for /f "delims=" %%n in ('docker ps --filter "publish=8000" --format "{{.Names}}" 2^>nul') do set "BEZET=%%n"
if defined BEZET (
  echo %BEZET% | findstr /b /c:"%MAP%-" >nul
  if errorlevel 1 (
    echo.
    echo Er draait al een andere Bello-omgeving op deze laptop: %BEZET%
    echo Stop die eerst ^(stoppen.cmd in die map, of in Docker Desktop^) en start dan opnieuw.
    pause
    exit /b 1
  )
)
echo Controleren op een nieuwe versie (zonder internet: overgeslagen)...
docker compose --profile pico pull --quiet >nul 2>&1
if errorlevel 1 echo   geen verbinding met de server, ik start de versie die op deze laptop staat.
docker compose --profile pico up -d
if errorlevel 1 (
  echo.
  echo Starten mislukt. Draait Docker Desktop? Staat er "port is already allocated", dan draait er
  echo al een andere Bello-omgeving: stop die eerst. Anders: diagnose.cmd en de zip naar de docent.
  pause
  exit /b 1
)
docker image prune -f >nul 2>&1
echo.
echo Bello start op (eerste keer: images ophalen, een paar minuten). De pagina ververst zichzelf.
start "" http://localhost:8000
