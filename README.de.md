# FLRocket

FLRocket ist ein schlanker Launcher fuer den deutschen Crossfire-Singleplayer-Patch.

> **Wichtiger Hinweis**
>
> FLRocket ist **nicht** der offizielle Crossfire Launcher und steht in keiner offiziellen Verbindung zum Crossfire-Team oder Crossfire-Projekt. Der Launcher ist ausschliesslich fuer den deutschen Singleplayer-Patch gedacht und ersetzt nicht den offiziellen Multiplayer-Launcher.

## Was FLRocket macht

- Prueft die Spielinstallation im selben Ordner wie der Launcher.
- Erwartet die originale Spielstruktur im Hauptordner.
- Laedt die deutschen Patch-Dateien direkt aus dem oeffentlichen GitHub-Repository.
- Startet die gepatchte Spielversion aus dem Patch-Ordner.
- Haelt lokale Dateien ueber das Manifest `DE/files.json` aktuell.
- Verwendet einen lokalen Cache, damit bereits geladene Dateien nicht erneut heruntergeladen werden muessen.

## Installation

Lade die neueste FLRocket-Version aus den Releases herunter und lege die Datei direkt in deinen Crossfire-Hauptordner, zum Beispiel:

```text
C:\Crossfire\FLRocket.exe
```

Der Launcher muss direkt im Hauptordner liegen. Die originale Spielstruktur muss vorhanden sein, damit FLRocket die Installation erkennen und den Patch korrekt anwenden kann.

Beim Start prueft FLRocket die vorhandenen Dateien, vergleicht sie mit dem GitHub-Manifest und laedt fehlende oder veraenderte Patch-Dateien automatisch nach.

## Datenquelle

Die Patch-Dateien liegen im oeffentlichen Repository unter:

```text
https://github.com/flathack/FLRocket/tree/main/DE
```

Launcher-Releases werden hier veroeffentlicht:

```text
https://github.com/flathack/FLRocket/releases
```

## Statusanzeige

FLRocket zeigt beim Aktualisieren getrennt an, ob Dateien gerade heruntergeladen oder aus dem lokalen Cache in den Spielordner kopiert werden. Dadurch bleibt der Fortschritt auch dann nachvollziehbar, wenn viele Dateien bereits lokal vorhanden sind.

## Credits

Launcher by FlatHack.
