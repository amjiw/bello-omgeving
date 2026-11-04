# Wat is er nieuw

Nieuwste bovenaan. Bijwerken: dubbelklik op `bijwerken.cmd` (je eigen `mijn_code.py` blijft staan).

## 2026.11.04e - handleiding en cursus van acht weken

- Handleiding: foto van Bello op pagina 1, uitleg van logboek (knop via tegel 3) en kennismap.
- Tutor-kennisbank: de cursus in de nieuwe vorm (acht practica, project in viertallen, assessment in week 9).

## 2026.11.04d - opmaak en kennisbank

- Startpagina: de links "de standaardviewer" en "de consolepagina" vielen buiten tegel 1 en 2.
- Tutor-kennisbank: de cursuspagina met de nieuwe sectie "De Bello-omgeving op je laptop" en de aangepaste week 1.

## 2026.11.04c - updates vanzelf

- `starten.cmd` controleert bij elke start of er een nieuwe versie is en haalt die op (zonder internet: overgeslagen).
- De startpagina meldt het als er een nieuwere versie is dan die op je laptop draait.

## 2026.11.04b - na de eerste test op een studentlaptop

- Startpagina: tegel "Bello op afstand (MQTT)" weg; Bello luistert toch al vanzelf. De Pico-tegel is nu nummer 4.
- Startpagina: link naar de handleiding, naast de versie.
- Tutor zonder sleutel: duidelijke melding met de stappen voor de Groq-sleutel, technische regel alleen bij een echte storing.
- 3D-beeld: de camera staat bij het starten meteen op Bello gericht, iets van opzij zodat je hem ziet lopen; schuiven is niet meer nodig.
- Handleiding: bij een zwart 3D-beeld eerst Ctrl+Shift+R (verversen zonder cache).
- Fout opgelost: na de Stop-knop reageerde Bello niet meer op de Pico-emulator (de luisterlus kreeg een Bello zonder de speelse commando's en crashte bij `geef_poot`). Ook blijft de simulatie nu bereikbaar als het luisteren onverhoopt misgaat.

## 2026.11.04 - eerste uitgave

- Bello in 3D, de editor met Run/Pauze/Stop/Snel, de console met geluid.
- AI-tutor die hints geeft, geen antwoorden (Tutor-tabblad, Ctrl+L in de editor, `opencode`).
- Bello luistert naar MQTT zodra `mijn_code.py` klaar is (Pico W of de Pico-emulator).
- Pico-emulator (Velxio) in de browser met het Bello-project, al bedraad; `starten.cmd` start hem mee.
- Versienummer op de startpagina en in het startlog; `bijwerken.cmd` en `diagnose.cmd`.
