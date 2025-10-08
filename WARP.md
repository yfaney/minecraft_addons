# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a Minecraft Bedrock Edition addon development repository. Minecraft addons consist of two main components:
- **Resource Packs**: Control visual aspects (textures, models, sounds, text)
- **Behavior Packs**: Control game logic (item behavior, block mechanics, entity AI)

Both packs work together through UUID-based dependencies defined in their respective `manifest.json` files.

## Project Structure

Minecraft addons follow a specific structure:

```
addon_name/
├── resource_pack/
│   ├── manifest.json          # Resource pack metadata with UUIDs
│   ├── texts/
│   │   └── en_US.lang        # Item/block display names
│   └── textures/
│       ├── items/            # Item textures (PNG)
│       └── blocks/           # Block textures (PNG)
└── behavior_pack/
    ├── manifest.json          # Behavior pack metadata with UUIDs
    ├── items/                # Item definitions (JSON)
    ├── blocks/               # Block definitions (JSON)
    └── entities/             # Entity definitions (JSON)
```

## Key Technical Concepts

### Manifest Files
- Both resource and behavior packs require `manifest.json` with unique UUIDs
- Behavior pack's `dependencies` array must reference the resource pack's header UUID
- Format version and min_engine_version must be compatible with target Minecraft version

### UUID Management
- Each manifest requires 2 unique UUIDs (header + module)
- UUIDs link resource and behavior packs together
- Never reuse UUIDs across different addons
- Generate new UUIDs for each new addon project

### Item/Block Identifiers
- Use namespace format: `namespace:item_name` (e.g., `custom:ruby`)
- Namespace separates custom content from vanilla Minecraft
- Identifiers must match across behavior definition, resource texture reference, and lang file

### Component-Based System
- Items and blocks use component architecture in behavior packs
- Components define properties like `minecraft:max_stack_size`, `minecraft:icon`, etc.
- Different format_version values support different component sets

## Common Development Tasks

### Validating JSON Files
All manifest and definition files must be valid JSON. Use a JSON validator or:
```bash
python3 -m json.tool your_file.json
```

### Testing Addons
Minecraft Bedrock accesses development addons from:
- Windows: `%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\`
- iOS/Android: `games/com.mojang/`

Place packs in:
- `development_resource_packs/` for resource packs
- `development_behavior_packs/` for behavior packs

### Creating New Addons
When creating a new addon:
1. Generate 4 unique UUIDs (2 for resource pack, 2 for behavior pack)
2. Create directory structure for both packs
3. Write manifest.json for each pack with proper dependencies
4. Define items/blocks in behavior pack
5. Create corresponding textures and lang entries in resource pack
6. Test in Minecraft by copying to development folders

## File Format Requirements

### manifest.json
- Must be valid JSON
- Requires `format_version`, `header`, and `modules` fields
- Behavior packs need `dependencies` array linking to resource pack
- Version format: `[major, minor, patch]`

### Item/Block JSON Files
- Use format_version compatible with target Minecraft version
- Follow component-based structure under `minecraft:item` or `minecraft:block`
- Identifier must match texture and lang file references

### Language Files (.lang)
- Key-value format: `item.namespace:name.name=Display Name`
- Must be placed in `texts/` directory
- Filename follows locale code (e.g., `en_US.lang`)

### Texture Files
- PNG format
- Place in appropriate subdirectory (`items/`, `blocks/`, etc.)
- Filename (without extension) referenced in component `minecraft:icon` texture field

## Development Best Practices

### Addon Packaging
For distribution, addons can be packaged as:
- `.mcaddon`: Contains both resource and behavior packs
- `.mcpack`: Single pack (resource OR behavior)
- `.mcworld`: World with embedded addons

Package by creating ZIP archive with correct structure, then rename extension.

### Version Management
- Increment version numbers in manifest.json when updating
- Use semantic versioning: [major, minor, patch]
- Both packs should maintain synchronized version numbers

### Compatibility
- Set `min_engine_version` based on features used
- Higher versions may not work on older Minecraft clients
- Test on target platform (Windows, mobile, console)
