# Changelog

Alle relevanten Projektänderungen werden hier dokumentiert.

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
