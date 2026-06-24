# Changelog

Alle relevanten Projektänderungen werden im Root-Changelog dokumentiert:

https://raw.githubusercontent.com/flathack/FLRocket/main/CHANGELOG.md

## 0.3.0 - 2026-06-24

- App-Version auf `v0.3.0` angehoben.
- Der Startbutton zeigt `Spiel läuft`, solange `Freelancer.exe` läuft. Bei Crossfire zählt zusätzlich der offizielle `GameLauncher.exe`.
- Der alte Crossfire-Hinweis zum Single-Player-Button wurde von der Startseite entfernt.
- Neuer Sidebar-Tab `Übersetzung` erklärt den Translator-Ablauf und enthält einen Reset-Button.
- Reset stellt FLRocket-Datei-Patches aus Backups wieder her und entfernt Hook-Einträge im `EXE`-Ordner. Der temporäre `EXE2`-Ordner bleibt Sache des Crossfire Launchers.

## 0.2.0 - 2026-06-13

- FLRocket nutzt jetzt den universellen Translator-Modus für Freelancer-Mods.
- Crossfire-Texte werden über den Client Hook bereitgestellt; das Crossfire-Dateipaket enthält nur noch Audio und FLRocket-spezifische EXE2-Dateien.
- Die Sprachauswahl enthält `Original`, um ohne Übersetzung zu starten.
- Die deutsche Oberfläche und öffentliche Changelogs verwenden echte Umlaute.
