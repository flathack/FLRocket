# FLRocket

[English README](README.en.md)

FLRocket ist ein kleiner Launcher für Freelancer-Mods mit Übersetzungspaketen.
Für Crossfire kann FLRocket den Singleplayer auf Deutsch starten, ohne dass du
selbst Dateien suchen, kopieren oder patchen musst.

Wichtig: FLRocket ist ein Community-Projekt von FlatHack und kein offizieller
Crossfire Launcher.

## Kurzfassung

1. Installiere Crossfire zuerst ganz normal und teste, ob es auf Englisch läuft.
2. Lade aus den [FLRocket Releases](https://github.com/flathack/FLRocket/releases/latest) die portable ZIP herunter, zum Beispiel `FLRocket-v0.5.0-portable.zip`.
3. Entpacke die ZIP in deinen Crossfire-Hauptordner.
4. Starte `FLRocket.exe` und bestätige die Windows-Abfrage für Administratorrechte.
5. Wähle im Launcher `Deutsch`.
6. Klicke auf `SINGLEPLAYER`.
7. Warte beim ersten Start, bis FLRocket die Übersetzung heruntergeladen und vorbereitet hat.

Mehr musst du normalerweise nicht tun.

## Schritt für Schritt

### 1. Crossfire zuerst normal testen

Installiere Freelancer Crossfire so, dass es ohne FLRocket korrekt startet.

Bitte teste vorher:

- Crossfire startet auf Englisch.
- Singleplayer funktioniert.
- Multiplayer funktioniert, falls du Multiplayer spielen möchtest.

Wenn Crossfire schon ohne FLRocket nicht korrekt startet, kann FLRocket das
nicht reparieren.

### 2. FLRocket herunterladen

Öffne die aktuelle Release-Seite:

[FLRocket Releases](https://github.com/flathack/FLRocket/releases/latest)

Lade dort die portable ZIP herunter. Bei Version 0.5.0 heißt sie:

```text
FLRocket-v0.5.0-portable.zip
```

Du findest die Datei auf GitHub unten im Bereich `Assets`. Lade nicht
`Source code (zip)` oder `Source code (tar.gz)` herunter.

Bei neueren Versionen kann die Zahl im Dateinamen höher sein.

Du brauchst nicht die Übersetzungs-ZIPs herunterzuladen. Diese Dateien lädt
FLRocket später automatisch.

### 3. ZIP in den Crossfire-Hauptordner entpacken

Entpacke die ZIP direkt in den Hauptordner deiner Crossfire-Installation.

Beispiel:

```text
C:\Freelancer Crossfire
```

Der richtige Ordner ist der Ordner, in dem auch der Ordner `EXE` liegt.

Nach dem Entpacken sollten diese Dateien im Crossfire-Hauptordner liegen:

```text
FLRocket.exe
WebView2Loader.dll
EXE\
DATA\
```

Nicht in den `EXE`-Ordner entpacken.

### 4. FLRocket starten

Starte:

```text
FLRocket.exe
```

Windows fragt beim Start nach Administratorrechten. Das ist erforderlich,
damit FLRocket den Crossfire Launcher und Freelancer mit denselben Rechten
starten kann.

Wenn du möchtest, kannst du dir danach eine Desktop-Verknüpfung auf
`FLRocket.exe` anlegen.

### 5. Sprache auswählen und Spiel starten

Wähle im Launcher die Sprache `Deutsch` aus und klicke auf `SINGLEPLAYER`.

Beim ersten Start passiert im Hintergrund etwas mehr:

- FLRocket lädt die aktuelle deutsche Übersetzung von GitHub herunter.
- Das kann etwas dauern, weil auch deutsche Audiodateien enthalten sind.
- FLRocket erstellt Backups von Dateien, die es ersetzen muss.
- FLRocket kopiert die deutschen Audiodateien in den Crossfire-Ordner.
- FLRocket richtet den Client-Hook für die deutschen Texte ein.
- Danach startet Crossfire automatisch im Singleplayer.

Beim nächsten Start geht es schneller, weil die Dateien schon im lokalen Cache
liegen.

## Wie funktioniert die Übersetzung?

Die Crossfire-Übersetzung besteht aus zwei Teilen.

### Texte im Spiel

Die meisten Texte werden nicht direkt in die Crossfire-Dateien geschrieben.
Stattdessen nutzt FLRocket einen Client-Hook.

Einfach gesagt:

- Crossfire lädt im Spiel einen englischen Text.
- Der Client-Hook erkennt diesen Text im Arbeitsspeicher.
- Der Hook ersetzt ihn direkt im RAM durch den deutschen Text.

Dadurch müssen die meisten englischen Textdateien im Crossfire-Ordner nicht
dauerhaft verändert werden.

### Audio und direkte Dateien

Einige Dateien, zum Beispiel deutsche Audiodateien, müssen wirklich in den
Crossfire-Ordner kopiert werden.

FLRocket erstellt dafür vorher Backups und kann diese Änderungen wieder
zurücksetzen.

## Wo liegen die deutschen Texte?

Als normaler Nutzer musst du diese Dateien nicht selbst herunterladen.

Technisch liegen die Übersetzungspakete in den GitHub Releases. FLRocket liest
den Katalog aus diesem Repository und lädt die passenden Pakete automatisch.

Für Crossfire Deutsch ist vor allem diese Datei wichtig:

```text
overlay.json
```

Diese Datei steckt im Hook-Paket und enthält die deutschen Textdaten für den
Client-Hook.

## Multiplayer und Originalzustand

FLRocket ist für die Übersetzung im Singleplayer gedacht.

Wenn du Multiplayer spielen möchtest, starte Crossfire wie gewohnt ohne die
deutsche FLRocket-Übersetzung.

Im FLRocket-Launcher gibt es außerdem:

- `Original`: startet ohne aktive Übersetzung.
- `Reset`: setzt FLRocket-Änderungen an der Installation wieder zurück.

Der temporäre `EXE2`-Ordner von Crossfire wird vom Crossfire Launcher selbst
erstellt und nach dem Spielen wieder entfernt. FLRocket muss dort nichts
manuell reparieren.

## Wenn etwas nicht funktioniert

### FLRocket findet Crossfire nicht

Prüfe, ob `FLRocket.exe` im richtigen Ordner liegt.

Richtig:

```text
C:\Freelancer Crossfire\FLRocket.exe
C:\Freelancer Crossfire\EXE\Freelancer.exe
```

Falsch:

```text
C:\Freelancer Crossfire\EXE\FLRocket.exe
```

### `WebView2Loader.dll` fehlt

Entpacke die portable ZIP noch einmal vollständig.

`FLRocket.exe` und `WebView2Loader.dll` müssen nebeneinander liegen.

### Der erste Start dauert lange

Das ist normal. Beim ersten Start werden die Übersetzungspakete von GitHub
geladen. Durch die deutschen Audiodateien ist der Download größer als nur ein
paar Textdateien.

### Ich möchte alles rückgängig machen

Nutze im Launcher den Bereich `Übersetzung` und klicke dort auf `Reset`.

## Verfügbare Übersetzungen

| Mod | Sprachen |
| --- | --- |
| Freelancer Crossfire | Deutsch, Französisch |
| Freelancer Reforged | Deutsch, Russisch, Tschechisch |

Wenn eine Sprache im Launcher nicht angezeigt wird, gibt es dafür aktuell noch
kein passendes Übersetzungspaket.

## Credits

Launcher by FlatHack.
