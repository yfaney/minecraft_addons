# Chocolate Addon - Troubleshooting Guide

## Issues Fixed in Latest Version

### ✅ Issue 1: Missing Texture (Invisible Item)
**Problem**: Chocolate item appeared invisible or as a missing texture block.

**Root Cause**: Missing `item_texture.json` file that maps the texture name to the actual texture file.

**Fix Applied**: Created `/resource_pack/textures/item_texture.json` with proper texture mapping:
```json
{
    "resource_pack_name": "chocolate_resources",
    "texture_name": "atlas.items",
    "texture_data": {
        "chocolate": {
            "textures": "textures/items/chocolate"
        }
    }
}
```

### ✅ Issue 2: Speed Effect Not Working
**Problem**: Eating chocolate didn't grant speed boost.

**Root Cause**: The `run_command` event system with `effect @s` command may not work reliably in Bedrock Edition for custom items, especially on mobile devices.

**Fix Applied**: Changed from event-based command to direct food effect:
```json
"minecraft:food": {
    "nutrition": 4,
    "saturation_modifier": 0.3,
    "can_always_eat": false,
    "effects": [
        {
            "name": "speed",
            "duration": 30,
            "amplifier": 1
        }
    ]
}
```

This uses the built-in food effect system which is more reliable across all platforms.

## How to Update Your Addon

### Step 1: Remove Old Version
1. Open Minecraft on your device
2. Go to Settings → Storage → Resource Packs
3. Find "Chocolate Resources" and delete it
4. Go to Settings → Storage → Behavior Packs
5. Find "Chocolate Behaviors" and delete it

### Step 2: Install New Version
1. Transfer the new `Chocolate.mcaddon` file to your device
2. Tap/click to open with Minecraft
3. Wait for "Import Complete" notification

### Step 3: Verify in World
1. Create a **new world** or go to existing world settings
2. Activate both packs:
   - Behavior Packs → "Chocolate Behaviors"
   - Resource Packs → "Chocolate Resources"
3. **Important**: You may need to deactivate and reactivate if updating an existing world
4. Start the world

### Step 4: Test the Fixes

**Test Texture:**
1. Give yourself chocolate: `/give @s custom:chocolate`
2. Check your inventory - you should see the brown chocolate bar texture
3. Drop the item on ground - it should show the texture

**Test Speed Effect:**
1. Eat the chocolate (hold and consume)
2. You should see speed particles around your character
3. You should move noticeably faster
4. Check your status effects - Speed II should be active for 30 seconds

## Common Issues and Solutions

### Still No Texture?

**Check 1: Resource Pack Active**
- Settings → Global Resources → "Chocolate Resources" should be in "Active" section
- Make sure it's enabled for your world

**Check 2: Texture File**
Verify the texture exists:
- The file should be at `resource_pack/textures/items/chocolate.png`
- Must be a PNG file (16x16 or 32x32 pixels)

**Check 3: Clear Cache**
- Close Minecraft completely
- Reopen and reload the world
- Sometimes Minecraft needs a full restart to load new textures

**Check 4: Reinstall**
- Remove both packs completely
- Restart Minecraft
- Reinstall from the new .mcaddon file

### Still No Speed Effect?

**Check 1: World Settings**
Some Bedrock versions may require:
- Cheats enabled (not always required with direct effects)
- Education Edition features (not required with the new fix)

**Check 2: Verify You're Eating**
- Make sure the eating animation completes
- You should regain hunger hearts
- Look for particles around your character

**Check 3: Check Effect Duration**
- Speed II lasts 30 seconds
- If you eat multiple chocolates, the effect refreshes
- Watch for the particle effects on your character

**Check 4: Platform-Specific**
The new direct effect system should work on all platforms:
- ✅ iOS/iPadOS
- ✅ Android
- ✅ Windows 10/11
- ✅ Xbox
- ✅ PlayStation
- ✅ Nintendo Switch

### Item Doesn't Appear in Creative Menu

**Solution**: Use the give command:
```
/give @s custom:chocolate
```

Custom items from addons don't always appear in the creative inventory but can be obtained via commands.

### Can't Craft Chocolate

**Check 1: Recipe Requirements**
- Need 3 cocoa beans
- Must use a crafting table (not 2x2 inventory crafting)
- Arrange in a horizontal row: `[Cocoa] [Cocoa] [Cocoa]`

**Check 2: Recipe Unlocking**
- Make sure you have cocoa beans in your inventory at least once
- The recipe should unlock automatically

**Check 3: Behavior Pack**
- Verify "Chocolate Behaviors" is active in your world
- The recipe is in the behavior pack, not resource pack

## Verification Checklist

Use this checklist to ensure everything is working:

- [ ] Both packs show as "Active" in world settings
- [ ] Can obtain chocolate via `/give @s custom:chocolate`
- [ ] Chocolate shows brown chocolate bar texture in inventory
- [ ] Chocolate shows texture when dropped on ground
- [ ] Eating animation plays when consuming
- [ ] Hunger restores (4 points = 2 food bars)
- [ ] Speed particles appear around character
- [ ] Character moves faster for 30 seconds
- [ ] Can craft chocolate from 3 cocoa beans

## Getting Help

If issues persist after trying these solutions:

1. **Check Minecraft Version**: Addon requires Minecraft Bedrock 1.20.0+
2. **Check File Integrity**: Redownload/repackage the addon
3. **Test in New World**: Create a fresh world to rule out world corruption
4. **Check Console Output**: On Windows, check for error messages in logs

## Technical Details

**Fixed Files:**
- `resource_pack/textures/item_texture.json` (NEW)
- `behavior_pack/items/chocolate.json` (UPDATED)

**Changes Made:**
1. Added texture mapping file for proper texture loading
2. Replaced event-based command system with direct food effects
3. Effects now use the reliable `minecraft:food` component

**Version**: 1.0.1 (Updated)

The new `Chocolate.mcaddon` file has been regenerated with all fixes applied.
