# Minecraft 1.21.90 Compatibility Updates

## What Changed in Minecraft 1.21+

Minecraft Bedrock Edition 1.21.0 introduced **breaking changes** to how custom items work, particularly for food items with effects. Several components and formats were deprecated or changed.

## Issues with Previous Version (1.0.1)

### ❌ Deprecated: Effects in `minecraft:food`
**Old Format (1.20.x):**
```json
"minecraft:food": {
    "nutrition": 4,
    "saturation_modifier": 0.3,
    "effects": [
        {
            "name": "speed",
            "duration": 30,
            "amplifier": 1
        }
    ]
}
```

**Problem**: The `effects` array inside `minecraft:food` was deprecated in 1.21+. Effects would be silently ignored.

### ❌ Deprecated: Numeric Saturation Modifier
**Old Format:**
```json
"saturation_modifier": 0.3
```

**Problem**: Numeric saturation values are no longer supported. Must use predefined strings.

## New Format for Minecraft 1.21.90

### ✅ Solution 1: Event-Based Effects

Effects must now be applied through events, not directly in the food component:

```json
"events": {
    "minecraft:on_use": {
        "add_mob_effect": {
            "effect": "speed",
            "target": "holder",
            "duration": 30,
            "amplifier": 1
        }
    }
}
```

**Why this works:**
- `minecraft:on_use` event triggers when item is used/consumed
- `add_mob_effect` action applies the effect
- `target: "holder"` applies to the player using the item
- This is the new standard for Minecraft 1.21+

### ✅ Solution 2: String-Based Saturation

```json
"saturation_modifier": "low"
```

**Valid values:**
- `"poor"` - Lowest saturation
- `"low"` - Low saturation (0.3)
- `"normal"` - Normal saturation (0.6)
- `"good"` - Good saturation (1.2)
- `"max"` - Maximum saturation (1.6)

### ✅ Solution 3: Additional Required Components

Minecraft 1.21+ requires these additional components for proper food behavior:

```json
"minecraft:use_modifiers": {
    "use_duration": 1.6,
    "movement_modifier": 0.0
},
"minecraft:consume_on_use": {
    "consume_on_use": true
}
```

And in the food component:
```json
"using_converts_to": "custom:chocolate"
```

## Complete Updated Item Definition

```json
{
    "format_version": "1.21.0",
    "minecraft:item": {
        "description": {
            "identifier": "custom:chocolate",
            "menu_category": {
                "category": "items"
            }
        },
        "components": {
            "minecraft:max_stack_size": 64,
            "minecraft:icon": {
                "texture": "chocolate"
            },
            "minecraft:use_duration": 32,
            "minecraft:use_animation": "eat",
            "minecraft:food": {
                "nutrition": 4,
                "saturation_modifier": "low",
                "can_always_eat": false,
                "using_converts_to": "custom:chocolate"
            },
            "minecraft:use_modifiers": {
                "use_duration": 1.6,
                "movement_modifier": 0.0
            },
            "minecraft:cooldown": {
                "category": "chocolate",
                "duration": 1.0
            },
            "minecraft:consume_on_use": {
                "consume_on_use": true
            }
        },
        "events": {
            "minecraft:on_use": {
                "add_mob_effect": {
                    "effect": "speed",
                    "target": "holder",
                    "duration": 30,
                    "amplifier": 1
                }
            }
        }
    }
}
```

## Version Requirements

**Minimum Minecraft Version:** 1.21.0
- The addon now requires Minecraft Bedrock 1.21.0 or higher
- This ensures compatibility with 1.21.90 (your current version)

**Format Version:** 1.21.0
- Updated from 1.20.50 to match the new component requirements

## Backward Compatibility

⚠️ **Breaking Change**: This addon will **NOT** work on Minecraft versions older than 1.21.0.

If you need to support older versions (1.20.x), you would need:
- Two separate versions of the addon
- Or conditional logic (not easily achievable in Bedrock addons)

## Testing the Updated Addon

After installing version 1.0.2:

1. **Get Chocolate:**
   ```
   /give @s custom:chocolate
   ```

2. **Eat it** - Hold and consume completely

3. **Expected Results:**
   - ✅ Texture displays (brown chocolate bar)
   - ✅ Eating animation plays
   - ✅ Hunger restores (+4 nutrition)
   - ✅ Speed particles appear around character
   - ✅ Movement speed increases noticeably
   - ✅ Effect lasts 30 seconds
   - ✅ Status effect shows "Speed II" in pause menu

4. **Check Active Effects:**
   - Pause game
   - Look at active effects
   - Should show: "Speed II" with timer

## Common Issues

### Still No Speed Effect?

**Solution 1: Enable Cheats**
Some versions may require cheats enabled for custom effects:
- World Settings → Cheats → ON

**Solution 2: Restart World**
After updating addon:
- Save and quit world
- Relaunch world
- Sometimes effects need a world reload

**Solution 3: Fresh Install**
- Delete old addon versions completely
- Restart Minecraft
- Install new 1.0.2 package

### Effect Appears But Doesn't Work?

Check if the effect is actually active:
- Open pause menu
- Look at "Effects" section
- Speed II should be listed with countdown timer
- If timer shows but no speed boost, this may be a Minecraft bug (rare)

## Event System Explained

The new event system in 1.21+ is more powerful:

```json
"events": {
    "minecraft:on_use": {          // Trigger: when item is used
        "add_mob_effect": {         // Action: add an effect
            "effect": "speed",      // Which effect
            "target": "holder",     // Who gets it (the user)
            "duration": 30,         // How long (seconds)
            "amplifier": 1          // Level (0=I, 1=II, 2=III, etc.)
        }
    }
}
```

**Multiple Effects:**
You can add multiple effects by adding more actions:
```json
"minecraft:on_use": {
    "add_mob_effect": {
        "effect": "speed",
        "target": "holder",
        "duration": 30,
        "amplifier": 1
    },
    "add_mob_effect": {
        "effect": "jump_boost",
        "target": "holder",
        "duration": 30,
        "amplifier": 0
    }
}
```

## Summary of Changes

| Component | Old (1.20.x) | New (1.21+) |
|-----------|-------------|-------------|
| Format Version | 1.20.50 | 1.21.0 |
| Min Engine | [1, 20, 0] | [1, 21, 0] |
| Effects Location | In `minecraft:food` | In `events` |
| Effect Trigger | Automatic on consume | `minecraft:on_use` event |
| Saturation | Numeric (0.3) | String ("low") |
| Use Modifiers | Not required | Required |
| Consume Component | Not required | Required |

## Additional Resources

For more Minecraft 1.21+ addon development information:
- Check official Minecraft creator documentation
- Bedrock Edition changelog for 1.21.0
- Community addon development forums

## Version History

- **v1.0.0**: Initial release (1.20 format, effects didn't work)
- **v1.0.1**: Fixed texture, attempted old effect format (still didn't work on 1.21+)
- **v1.0.2**: Full 1.21.90 compatibility with new event system ✅
