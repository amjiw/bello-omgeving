@echo off
rem Lokale AI (motor 3) uitzetten: stopt de ollama-container. Het model blijft op schijf
rem (volume), dus aanzetten gaat daarna zonder download. Geheugen: 0 MB.
cd /d "%~dp0"
docker compose --profile ai-lokaal stop ollama
echo.
echo Lokale AI staat uit. Motor 1 en 2 (cloud) werken gewoon door. Weer aan: ai_lokaal_aan.cmd
pause
