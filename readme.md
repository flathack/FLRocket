# FLRocket

FLRocket is a launcher for the German Crossfire single-player patch.

Important:

- FLRocket is not the official Crossfire launcher.
- FLRocket is not officially affiliated with the Crossfire team or Crossfire project.
- This launcher is intended only for the German single-player patch.
- Do not use it as a replacement for the official Crossfire multiplayer launcher.

## What It Does

- Checks the game installation next to the launcher.
- Requires the original game executable to exist in the root folder.
- Downloads the German patch files from the public GitHub repository.
- Starts the patched game through the patched executable folder.
- Keeps local files in sync through the manifest in `DE/files.json`.

## Installation

Download the latest FLRocket release and place the launcher directly into your Crossfire folder, for example:

```text
C:\Crossfire\FLRocket.exe
```

The launcher must be in the game root folder and requires the original executable structure to be present.

When started, FLRocket checks the files and downloads the German patch data if needed.

## Data Source

Patch data is loaded from:

```text
https://github.com/flathack/FLRocket/tree/main/DE
```

Launcher releases are published at:

```text
https://github.com/flathack/FLRocket/releases
```

## Credits

Launcher by FlatHack.
