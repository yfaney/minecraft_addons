# Environment Setup Guide

One-time setup for Ian's Minecraft Bedrock addon development environment.

---

## Prerequisites (already done)

- **Node.js** — installed via nvm
- **Visual Studio Code** — installed

Verify Node.js is active:
```powershell
node --version    # should be v20.x or higher
npm --version     # should be 10.x or higher
```

If `node` isn't found in a new terminal, run `nvm use <version>` or set a default: `nvm alias default <version>`.

---

## Step 1: VS Code Extensions

Open VS Code, press `Ctrl+Shift+X`, and install:

| Extension | Purpose |
|---|---|
| **Blockception's Minecraft Bedrock Development** | JSON autocomplete, validation, Molang support |
| **Claude Code** (by Anthropic) | AI coding assistant |

Optional (add later):
- **Prettier** — auto-format code

---

## Step 2: Minecraft com.mojang Folder

Bedrock Edition reads development packs from:

```
%APPDATA%\Minecraft Bedrock\Users\Shared\games\com.mojang
```

If this path doesn't exist, open Minecraft and go to:
**Settings → General → Storage → File storage location → External**

Key subfolders:
- `development_behavior_packs/` — behavior packs (code, items, mobs)
- `development_resource_packs/` — resource packs (textures, models, sounds)

---

## Step 3: Claude Code Sign-In

1. Click the **spark (✱) icon** in the VS Code sidebar
2. Click **Sign in** → authenticate in the browser
3. Return to VS Code when done

> Requires Anthropic Pro subscription ($20/month or higher).

---

## Step 4: New Addon Project

### Folder structure

Create a subfolder inside this repo (e.g. `ian-first-addon/`):

```
ian-first-addon/
├── behavior_pack/
│   ├── manifest.json
│   ├── pack_icon.png       ← any PNG, 16x16 or larger
│   └── scripts/
│       └── main.js
├── resource_pack/
│   ├── manifest.json
│   └── pack_icon.png
└── package.json
```

### behavior_pack/manifest.json

Generate two UUIDs in PowerShell: `[guid]::NewGuid()`

```json
{
  "format_version": 2,
  "header": {
    "name": "Ian's First Addon",
    "description": "Ian's first Minecraft addon!",
    "uuid": "<UUID-1>",
    "version": [1, 0, 0],
    "min_engine_version": [1, 21, 0]
  },
  "modules": [
    {
      "type": "script",
      "language": "javascript",
      "uuid": "<UUID-2>",
      "version": [1, 0, 0],
      "entry": "scripts/main.js"
    }
  ],
  "dependencies": [
    { "module_name": "@minecraft/server", "version": "2.0.0" },
    { "module_name": "@minecraft/server-ui", "version": "2.0.0" }
  ]
}
```

### behavior_pack/scripts/main.js (starter)

```javascript
import { world } from "@minecraft/server";

world.afterEvents.worldLoad.subscribe(() => {
  world.sendMessage("§aIan's addon loaded! §e🎉");
});

world.afterEvents.playerBreakBlock.subscribe((event) => {
  const block = event.brokenBlockPermutation.type.id;
  event.player.sendMessage(`You broke §b${block}§f!`);
});

world.afterEvents.playerJump.subscribe((event) => {
  event.player.dimension.spawnParticle(
    "minecraft:basic_flame_particle",
    event.player.location
  );
});
```

### package.json (for VS Code type hints)

```json
{
  "name": "ian-first-addon",
  "version": "1.0.0",
  "private": true,
  "dependencies": {
    "@minecraft/server": "^2.0.0",
    "@minecraft/server-ui": "^2.0.0"
  }
}
```

Run inside the addon folder:
```powershell
npm install
```

---

## Step 5: Testing in Minecraft

1. Run `.\deploy.ps1 -Addon <addon-name>` from the repo root
2. Launch Minecraft and create (or open) a world
3. In world settings:
   - **Cheats** → On
   - **Experiments** → Beta APIs → On (for Script API addons)
4. **Behavior Packs** → activate your addon
5. Enter the world — you should see the load message in chat
6. After code edits: re-run `deploy.ps1`, then type `/reload` in-game

### Debugging

- Open Content Log: `Ctrl+H` in Minecraft
- Enable both Content Log toggles: World Settings → Creator
- Most errors show up there with a file name and line number
