# FLRocket

[Deutsche README](README.md)

FLRocket starts Freelancer mods with available translations. For Freelancer Crossfire it prepares singleplayer and starts the client directly. FLRocket is a community project and is not the official Crossfire Launcher.

## Installation

1. Install Freelancer Crossfire and check that it starts normally.
2. Download and run the **installer** from the [latest release](https://github.com/flathack/FLRocket/releases/latest).
3. The installer checks `C:/Freelancer Crossfire`. If it cannot find an installation there, select the Crossfire root folder, which contains the `EXE` and `DATA` folders.
4. Start FLRocket, choose a language and select **Start Singleplayer**. FLRocket downloads the necessary translation packages on first launch.

Alternatively, extract the portable ZIP from the release into the root folder of your mod and start `FLRocket.exe`. The ZIP also contains `WebView2Loader.dll` for compatibility. If FLRocket is outside the game folder, select the folder in Settings.

FLRocket requires administrator privileges. The launcher initially follows the Windows UI language; English and German can be selected in Settings. The in-game language is selected separately on the home screen.

## Singleplayer, multiplayer and files

FLRocket is intended for singleplayer translations. For multiplayer, the button in the lower right opens the official Crossfire Launcher and closes FLRocket. Continue to use the official launcher for Crossfire updates and repairs.

FLRocket loads text translations through a client hook. When a language needs additional files, FLRocket backs up the affected originals and restores them after the game session. An interrupted session can be restored from Settings. Select `Original` to start without a translation.

## Available translations

| Mod | Languages |
| --- | --- |
| Freelancer Crossfire | German, French |
| Freelancer Reforged | German, Russian, Czech |

Availability depends on the translation catalog and published packages. FLRocket downloads the packages automatically on first launch.

## Updates

FLRocket can check for launcher updates. When updating from v0.5.0, the new version is installed after exiting; start FLRocket again afterwards. The portable ZIP and checksum files are also available on the release page.

## Credits

Launcher by FlatHack.
