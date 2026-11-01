# FLRocket

[English README](README.en.md)

FLRocket startet Freelancer-Mods mit verfügbaren Übersetzungen. Für Freelancer Crossfire bereitet es den Singleplayer vor und startet den Client direkt. FLRocket ist ein Community-Projekt und kein offizieller Crossfire Launcher.

## Installation

1. Installiere Freelancer Crossfire und prüfe, ob es regulär startet.
2. Lade den **Installer** aus dem [aktuellen Release](https://github.com/flathack/FLRocket/releases/latest) herunter und starte ihn.
3. Der Installer sucht unter `C:/Freelancer Crossfire`. Falls dort keine Installation gefunden wird, wähle den Crossfire-Hauptordner aus. Darin liegen unter anderem die Ordner `EXE` und `DATA`.
4. Starte FLRocket, wähle die gewünschte Sprache und klicke auf **Singleplayer starten**. Beim ersten Start lädt FLRocket die benötigten Übersetzungspakete herunter.

Alternativ kannst du die portable ZIP aus dem Release in den Hauptordner deiner Mod entpacken und `FLRocket.exe` starten. Die ZIP enthält aus Kompatibilitätsgründen auch `WebView2Loader.dll`. Liegt FLRocket außerhalb des Spielordners, lässt sich dieser in den Einstellungen auswählen.

FLRocket benötigt Administratorrechte. Die Launcher-Oberfläche verwendet zunächst die Windows-Sprache; Deutsch und Englisch lassen sich in den Einstellungen auswählen. Die Sprache im Spiel wird separat auf der Startseite gewählt.

## Singleplayer, Multiplayer und Dateien

FLRocket ist für Singleplayer-Übersetzungen gedacht. Für Multiplayer öffnet die Schaltfläche unten rechts den offiziellen Crossfire Launcher und beendet FLRocket. Updates und Reparaturen für Crossfire erfolgen weiterhin über den offiziellen Launcher.

FLRocket lädt Textübersetzungen über einen Client-Hook. Falls für eine Sprache zusätzliche Dateien benötigt werden, sichert FLRocket die betroffenen Originaldateien und stellt sie nach der Spielsitzung wieder her. Sollte eine Sitzung unterbrochen werden, kann sie über die Einstellungen wiederhergestellt werden. `Original` startet ohne Übersetzung.

## Verfügbare Übersetzungen

| Mod | Sprachen |
| --- | --- |
| Freelancer Crossfire | Deutsch, Französisch |
| Freelancer Reforged | Deutsch, Russisch, Tschechisch |

Die verfügbaren Sprachen hängen vom Übersetzungskatalog und den veröffentlichten Paketen ab. Pakete werden beim ersten Start automatisch geladen.

## Updates

FLRocket kann Launcher-Updates prüfen. Beim Update von v0.5.0 wird die neue Version nach dem Beenden installiert; starte FLRocket danach erneut. Die portable ZIP und die Prüfsummendateien sind auch auf der Release-Seite verfügbar.

## Credits

Launcher by FlatHack.
