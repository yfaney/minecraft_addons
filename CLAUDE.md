# Ian's Minecraft Bedrock Addon Project

> For one-time environment setup see [SETUP.md](SETUP.md).

## Project Overview

Ian (age 11) is learning JavaScript and coding by building Minecraft Bedrock Edition addons. This repo holds each addon in its own subfolder.

Current addons:
- `chocolate/` — adds a craftable chocolate item (JSON-based, no Script API)

## Rules for Claude

- Explain code in **English**, in a friendly and simple way
- Use Minecraft game analogies to explain new concepts (e.g. "a function is like a Redstone circuit — you wire it up once, then it runs every time you flip the switch")
- Suggest **small changes one step at a time** — don't dump large chunks of code all at once
- Celebrate small wins ("Nice, that worked!")

## Tech Stack

- Minecraft Bedrock Edition (Windows)
- Script API: `@minecraft/server`, `@minecraft/server-ui`
- JavaScript ES2020 modules

## Repo Structure

```
minecraft_addons/
├── chocolate/              ← existing addon (JSON only)
│   ├── behavior_pack/
│   └── resource_pack/
├── <next-addon>/           ← new addons go here as sibling folders
│   ├── behavior_pack/
│   │   ├── manifest.json
│   │   └── scripts/main.js
│   └── resource_pack/
│       └── manifest.json
├── deploy.ps1              ← deploys any/all addons to com.mojang
├── CLAUDE.md               ← this file
├── SETUP.md                ← one-time setup guide
└── .claudeignore
```

Each addon subfolder that contains `behavior_pack/` or `resource_pack/` is auto-detected by `deploy.ps1`.

## Deploying

```powershell
.\deploy.ps1                    # deploy all addons
.\deploy.ps1 -Addon chocolate   # deploy one addon
```

Then in Minecraft: `/reload`

com.mojang path: `%APPDATA%\Minecraft Bedrock\Users\Shared\games\com.mojang`

## New Addon Checklist

1. Create `<addon-name>/behavior_pack/manifest.json` — generate UUIDs with `[guid]::NewGuid()` in PowerShell
2. Add `<addon-name>/behavior_pack/scripts/main.js` for Script API addons
3. Run `npm install` inside the addon folder for type hints (see [SETUP.md](SETUP.md#new-addon-project))
4. Run `.\deploy.ps1 -Addon <addon-name>` and test in Minecraft

## Script API References

| Resource | URL |
|---|---|
| Official docs | https://learn.microsoft.com/minecraft/creator/scriptapi/ |
| Bedrock Wiki scripting | https://wiki.bedrock.dev/scripting/scripting-intro |
| Community API reference | https://jaylydev.github.io/scriptapi-docs/latest/ |
| Script API examples | https://github.com/JaylyDev/ScriptAPI |
| Microsoft samples | https://github.com/microsoft/minecraft-scripting-samples |

## Project Ideas for Ian

### Beginner
- "Make fireworks explode when breaking a diamond block"
- "Drop an apple every time a log is chopped"
- "Send a warning message to everyone when night falls"

### Intermediate
- "Add a custom chat command `!home` that teleports you to spawn"
- "Create a scoreboard that goes up each time you kill a mob"
- "Strike lightning where you right-click holding a specific item"

### Advanced
- "Minigame: floor disappears survival"
- "NPC shop system using server-ui"
- "Custom boss mob with Behavior Pack JSON + Script"

## Troubleshooting

**Pack not showing in Minecraft** — check com.mojang path; set file storage to "External" in Minecraft Settings.

**Script errors** — open Content Log with `Ctrl+H`; check for duplicate UUIDs in `manifest.json`.

**`/reload` not working** — make sure cheats are enabled in the world; try exiting and re-entering the world.

**Content Log missing** — World Settings → Creator → enable both Content Log toggles.
