# Chocolate Addon - Quick Start

## What You Created

A complete Minecraft Bedrock Edition addon that adds a **Chocolate** item:
- 🍫 **Edible item** that grants Speed II for 30 seconds
- 🎨 **Crafting recipe**: 3 cocoa beans → 1 chocolate
- 🍗 **Food value**: Restores 4 hunger (2 food bars)

## File Structure

```
chocolate/
├── README.md                                    # Full documentation
├── QUICK_START.md                               # This file
├── resource_pack/
│   ├── manifest.json                           # Resource pack config
│   ├── texts/
│   │   └── en_US.lang                          # Item name: "Chocolate"
│   └── textures/
│       └── items/
│           └── chocolate.png.txt               # Replace with actual texture
└── behavior_pack/
    ├── manifest.json                            # Behavior pack config (links to resource pack)
    ├── items/
    │   └── chocolate.json                      # Item definition with speed effect
    └── recipes/
        └── chocolate.json                      # Crafting recipe (3 cocoa beans)
```

## Testing the Addon

### Step 1: Copy to Minecraft
```bash
# On Windows (PowerShell or Command Prompt)
# Replace paths as needed
xcopy resource_pack "%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\ChocolateResources" /E /I

xcopy behavior_pack "%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_behavior_packs\ChocolateBehaviors" /E /I
```

### Step 2: Activate in Minecraft
1. Launch Minecraft Bedrock Edition
2. Create new world (or edit existing)
3. Go to "Behavior Packs" → Activate "Chocolate Behaviors"
4. Go to "Resource Packs" → Activate "Chocolate Resources"
5. **Enable "Education Edition"** in world settings (for effects to work)
6. **Enable Cheats** (required for effect commands)
7. Create/start world

### Step 3: Test In-Game
1. Get cocoa beans: `/give @s cocoa_beans 64`
2. Open crafting table
3. Place 3 cocoa beans in a row
4. Take the chocolate
5. Eat it and watch your speed increase!

## Next Steps

### Add a Texture
Replace `resource_pack/textures/items/chocolate.png.txt` with:
- A 16x16 or 32x32 pixel PNG image
- Name it `chocolate.png`
- Design it to look like a chocolate bar

### Package for Distribution
```bash
cd /Users/yjang/git/public/minecraft_addons/chocolate
zip -r Chocolate.mcaddon resource_pack/ behavior_pack/
```

Share the `.mcaddon` file with others!

## Validation Status

All JSON files have been validated: ✓
- Resource pack manifest.json ✓
- Behavior pack manifest.json ✓
- Item definition ✓
- Recipe definition ✓

## Key UUIDs (Don't Change These!)

- Resource Pack Header: `953d9194-2c8e-4555-b6c6-c31d94ad5145`
- Resource Pack Module: `cb75d1c3-09d2-4719-8121-93a254567d62`
- Behavior Pack Header: `f9e67a10-e3df-4cbe-be89-194c74e03634`
- Behavior Pack Module: `66515aee-d565-478d-bb16-35816c207946`

These UUIDs link the packs together - changing them will break the addon!

## Troubleshooting

**Item doesn't appear?**
- Make sure both packs are activated
- Check that Education Edition is enabled
- Restart Minecraft

**No speed effect?**
- Enable cheats in world settings
- Enable Education Edition features

**Can't craft?**
- Use a crafting table (not 2x2 inventory crafting)
- Arrange beans in exact horizontal row

## See README.md for Full Documentation
