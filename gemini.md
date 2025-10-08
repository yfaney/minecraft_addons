# 💎 GEMINI.md for Minecraft Addon Development

This guide provides the foundational steps and structure for creating your own Minecraft (Bedrock Edition) addon.

## 🚀 Getting Started

Before you begin, you'll need a few things:

* **Minecraft for Windows 10/11 or a mobile device:** This is necessary for testing your addon.
* **A code editor:** Visual Studio Code is highly recommended.
* **A JSON validator:** To ensure your JSON files are correctly formatted.

Your addon project will be contained in a main folder, which will house your resource and behavior packs. The game accesses these from the `development_resource_packs` and `development_behavior_packs` folders located in the `com.mojang` directory.

## 🎨 Resource Packs

Resource packs control the look and feel of your addon. They contain textures, models, sounds, and text files.

A basic resource pack has the following structure:
your_addon_resource_pack/
├── manifest.json
├── texts/
│   └── en_US.lang
└── textures/
└── items/
└── ruby.png


### `your_addon_resource_pack/manifest.json`
*Remember to generate two unique UUIDs for this file.*
```json
{
    "format_version": 2,
    "header": {
        "description": "My awesome addon resource pack!",
        "name": "My Addon Resources",
        "uuid": "GENERATE-A-NEW-UUID-1",
        "version": [1, 0, 0],
        "min_engine_version": [1, 16, 0]
    },
    "modules": [
        {
            "description": "My awesome addon resources!",
            "type": "resources",
            "uuid": "GENERATE-A-NEW-UUID-2",
            "version": [1, 0, 0]
        }
    ]
}
your_addon_resource_pack/texts/en_US.lang

This file defines the in-game names for your custom items, blocks, etc.

item.custom:ruby.name=Ruby
⚙️ Behavior Packs
Behavior packs control the logic of your addon. They define how blocks, items, and entities behave.

A basic behavior pack has the following structure:

your_addon_behavior_pack/
├── manifest.json
└── items/
    └── ruby.json
your_addon_behavior_pack/manifest.json

Remember to generate two more unique UUIDs. The dependencies UUID must match the first UUID from your resource pack's manifest.json.

JSON
{
    "format_version": 2,
    "header": {
        "description": "My awesome addon behavior pack!",
        "name": "My Addon Behaviors",
        "uuid": "GENERATE-A-NEW-UUID-3",
        "version": [1, 0, 0],
        "min_engine_version": [1, 16, 0]
    },
    "modules": [
        {
            "description": "My awesome addon behaviors!",
            "type": "data",
            "uuid": "GENERATE-A-NEW-UUID-4",
            "version": [1, 0, 0]
        }
    ],
    "dependencies": [
        {
            "uuid": "PASTE-UUID-1-FROM-RESOURCE-PACK-HERE",
            "version": [1, 0, 0]
        }
    ]
}
your_addon_behavior_pack/items/ruby.json

This file defines the behavior of your custom ruby item.

JSON
{
    "format_version": "1.16.100",
    "minecraft:item": {
        "description": {
            "identifier": "custom:ruby",
            "category": "items"
        },
        "components": {
            "minecraft:hand_equipped": false,
            "minecraft:max_stack_size": 64,
            "minecraft:foil": false,
            "minecraft:stack_by_data": true,
            "minecraft:icon": {
                "texture": "ruby"
            }
        }
    }
}
