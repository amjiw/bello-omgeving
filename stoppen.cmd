@echo off
rem Stopt de Bello-omgeving. Je code en instellingen blijven bewaard (Docker-volume max_werk).
cd /d "%~dp0"
docker compose --profile pico --profile ai-lokaal stop
echo.
echo Gestopt. Weer starten: starten.cmd
pause
