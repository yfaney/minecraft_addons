# Changelog

All notable changes to the Chocolate addon will be documented in this file.

## [1.0.2] - 2025-10-08

### Fixed
- **Speed effect not working on Minecraft 1.21.90**: Updated to use newer event-based effect system
  - Changed from deprecated `effects` array in `minecraft:food` to `add_mob_effect` event
  - Effects now trigger via `minecraft:on_use` event instead of food consumption
  - Compatible with Minecraft 1.21.0+ format changes

### Changed
- Updated `format_version` from 1.20.50 to 1.21.0
- Updated `min_engine_version` from [1, 20, 0] to [1, 21, 0] in both manifests
- Changed `saturation_modifier` from numeric (0.3) to string ("low") per 1.21+ requirements
- Added `minecraft:use_modifiers` component for proper food behavior
- Added `minecraft:consume_on_use` component
- Added `using_converts_to` in food component
- Implemented `minecraft:on_use` event with `add_mob_effect` action

### Technical Details
- Resource pack version: 1.0.1 → 1.0.2
- Behavior pack version: 1.0.1 → 1.0.2
- Now uses event system compatible with Minecraft Bedrock 1.21.90
- Speed effect: Speed II (amplifier 1) for 30 seconds
- Target: holder (the player eating the chocolate)

## [1.0.1] - 2025-10-08

### Fixed
- **Texture not displaying**: Added missing `item_texture.json` file to properly map chocolate texture
  - Custom items now show the brown chocolate bar texture in inventory and when dropped
  - File location: `resource_pack/textures/item_texture.json`

- **Speed effect not working**: Replaced unreliable event-based command system with native food effects
  - Changed from `run_command` event to direct `effects` array in `minecraft:food` component
  - Speed II effect now works reliably on all platforms (iOS, Android, Windows, consoles)
  - Effect duration: 30 seconds
  - Effect level: Speed II (amplifier 1)

### Changed
- Updated item definition structure for better compatibility
- Removed event system entirely from `chocolate.json`
- Effects now applied using Minecraft's native food effect system

### Technical Details
- Resource pack version: 1.0.0 → 1.0.1
- Behavior pack version: 1.0.0 → 1.0.1
- Both manifests updated to reflect new version
- Dependency version updated in behavior pack manifest

## [1.0.0] - 2025-10-08

### Added
- Initial release of Chocolate addon
- Custom chocolate item that can be eaten
- Crafting recipe: 3 cocoa beans → 1 chocolate
- Food properties: 4 nutrition points (2 food bars)
- Speed II effect for 30 seconds when consumed (non-functional in this version)
- Custom texture support (non-displaying in this version)
- English language support (en_US.lang)

### Features
- Stack size: 64 items
- Use duration: 32 ticks (1.6 seconds)
- Eating animation
- 1 second cooldown between uses

### Files Included
- Resource pack with manifest and language file
- Behavior pack with item definition and crafting recipe
- Texture placeholder (actual texture added by user)
- README and documentation
- Packaging script for distribution

---

## Version Format

Versions follow semantic versioning: `[major, minor, patch]`

- **Major**: Breaking changes or significant feature additions
- **Minor**: New features, backward compatible
- **Patch**: Bug fixes and minor improvements

## Links

- Repository: `/Users/yjang/git/public/minecraft_addons/chocolate`
- Latest Package: `Chocolate.mcaddon`
