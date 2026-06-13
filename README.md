# FLRocket

[Deutsche README](README.de.md)

FLRocket is a lightweight Freelancer launcher and universal translator helper. It remains compatible with the German Crossfire single-player patch and can discover additional mod translations from a public catalog.

Important:

- FLRocket is not the official Crossfire launcher.
- FLRocket is not officially affiliated with the Crossfire team or Crossfire project.
- Do not use it as a replacement for the official Crossfire multiplayer launcher.

## What It Does

- Checks the game installation next to the launcher.
- Requires the original game executable to exist in the root folder.
- Downloads Crossfire German data through public GitHub release ZIPs and public patch metadata.
- Starts the patched game through the patched executable folder.
- Keeps local files in sync through the manifest in `DE/files.json`.
- Discovers available Freelancer mod translations from `translator-catalog.json`.
- Prepares text/infocard hook overlays plus optional file/audio patches when a translation package provides them.
- Uses the client hook for Crossfire text/infocards in universal translator mode; the Crossfire file package contains only audio data and FLRocket-specific EXE2 files there.
- Runs hook overlays from the FLRocket cache and installs the small hook loader in the selected game folder while a hook translation is active. Selecting `Original` removes the FLRocket hook loader again.

## Installation

Download the latest FLRocket release and place the launcher directly into your Crossfire folder, for example:

```text
Crossfire\FLRocket.exe
```

The launcher must be in the game root folder and requires the original executable structure to be present.

When started, FLRocket checks the files and downloads the German patch data if needed.

For catalog-based translations such as Reforged, FLRocket downloads the selected hook package, verifies it, prepares it in the local FLRocket cache, installs the hook loader in `EXE\dacom.ini`, and starts Freelancer with the prepared overlay path. Crossfire uses the same hook path for text and can additionally prepare German audio files plus its EXE2 launch environment.

## Data Source

Patch metadata is loaded from public GitHub. The actual language files are published as GitHub Release ZIP assets:

```text
https://raw.githubusercontent.com/flathack/FLRocket/main/DE/files.json
https://raw.githubusercontent.com/flathack/FLRocket/main/language-patches.json
https://raw.githubusercontent.com/flathack/FLRocket/main/translator-catalog.json
```

Launcher releases are published at:

```text
https://github.com/flathack/FLRocket/releases
```

## Credits

Launcher by FlatHack.
