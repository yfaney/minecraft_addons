#!/bin/bash

# Chocolate Addon Packaging Script
# Creates a .mcaddon file for easy distribution to mobile devices

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}Chocolate Addon Packager${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Output file
OUTPUT_FILE="Chocolate.mcaddon"
TEMP_DIR="temp_package"

# Clean up any previous builds
echo -e "${YELLOW}Cleaning up previous builds...${NC}"
rm -f "$OUTPUT_FILE"
rm -rf "$TEMP_DIR"

# Create temporary directory
mkdir -p "$TEMP_DIR"

# Validate JSON files
echo -e "${BLUE}Validating JSON files...${NC}"
JSON_FILES=(
    "resource_pack/manifest.json"
    "behavior_pack/manifest.json"
    "behavior_pack/items/chocolate.json"
    "behavior_pack/recipes/chocolate.json"
)

for json_file in "${JSON_FILES[@]}"; do
    if [ -f "$json_file" ]; then
        if python3 -m json.tool "$json_file" > /dev/null 2>&1; then
            echo -e "  ${GREEN}✓${NC} $json_file"
        else
            echo -e "  ${RED}✗${NC} $json_file - INVALID JSON!"
            exit 1
        fi
    else
        echo -e "  ${RED}✗${NC} $json_file - FILE NOT FOUND!"
        exit 1
    fi
done

# Check for texture
echo -e "${BLUE}Checking texture file...${NC}"
if [ -f "resource_pack/textures/items/chocolate.png" ]; then
    echo -e "  ${GREEN}✓${NC} Texture found: chocolate.png"
else
    echo -e "  ${YELLOW}⚠${NC} Warning: chocolate.png not found (addon will work but show missing texture)"
fi

# Copy packs to temp directory
echo -e "${BLUE}Copying pack files...${NC}"
cp -r resource_pack "$TEMP_DIR/"
cp -r behavior_pack "$TEMP_DIR/"

# Remove any unwanted files (macOS metadata, etc.)
echo -e "${BLUE}Cleaning up metadata files...${NC}"
find "$TEMP_DIR" -name ".DS_Store" -delete
find "$TEMP_DIR" -name "._*" -delete
find "$TEMP_DIR" -name "*.txt" -delete

# Create the .mcaddon file (it's just a zip)
echo -e "${BLUE}Creating .mcaddon package...${NC}"
cd "$TEMP_DIR"
zip -r "../$OUTPUT_FILE" resource_pack/ behavior_pack/ -q
cd ..

# Clean up temp directory
rm -rf "$TEMP_DIR"

# Get file size
if [ -f "$OUTPUT_FILE" ]; then
    FILE_SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)
    echo ""
    echo -e "${GREEN}================================${NC}"
    echo -e "${GREEN}✓ Package created successfully!${NC}"
    echo -e "${GREEN}================================${NC}"
    echo ""
    echo -e "📦 File: ${BLUE}$OUTPUT_FILE${NC}"
    echo -e "📊 Size: ${BLUE}$FILE_SIZE${NC}"
    echo -e "📍 Location: ${BLUE}$SCRIPT_DIR/$OUTPUT_FILE${NC}"
    echo ""
    echo -e "${YELLOW}Next Steps:${NC}"
    echo "1. Transfer $OUTPUT_FILE to your mobile device"
    echo "2. Open the file with Minecraft"
    echo "3. The addon will be automatically imported"
    echo "4. Activate it in your world settings"
    echo ""
    echo -e "${BLUE}Transfer Methods:${NC}"
    echo "  • AirDrop (iOS)"
    echo "  • Email/Messaging app"
    echo "  • Cloud storage (iCloud, Google Drive, Dropbox)"
    echo "  • USB cable file transfer"
    echo ""
else
    echo -e "${RED}✗ Error: Failed to create package${NC}"
    exit 1
fi
