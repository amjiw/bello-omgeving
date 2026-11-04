@echo off
rem Lokale AI (motor 3) aanzetten: start de ollama-container naast de Bello-container.
rem De eerste keer haalt hij het model op (eenmalig internet, ~3,4 GB). Daarna offline.
cd /d "%~dp0"
docker compose --profile ai-lokaal up -d ollama
echo.
echo Lokale AI staat aan. In de editor-terminal: opencode, dan /models -^> "3. Ollama lokaal".
echo Na 3 minuten zonder gebruik gaat het model vanzelf uit het geheugen; de container blijft klein.
echo Helemaal uit: ai_lokaal_uit.cmd
pause
