# Changelog

Alle relevanten Projektänderungen werden hier dokumentiert.

## 0.2.2 - 2026-06-14

### Geändert

- Crossfire startet im Universal-Translator-Modus jetzt über den offiziellen `EXE/GameLauncher.exe`.
- Crossfire wird auch erkannt, wenn der Beta-Launcher noch nicht im `EXE`-Ordner liegt.

### Hinzugefügt

- Wenn `EXE/GameLauncher.exe` fehlt, zeigt FLRocket eine einfache Download-Hilfe mit Bild, Link und Kopierziel an.

## 0.2.1 - 2026-06-14

### Hinzugefügt

- Russische Textübersetzung für Freelancer Reforged als Hook-Paket ergänzt.
- Russische Freelancer-Reforged-Font-Konfiguration ergänzt, damit HUD/UI kyrillische Zeichen anzeigen kann.

### Geändert

- Direkte Translator-Dateipatches sichern vorhandene Originaldateien und stellen sie beim Wechsel auf `Original` oder eine andere Sprache wieder her.
- Crossfire-DE-Hook-Übersetzung mit den neuesten manuell korrigierten Textressourcen aktualisiert.
- Crossfire-DE-Übersetzung temporär aus dem öffentlichen FLRocket-Katalog und den GitHub-Assets entfernt; lokale Archivkopie bleibt für spätere Wiederverwendung erhalten.
- Crossfire-DE-Übersetzung wieder als aktuelles Hook- und Audio-Paket veröffentlicht; das Dateipaket enthält keine `EXE2`-Dateien mehr und nutzt Original-Audio-Backup/Restore.
- Französische Crossfire-Textübersetzung als Hook-Paket ergänzt.

## 0.2.0 - 2026-06-13

### Hinzugefügt

- Universeller Translator-Modus für Freelancer-Mods.
- Client-Hook-Übersetzungen können pro erkanntem Mod und Sprache vorbereitet werden.
- Sprachauswahl enthält jetzt `Original`, um ohne Hook und ohne Übersetzung in der Mod-Originalsprache zu starten.
- App-Oberfläche kann auf Deutsch, Englisch und Russisch umgestellt werden.
- Portable Build-Skript erzeugt `release/FLRocket.exe` ohne Installer.
- Öffentlicher Root-Changelog wird aus GitHub geladen.

### Geändert

- Changelog wird zentral aus der Root-`CHANGELOG.md` des öffentlichen GitHub-Repositories geladen.
- Startseite wurde vereinfacht und zeigt nur noch die wichtigsten Aktionen.
- `Über` wurde aus der Sidebar in die Titelleiste verschoben.
- App-Updater bevorzugt portable ZIP-Assets, damit `WebView2Loader.dll` zusammen mit `FLRocket.exe` aktualisiert wird.
- Crossfire nutzt im universellen Translator-Modus Hook-Textübersetzungen; das Dateipaket enthält nur noch Audio und FLRocket-spezifische EXE2-Dateien.

### Behoben

- Weißer Fensterrand und überlaufender Startbutton im rahmenlosen Launcher-Fenster.
- Über-Ansicht bleibt bei kleineren Fensterhöhen scrollbar und schneidet den Text nicht mehr ab.
- Crossfire startet mit Hook-Unterstützung für dynamische Textübersetzungen.
- Fortschritt wird auch beim Kopieren und Vorbereiten von Übersetzungspaketen aktualisiert.
- Deutsche UI- und Backend-Meldungen verwenden echte Umlaute statt `ae`, `oe` oder `ue`.

## 0.1.14 - 2026-06-12

### Hinzugefügt

- Neuer Repair-Button zum Löschen von EXE2 und erneuten Anwenden des DE-Patches.

## 0.1.13 - 2026-06-11

### Behoben

- Beim Neuaufbau von EXE2 werden lokale DirectX-Wrapper-Dateien aus EXE ausgelassen, die in der originalen EXE2-Struktur nicht vorhanden waren und Startfehler mit d3d10.dll auslösen können.

## 0.1.12 - 2026-06-11

### Behoben

- Gepatchte DLL-Dateien aus dem EXE-Ordner werden beim Update auch in den neu aufgebauten EXE2-Ordner gespiegelt.

## 0.1.11 - 2026-06-11

### Geändert

- EXE2 wird beim Patchen lokal aus dem vorhandenen EXE-Ordner aufgebaut; danach werden nur noch abweichende EXE2-Overlay-Dateien installiert.
- GameLauncher.exe und .log-Dateien werden weder aus dem Patch installiert noch beim lokalen EXE2-Aufbau übernommen.
- Der öffentliche DE-Patch enthält für EXE2 nur noch die wirklich abweichenden Overlay-Dateien.

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

- Der im Launcher angezeigte Changelog wird im öffentlichen DE-Datenbestand aktualisiert, damit Nutzer die aktuellen Änderungen direkt in der App sehen.

## 0.1.8 - 2026-06-11

### Geändert

- Große DE-Patch-Updates werden jetzt bevorzugt aus einem GitHub-Release-ZIP geladen, statt tausende Einzeldateien direkt aus dem Repository anzufordern.
- Das Release enthält ein versioniertes `FLRocket-DE-Patch-<version>.zip` mit den Daten aus dem öffentlichen `DE`-Ordner.
- Der Launcher entpackt das Patch-Archiv zuerst in den lokalen Cache und installiert danach weiterhin nur Manifest-geprüfte Dateien in den Spielordner.
- Falls kein passendes Patch-Archiv im Release vorhanden ist, kann der Launcher weiterhin einzelne fehlende Dateien aus GitHub nachladen.

### Verbessert

- Die Update-Oberfläche zeigt nun eigene Statusmeldungen für Archiv-Download und Archiv-Entpacken.

## 0.1.7 - 2026-06-06

### Geändert

- README im privaten Projekt und im öffentlichen GitHub-Repository vereinheitlicht.
- README dokumentiert jetzt klar, dass FLRocket kein offizieller Crossfire Launcher ist und nur für den deutschen Singleplayer-Patch gedacht ist.
- Die Oberfläche zeigt den Hinweis ebenfalls auf der Home-Ansicht und im About-Bereich.
- Die Update-Anzeige unterscheidet jetzt zwischen Download und Kopieren aus dem Cache.

### Behoben

- Beim Kopieren bereits vorhandener Cache-Dateien bleibt die UI nicht mehr bei 0 Dateien stehen.

## 0.1.6 - 2026-06-06

### Geändert

- Crossfire-DE-Dateien werden jetzt direkt aus `flathack/FLRocket` auf GitHub geladen.
- Das Manifest wird von `DE/files.json` gelesen; einzelne Dateien werden aus `DE/<Pfad>` heruntergeladen.
- Launcher-Selbstupdates werden aus GitHub Releases geladen und nur für höhere Versionen angewendet.
- Sichtbare Update-Texte verweisen jetzt auf GitHub.

### Entfernt

- Provider-spezifische Spieldatei-Downloadlogik und `file_id`-Abhängigkeit im Manifest.

## 0.1.5 - 2026-06-05

### Behoben

- Der Start-/Update-Button bleibt im festen 960x600-Launcherfenster sichtbar.
- Die Home-Übersicht nutzt jetzt drei kompaktere Dashboard-Spalten, damit Dateistatus, Launcher-Ordner und Statistiken nicht mehr den Aktionsbereich aus dem Fenster schieben.
- Lange Launcher-Pfade und Statistikwerte werden kompakter dargestellt, ohne das Layout zu vergrößern.

## 0.1.4 - 2026-06-05

### Hinzugefügt

- Spielzeit-Statistiken zeichnen Gesamtspielzeit, Anzahl der Sessions und längste Session auf.
- Die Übersicht zeigt die aktuellen Spielzeit-Statistiken direkt im Launcher.
- Der Launcher sucht eigene Updates jetzt in versionierten Remote-Release-Daten.

### Geändert

- Launcher-Self-Updates werden still im Hintergrund heruntergeladen und beim Beenden über einen versteckten Helper angewendet.
- Die Self-Updater-Version wird aus der Cargo-Paketversion gelesen, damit Release-Bumps nicht doppelt gepflegt werden müssen.
- Offene Spielsessions werden beim nächsten Prozesscheck sauber abgeschlossen, falls der Launcher während des Spiels beendet wurde.

### Tests

- Regressionstests für Session-Tracking, Remote-Versionserkennung und PowerShell-Pfad-Escaping des stillen Updaters.

## 0.1.3 - 2026-06-05

### Geändert

- Der Launcher kann das Spiel jetzt auch starten, wenn Updates ausstehen.
- Bei ausstehenden Updates werden getrennte Aktionen für Update und Start ohne Update angezeigt.
- Downloads werden zuerst unter `%LOCALAPPDATA%\RocketLauncher\cache` zwischengespeichert und danach aus dem Cache in den Freelancer-Ordner kopiert.
- Bereits gültige Cache-Dateien werden wiederverwendet, statt erneut heruntergeladen zu werden.
- `.log`-Dateien werden beim Manifest-Abgleich ignoriert.
- Die Oberfläche hat einen animierten Sternenhintergrund, dezente Bewegungseffekte und Reduced-Motion-Unterstützung erhalten.
- Die Browser-Preview funktioniert außerhalb von Tauri ohne Absturz der Fenstersteuerung.

### Hinzugefügt

- Regressionstests für Cache-Pfade, Cache-Validierung, Cache-Kopie und `.log`-Filter.

## 0.1.2 - 2026-06-02

### Geändert

- Der Launcher prüft weiterhin, ob `EXE\Freelancer.exe` im Freelancer-Hauptordner vorhanden ist.
- Der Spielstart verwendet jetzt `EXE2\Freelancer.exe`.

### Hinzugefügt

- Regressionstest für die getrennte Prüf- und Startdatei.

## 0.1.1 - 2026-06-02

### Geändert

- Der Launcher verwendet den eigenen Programmordner als festen Freelancer-Hauptordner.
- Freelancer wird nur noch über `EXE\Freelancer.exe` im Launcher-Ordner gesucht.
- Die manuelle Ordnerwahl wurde aus den Einstellungen entfernt.
- Die alte Hero-Kennzeichnung wurde entfernt.
- Die App zeigt jetzt "Launcher by FlatHack" an.
- Die Einstellungen enthalten jetzt 10 auswählbare Themes.
- Provider-Bezeichnungen wurden aus der sichtbaren Programmoberfläche entfernt.

### Hinzugefügt

- Regressionstests für die neue Pflichtstruktur `EXE\Freelancer.exe`.
- Persistente Theme-Konfiguration.

### Fehlerbehandlung

- Wenn der Launcher nicht direkt im Freelancer-Hauptordner liegt oder `EXE\Freelancer.exe` fehlt, wird eine klare Fehlermeldung ausgegeben.

## 0.1.0 - 2026-06-02

### Hinzugefügt

- Erste Version des FLRocket Launchers.
- Manifest-basierte Dateiprüfung und Synchronisation.
- Direkter Spielstart aus dem Launcher.
- Changelog-Ansicht, Einstellungen und About-Seite.
- Mehrsprachige Oberfläche für Deutsch und Englisch.
