# Bello-omgeving

De werkomgeving voor het vak **Programmeren & Mechatronica** (HBO Werktuigbouwkunde): de
simulator met robothond Bello, een code-editor, de AI-tutor en een Pico-emulator, samen in
Docker-containers op je eigen laptop. Je werkt in de browser.

**Download:** [bello-omgeving.zip](https://github.com/amjiw/bello-omgeving/releases/latest/download/bello-omgeving.zip)
(altijd de nieuwste versie; de zip zelf is klein, de images komen bij de eerste start binnen).

1. Installeer [Docker Desktop](https://www.docker.com/products/docker-desktop/) en start het.
2. Pak de zip uit op een vaste plek, bijvoorbeeld `C:\dev\bello-omgeving`.
3. Open de uitgepakte map `bello-omgeving` en dubbelklik daar op `starten.cmd`. De eerste keer
   haalt hij ongeveer 3,5 GB op.
4. De browser opent `http://localhost:8000`.

De volledige installatiehandleiding staat online op https://amjiw.github.io/bello-omgeving/handleiding.html (en in de zip als
`handleiding.html`). De cursuspagina van het vak (leeruitkomsten, weken, opdrachten, beoordeling):
https://amjiw.github.io/bello-omgeving/. Nieuwe versie ophalen: `bijwerken.cmd`. Gaat er iets mis:
`diagnose.cmd` maakt een zip voor de docent.

De images staan op `ghcr.io/amjiw/bello-cursus` en `ghcr.io/amjiw/bello-velxio`. Deze repo
bevat alleen de bestanden die een student nodig heeft; de bron van de omgeving wordt door de
docent beheerd.

<p align="right"><img src="https://amjiw.github.io/bello-omgeving/media/nhl_stenden.png" width="110" alt="NHL Stenden university of applied sciences"></p>
