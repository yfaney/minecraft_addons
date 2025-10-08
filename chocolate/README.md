# Chocolate Addon for Minecraft Bedrock Edition

A Minecraft Bedrock Edition addon that adds a **Chocolate** item which grants the player a speed boost when consumed.

## Features

- **Custom Item**: Chocolate that can be eaten
- **Speed Effect**: Grants Speed II effect for 30 seconds when consumed
- **Crafting Recipe**: Craft using 3 cocoa beans in a row
- **Food Properties**: Restores 4 hunger points (2 food bars)

## Installation

### Option 1: Development Testing (Recommended for Testing)

1. Copy the addon folders to your Minecraft development directory:
   
   **On Windows:**
   ```bash
   # Resource Pack
   cp -r resource_pack "%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\ChocolateResources"
   
   # Behavior Pack
   cp -r behavior_pack "%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_behavior_packs\ChocolateBehaviors"
   ```
   
   **On macOS (for iOS testing via file sharing):**
   ```bash
   # Copy to a location where you can transfer to your iOS device
   # Then use iTunes file sharing to place in the games/com.mojang/ folder
   ```

2. Launch Minecraft Bedrock Edition
3. Create a new world or edit an existing world
4. Under "Behavior Packs", activate "Chocolate Behaviors"
5. Under "Resource Packs", activate "Chocolate Resources"
6. Start the world

### Option 2: Package Distribution

You can package this addon for distribution:

```bash
# Create .mcaddon package
cd /path/to/minecraft_addons/chocolate
zip -r Chocolate.mcaddon resource_pack/ behavior_pack/
```

Double-click the `.mcaddon` file to import into Minecraft.

## Usage

### Crafting

Open a crafting table and arrange **3 Cocoa Beans** in a horizontal row:

```
[Cocoa Bean] [Cocoa Bean] [Cocoa Bean]
```

This will produce **1 Chocolate**.

### Consuming

1. Hold the Chocolate item in your hand
2. Hold down (right-click on PC, tap and hold on mobile)
3. After eating animation completes, you'll receive:
   - Speed II effect for 30 seconds
   - Restored hunger (4 nutrition points)

## Technical Details

### Components Used

- **minecraft:food**: Makes the item edible with nutrition values
- **minecraft:use_animation**: Uses the "eat" animation
- **minecraft:use_duration**: 32 ticks (1.6 seconds) to consume
- **minecraft:cooldown**: 1 second cooldown between uses
- **events**: Triggers speed effect command on consumption

### Effect Details

- **Effect**: Speed II
- **Duration**: 30 seconds
- **Command**: `effect @s speed 30 1`

### File Structure

```
chocolate/
├── resource_pack/
│   ├── manifest.json          # Resource pack metadata
│   ├── texts/
│   │   └── en_US.lang        # Item display name
│   └── textures/
│       └── items/
│           └── chocolate.png.txt  # Placeholder for texture
└── behavior_pack/
    ├── manifest.json          # Behavior pack metadata
    ├── items/
    │   └── chocolate.json    # Item definition
    └── recipes/
        └── chocolate.json    # Crafting recipe
```

## Customization

### Adding a Texture

Replace `resource_pack/textures/items/chocolate.png.txt` with an actual PNG image named `chocolate.png`:

1. Create a 16x16 or 32x32 pixel PNG image
2. Design it to look like chocolate
3. Save as `chocolate.png` in the `textures/items/` folder

### Modifying Effects

Edit `behavior_pack/items/chocolate.json` to change the speed effect:

```json
"command": [
    "effect @s speed 30 1"  // Change duration (30s) or level (1=Speed II)
]
```

You can add additional effects:
```json
"command": [
    "effect @s speed 30 1",
    "effect @s jump_boost 30 0"  // Add jump boost
]
```

### Changing Recipe

Edit `behavior_pack/recipes/chocolate.json`:

- Change the pattern for different arrangements
- Change ingredients in the "key" section
- Adjust result count

Example - make it require sugar:
```json
"pattern": [
    "CSC"
],
"key": {
    "C": { "item": "minecraft:cocoa_beans" },
    "S": { "item": "minecraft:sugar" }
}
```

## Compatibility

- **Minimum Minecraft Version**: 1.20.0
- **Platform**: Bedrock Edition (Windows 10/11, iOS, Android, Xbox, PlayStation, Nintendo Switch)
- **Format Version**: 1.20.50

## Troubleshooting

### Item doesn't appear in game
- Ensure both behavior and resource packs are activated
- Check that manifest.json files are valid JSON
- Verify UUIDs are unique and dependencies are correct

### Speed effect not working
- Make sure "Education Edition" features are enabled in world settings (required for some commands)
- Check that cheats are enabled in the world

### Recipe not working
- Ensure you're using a crafting table
- Check that cocoa beans are in the correct pattern

## License

Free to use and modify for personal and educational purposes.

## Credits

Created as part of the minecraft_addons repository.
