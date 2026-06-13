# FLRocket

FLRocket ist ein schlanker Freelancer Launcher und universeller Übersetzungshelfer. Er bleibt mit dem deutschen Crossfire-Singleplayer-Patch kompatibel und kann weitere Mod-Übersetzungen über einen öffentlichen Katalog erkennen.

> **Wichtiger Hinweis**
>
> FLRocket ist **nicht** der offizielle Crossfire Launcher und steht in keiner offiziellen Verbindung zum Crossfire-Team oder Crossfire-Projekt. Er ersetzt nicht den offiziellen Multiplayer-Launcher.

## Was FLRocket macht

- Prüft die Spielinstallation im selben Ordner wie der Launcher.
- Erwartet die originale Spielstruktur im Hauptordner.
- Lädt Crossfire-Deutschdaten über öffentliche GitHub-Release-ZIPs und öffentliche Patch-Metadaten.
- Startet die gepatchte Spielversion aus dem Patch-Ordner.
- Hält lokale Dateien über das Manifest `DE/files.json` aktuell.
- Verwendet einen lokalen Cache, damit bereits geladene Dateien nicht erneut heruntergeladen werden müssen.
- Erkennt verfügbare Freelancer-Mod-Übersetzungen über `translator-catalog.json`.
- Bereitet Text-/Infocard-Hook-Overlays und optionale Datei-/Audio-Patches vor, wenn ein Übersetzungspaket diese Komponenten bereitstellt.
- Nutzt bei Crossfire im universellen Translator Text/Infocards über den Client Hook; das Crossfire-Dateipaket enthält dort nur Audio-Daten und FLRocket-spezifische EXE2-Dateien.
- Startet Hook-Overlays aus dem FLRocket-Cache und installiert den kleinen Hook-Loader im gewählten Spielordner, solange eine Hook-Übersetzung aktiv ist. Mit `Original` entfernt FLRocket den Hook-Loader wieder.

## Installation

Lade die neueste FLRocket-Version aus den Releases herunter und lege die Datei direkt in deinen Crossfire-Hauptordner, zum Beispiel:

```text
Crossfire\FLRocket.exe
```

Der Launcher muss direkt im Hauptordner liegen. Die originale Spielstruktur muss vorhanden sein, damit FLRocket die Installation erkennen und den Patch korrekt anwenden kann.

Beim Start prüft FLRocket die vorhandenen Dateien, vergleicht sie mit dem GitHub-Manifest und lädt fehlende oder veränderte Patch-Dateien automatisch nach.

Bei katalogbasierten Übersetzungen wie Reforged lädt FLRocket das ausgewählte Hook-Paket, prüft es, bereitet es im lokalen FLRocket-Cache vor, trägt den Hook-Loader in `EXE\dacom.ini` ein und startet Freelancer mit dem vorbereiteten Overlay-Pfad. Bei Crossfire wird derselbe Hook-Weg für Texte verwendet; zusätzlich kann FLRocket die deutschen Audio-Dateien und die EXE2-Startumgebung vorbereiten.

## Datenquelle

Die Patch-Metadaten liegen im öffentlichen Repository. Die eigentlichen Sprachdateien werden als Release-ZIP veröffentlicht:

```text
https://raw.githubusercontent.com/flathack/FLRocket/main/DE/files.json
https://raw.githubusercontent.com/flathack/FLRocket/main/language-patches.json
https://raw.githubusercontent.com/flathack/FLRocket/main/translator-catalog.json
```

Launcher-Releases werden hier veröffentlicht:

```text
https://github.com/flathack/FLRocket/releases
```

## Statusanzeige

FLRocket zeigt beim Aktualisieren getrennt an, ob Dateien gerade heruntergeladen oder aus dem lokalen Cache in den Spielordner kopiert werden. Dadurch bleibt der Fortschritt auch dann nachvollziehbar, wenn viele Dateien bereits lokal vorhanden sind.

## Credits

Launcher by FlatHack.
