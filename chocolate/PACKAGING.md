# Packaging the Chocolate Addon

## Quick Start

To create the `.mcaddon` file for distribution:

```bash
./package.sh
```

This will create `Chocolate.mcaddon` in the current directory.

## What the Script Does

The `package.sh` script:

1. ✅ **Validates** all JSON files for syntax errors
2. ✅ **Checks** for the chocolate texture
3. 🧹 **Cleans** up macOS metadata files (.DS_Store, ._* files)
4. 📦 **Packages** both resource_pack and behavior_pack into a .mcaddon file
5. 📊 **Reports** file size and location

## Transferring to Mobile Device

### iOS (iPhone/iPad)

**Option 1: AirDrop** (Easiest)
1. Right-click `Chocolate.mcaddon` on your Mac
2. Select "Share" → "AirDrop"
3. Select your iOS device
4. On iOS, tap to accept
5. Choose "Open in Minecraft"

**Option 2: iCloud Drive**
1. Copy `Chocolate.mcaddon` to iCloud Drive
2. On iOS, open Files app
3. Navigate to the file
4. Tap to open with Minecraft

**Option 3: Email/Messages**
1. Attach `Chocolate.mcaddon` to an email or message
2. Send to yourself
3. Open on iOS device and tap the attachment
4. Choose "Open in Minecraft"

### Android

**Option 1: Google Drive/Dropbox**
1. Upload `Chocolate.mcaddon` to cloud storage
2. Download on Android device
3. Tap the file to open with Minecraft

**Option 2: USB Transfer**
1. Connect Android device via USB
2. Copy `Chocolate.mcaddon` to Downloads folder
3. Use file manager to locate and open with Minecraft

**Option 3: Email**
1. Email the file to yourself
2. Open email on Android
3. Download and open with Minecraft

## Installing on Mobile

Once transferred:

1. Tap/click `Chocolate.mcaddon`
2. Minecraft will automatically launch
3. You'll see "Import Started" notification
4. Once imported, it's available in all worlds

## Activating in a World

1. Create a new world or edit existing world settings
2. Go to **Behavior Packs**
3. Find "Chocolate Behaviors" under "Available"
4. Tap to activate (moves to "Active")
5. Go to **Resource Packs**
6. Find "Chocolate Resources" under "Available"
7. Tap to activate
8. **Important**: Enable "Education Edition" in world settings
9. Start playing!

## Troubleshooting

### "Import Failed" error
- Make sure the .mcaddon file wasn't corrupted during transfer
- Try repackaging with `./package.sh`
- Ensure Minecraft is updated to latest version

### Addon doesn't appear in world
- Check that both behavior AND resource packs are activated
- Make sure they're in the "Active" section, not just "Available"

### Speed effect not working
- Enable "Education Edition" in world settings
- Enable "Cheats" in world settings
- Both are required for the effect command to work

## File Information

- **Package Name**: Chocolate.mcaddon
- **Size**: ~5-8 KB
- **Contains**: 
  - Resource pack (texture, language file, manifest)
  - Behavior pack (item definition, recipe, manifest)

## Rebuilding

If you make changes to the addon:

1. Edit the files in `resource_pack/` or `behavior_pack/`
2. Run `./package.sh` again
3. Transfer the new `Chocolate.mcaddon` to your device
4. Minecraft will ask if you want to replace the existing addon

## Script Location

`package.sh` is located in the chocolate addon root directory:
```
/Users/yjang/git/public/minecraft_addons/chocolate/package.sh
```
