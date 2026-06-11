# Changelog

## 0.1.11 - 2026-06-11

### Geaendert

- EXE2 wird beim Patchen lokal aus dem vorhandenen EXE-Ordner aufgebaut; danach werden nur noch abweichende EXE2-Overlay-Dateien installiert.
- GameLauncher.exe und .log-Dateien werden weder aus dem Patch installiert noch beim lokalen EXE2-Aufbau uebernommen.
- Der oeffentliche DE-Patch enthaelt fuer EXE2 nur noch die wirklich abweichenden Overlay-Dateien.

Alle relevanten Projektänderungen werden hier dokumentiert.

## 0.1.10 - 2026-06-11

### Hinzugefügt

- Die Oberfläche enthält jetzt einen Button zum Starten des Crossfire Launchers mit Warnhinweis, dass der deutsche Patch dabei entfernt oder überschrieben werden kann.
- Die Launcher-Version wird zentral gepflegt und in der Titelleiste, Sidebar und About-Ansicht angezeigt.

### Behoben

- Spielzeit-Statistiken ignorieren offensichtlich verwaiste Sessions über 12 Stunden und reparieren bereits gespeicherte unrealistische Einträge.

### Geändert

- FLRocket kann ein DE-Patch-ZIP aus einem älteren GitHub Release verwenden, wenn das neueste Launcher-Release selbst kein Patch-ZIP enthält.

## 0.1.9 - 2026-06-11

### Hinzugefügt

- Der Launcher-Selbstupdate-Download zeigt jetzt Fortschritt, geladene Datenmenge, Geschwindigkeit und ETA in der Sidebar an.
- Der DE-Patch-Archivdownload zeigt jetzt Datenmenge, Downloadgeschwindigkeit und ETA in der Update-Ansicht an.

### Geändert

- Der im Launcher angezeigte Changelog wurde aktualisiert.

## 0.1.8 - 2026-06-11

### Geändert

- Große DE-Patch-Updates werden jetzt bevorzugt aus einem GitHub-Release-ZIP geladen, statt tausende Einzeldateien direkt aus dem Repository anzufordern.
- Das Release enthält ein versioniertes `FLRocket-DE-Patch-<version>.zip` mit den Daten aus dem öffentlichen `DE`-Ordner.
- Der Launcher entpackt das Patch-Archiv zuerst in den lokalen Cache und installiert danach weiterhin nur Manifest-geprüfte Dateien in den Spielordner.
- Falls kein passendes Patch-Archiv im Release vorhanden ist, kann der Launcher weiterhin einzelne fehlende Dateien aus GitHub nachladen.

### Verbessert

- Die Update-Oberfläche zeigt eigene Statusmeldungen für Archiv-Download und Archiv-Entpacken.

## 0.1.7 - 2026-06-06

### Geändert

- README im privaten Projekt und im öffentlichen GitHub-Repository vereinheitlicht.
- README dokumentiert klar, dass FLRocket kein offizieller Crossfire Launcher ist und nur für den deutschen Singleplayer-Patch gedacht ist.
- Die Oberfläche zeigt den Hinweis ebenfalls auf der Home-Ansicht und im About-Bereich.
- Die Update-Anzeige unterscheidet zwischen Download und Kopieren aus dem Cache.

### Behoben

- Beim Kopieren bereits vorhandener Cache-Dateien bleibt die UI nicht mehr bei 0 Dateien stehen.

## 0.1.6 - 2026-06-06

### Geändert

- Crossfire-DE-Dateien werden direkt aus `flathack/FLRocket` auf GitHub geladen.
- Das Manifest wird von `DE/files.json` gelesen; einzelne Dateien werden aus `DE/<Pfad>` heruntergeladen.
- Launcher-Selbstupdates werden aus GitHub Releases geladen und nur für höhere Versionen angewendet.
- Sichtbare Update-Texte verweisen auf GitHub.

### Entfernt

- Provider-spezifische Spieldatei-Downloadlogik und `file_id`-Abhängigkeit im Manifest.

## 0.1.5 - 2026-06-05

### Behoben

- Der Start-/Update-Button bleibt im festen 960x600-Launcherfenster sichtbar.
- Die Home-Übersicht nutzt kompaktere Dashboard-Spalten.
- Lange Launcher-Pfade und Statistikwerte werden kompakter dargestellt.

## 0.1.4 - 2026-06-05

### Hinzugefügt

- Spielzeit-Statistiken zeichnen Gesamtspielzeit, Anzahl der Sessions und längste Session auf.
- Die Übersicht zeigt die aktuellen Spielzeit-Statistiken direkt im Launcher.
- Der Launcher sucht eigene Updates in versionierten Remote-Release-Daten.

### Geändert

- Launcher-Self-Updates werden still im Hintergrund heruntergeladen und beim Beenden über einen versteckten Helper angewendet.
- Die Self-Updater-Version wird aus der Cargo-Paketversion gelesen.
- Offene Spielsessions werden beim nächsten Prozesscheck sauber abgeschlossen.

## 0.1.3 - 2026-06-05

### Geändert

- Der Launcher kann das Spiel auch starten, wenn Updates ausstehen.
- Bei ausstehenden Updates gibt es getrennte Aktionen für Update und Start ohne Update.
- Downloads werden zuerst unter `%LOCALAPPDATA%\RocketLauncher\cache` zwischengespeichert und danach aus dem Cache in den Spielordner kopiert.
- Bereits gültige Cache-Dateien werden wiederverwendet.
- `.log`-Dateien werden beim Manifest-Abgleich ignoriert.
- Die Oberfläche hat einen animierten Sternenhintergrund und Reduced-Motion-Unterstützung erhalten.

## 0.1.2 - 2026-06-02

### Geändert

- Der Launcher prüft weiterhin `EXE\Freelancer.exe`.
- Der Spielstart verwendet `EXE2\Freelancer.exe`.

## 0.1.1 - 2026-06-02

### Geändert

- Der Launcher verwendet den eigenen Programmordner als festen Freelancer-Hauptordner.
- Freelancer wird nur noch über `EXE\Freelancer.exe` im Launcher-Ordner gesucht.
- Die manuelle Ordnerwahl wurde aus den Einstellungen entfernt.
- Die alte Hero-Kennzeichnung wurde entfernt.
- Die App zeigt "Launcher by FlatHack" an.
- Die Einstellungen enthalten 10 auswählbare Themes.
- Provider-Bezeichnungen wurden aus der sichtbaren Programmoberfläche entfernt.

## 0.1.0 - 2026-06-02

### Hinzugefügt

- Erste Version des FLRocket Launchers.
- Manifest-basierte Dateiprüfung und Synchronisation.
- Direkter Spielstart aus dem Launcher.
- Changelog-Ansicht, Einstellungen und About-Seite.
- Mehrsprachige Oberfläche für Deutsch und Englisch.
