@echo off
rem Verzamelt versie, logboeken en je code in een zip voor de docent. Je .env (sleutels) gaat NIET mee.
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0diagnose.ps1"
pause
