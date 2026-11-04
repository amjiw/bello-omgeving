# Bello-omgeving: zo start je

Alles wat je voor de cursus nodig hebt (de simulator met Bello, de code-editor, de AI-tutor
en de Pico-emulator) draait in Docker-containers op je eigen laptop. Je werkt in de browser.

## Wat je laptop nodig heeft

- Windows 10/11 64-bits (of macOS/Linux), 8 GB werkgeheugen of meer, 15 GB vrije schijfruimte.
- Virtualisatie aan in de BIOS (staat bij vrijwel elke laptop al aan).
- Eenmalig adminrechten om Docker Desktop te installeren.
- Mac met Apple Silicon (M1 en nieuwer): werkt, maar de simulatie is traag. Meld het bij de docent.

## Eenmalig installeren (15 minuten, internet nodig)

1. Installeer **Docker Desktop** van https://www.docker.com/products/docker-desktop/ en start het
   één keer op (op Windows vraagt het om WSL2; laat het dat zelf regelen en herstart als hij dat vraagt).
2. Download de zip via https://github.com/amjiw/bello-omgeving/releases/latest/download/bello-omgeving.zip
   (als je dit leest heb je hem al) en pak hem uit op een vaste plek, bijvoorbeeld
   `Documenten\bello-omgeving`. Verplaats de map daarna niet meer.
3. Open in de Verkenner de uitgepakte map `bello-omgeving` (daar staan de knoppen `starten.cmd`,
   `stoppen.cmd`, `bijwerken.cmd` en `diagnose.cmd`) en dubbelklik op **`starten.cmd`**. De eerste
   keer haalt hij ongeveer 3,5 GB op (doe dit thuis of op het schoolnetwerk, niet via je telefoon);
   daarna start hij in een halve minuut. De browser
   opent `http://localhost:8000` met de kaarten: Bello in 3D, je code, de AI-tutor, Bello op
   afstand en de Pico in de browser.
4. Klik op kaart 2, open `mijn_code.py`, verander een getal, druk F5. Bello doet wat je typt.
5. Klik op kaart 5: de Pico-emulator (Velxio) opent met het Bello-project, al bedraad. Druk op
   Run: de LED-ogen gaan aan en elke `CMD:`-regel in de seriële monitor wordt een beweging van
   Bello in het 3D-tabblad.

De AI-tutor heeft een gratis Groq-sleutel nodig; dat regelen we in de workshop van week 3.
Tot die tijd mag `.env` leeg blijven.

## Dagelijks gebruik

| Wat | Hoe |
|---|---|
| Starten | `starten.cmd` (Docker Desktop moet draaien) |
| Stoppen | `stoppen.cmd`, of de container stoppen in Docker Desktop |
| Nieuwe versie van de docent ophalen | `bijwerken.cmd` (je eigen code blijft staan) |
| Het gaat mis | `diagnose.cmd` maakt een zip; stuur die naar de docent |
| Lokale AI aan/uit (alleen met 16 GB RAM) | `ai_lokaal_aan.cmd` / `ai_lokaal_uit.cmd` |

Je code staat veilig in een Docker-volume (`max_werk`). Een nieuwe versie van de omgeving
raakt die niet; alleen `docker compose down -v` wist hem, en dat doe je nooit zomaar.

## Als het niet werkt

- **"docker: command not found" of een rode foutmelding meteen**: Docker Desktop draait niet.
  Start het via het startmenu en wacht tot het walvis-icoon rustig is.
- **De pagina op localhost:8000 blijft leeg**: wacht een halve minuut en ververs; de simulator
  start als laatste.
- **Bello beweegt niet na opslaan**: kijk in het console-paneel onder het 3D-beeld. Een rode
  regel is een fout in je code; de tutor helpt die lezen.
- **De Pico-emulator beweegt Bello niet**: Bello luistert pas als `mijn_code.py` klaar is
  (console: `[Bello/pico] klaar`). Druk F12 op de Velxio-pagina: daar hoort
  `[max-hook] verbonden met brug` te staan.
- **Alles anders**: `diagnose.cmd`, zip naar de docent, met erbij wat je deed en wat je verwachtte.

Welke versie je hebt staat onderaan de startpagina, met de lijst "wat is er nieuw".
