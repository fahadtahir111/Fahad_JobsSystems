# Fahad_JobsSystems

A comprehensive FiveM resource for ESX Legacy that provides a complete job system with harvesting and selling mechanics. This system allows players to harvest various resources and sell them at different locations for different currencies.

## 📋 Table of Contents

- [Features](#features)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Configuration](#configuration)
- [Available Items](#available-items)
- [Selling Points](#selling-points)
- [Commands](#commands)
- [Key Bindings](#key-bindings)
- [File Structure](#file-structure)
- [Support](#support)

## ✨ Features

- **Resource Harvesting System**: Multiple harvestable items with different locations
- **Dynamic Selling Points**: Various NPCs that buy different items for different prices
- **Currency Support**: Both legal money and black money transactions
- **Interactive Zones**: Visual markers and proximity-based interactions
- **Progress Bars**: Smooth harvesting animations with progress indicators
- **Blip System**: Map markers for all harvest and sell locations
- **Inventory Integration**: Full ox_inventory compatibility
- **Notification System**: ox_lib notifications for all actions
- **Modular Design**: Clean, organized code structure with separate managers

## 🔧 Dependencies

- **ESX Legacy** - Core framework
- **ox_lib** - UI and utility functions
- **ox_inventory** - Inventory management system

## 📦 Installation

1. Download the resource and place it in your `resources/[standalone]/` folder
2. Add `ensure Fahad_JobsSystems` to your `server.cfg`
3. Restart your server or start the resource manually
4. Configure the items and locations in `shared/config.lua` as needed

## ⚙️ Configuration

The main configuration file is located at `shared/config.lua`. This file contains:

- **HarvestItems**: Defines all harvestable resources with their locations, animations, and rewards
- **SellingPoints**: Configures all NPCs that buy items, their locations, and pricing

### Configuration Structure

```lua
Config.HarvestItems = {
    [item_name] = {
        label = "Display Name",
        blip = { coords, sprite, color, scale, label },
        marker = { type, scale, color },
        zones = { { coords, radius, cooldown, ped } },
        animation = { dict, clip },
        reward = { item, amount }
    }
}

Config.SellingPoints = {
    {
        name = "NPC Name",
        coords = vector3(x, y, z),
        heading = 0.0,
        pedModel = "model_name",
        items = { { name, price, currency } },
        blip = { sprite, color, scale, name }
    }
}
```

## 🎯 Available Items

### Harvestable Resources

| Item | Label | Location | Reward | Cooldown |
|------|-------|----------|--------|----------|
| **wire** | Wire | Industrial Area (2278, 2969) | 1x wire | 5 seconds |
| **milk** | Milk | Farm Area (2441, 4736) | 1x water | 5 seconds |
| **bitcoin** | Bitcoin | Tech Lab (-1057, -244) | 1x bitcoin | 5 seconds |

### Detailed Item Information

#### 🔌 Wire
- **Location**: Industrial area near the docks
- **Coordinates**: 2278.3455, 2969.6851, 46.5810
- **Blip**: Red wire icon
- **Animation**: Car bomb mechanic animation
- **Zones**: 2 harvest zones available
- **Reward**: 1x wire per harvest

#### 🥛 Milk
- **Location**: Farm area with cows
- **Coordinates**: 2441.1082, 4736.6328, 34.3004
- **Blip**: Green milk icon
- **Animation**: Car bomb mechanic animation
- **Zones**: 2 harvest zones with cow NPCs
- **Reward**: 1x water per harvest

#### 💰 Bitcoin
- **Location**: High-tech laboratory
- **Coordinates**: -1057.59, -244.39, 44.02
- **Blip**: Orange bitcoin icon
- **Animation**: Laptop interaction animation
- **Zones**: 3 harvest zones available
- **Reward**: 1x bitcoin per harvest

## 🏪 Selling Points

### Available NPCs

| NPC Name | Location | Items Bought | Currency Type |
|----------|----------|--------------|---------------|
| **ILLEGAL SELLER** | (139.72, 493.77, 145.32) | water, bitcoin | Black Money |
| **LEGAL SELLER** | (242.85, -1068.75, 29.29) | water, burger | Cash |
| **TECH BUYER** | (-1528.78, -405.59, 35.60) | bitcoin | Cash |

### Pricing Information

#### ILLEGAL SELLER (Black Money)
- **water**: $1,000 per item
- **bitcoin**: $1,500 per item

#### LEGAL SELLER (Cash)
- **water**: $500 per item
- **burger**: $100 per item

#### TECH BUYER (Cash)
- **bitcoin**: $800 per item

## 🎮 Commands

- `/harvest` - Manually trigger harvesting when near a harvest zone

## ⌨️ Key Bindings

- **E Key** - Harvest resources (when in harvest zone)
- **E Key** - Open sell menu (when near selling NPC)

## 📁 File Structure

```
Fahad_JobsSystems/
├── client/
│   ├── main.lua                 # Main client logic
│   ├── sellpoint.lua           # Selling point interactions
│   ├── zones.lua               # Zone management
│   └── managers/
│       ├── animationManager.lua # Animation handling
│       ├── blipManager.lua     # Map blip creation
│       ├── markerManager.lua   # Visual markers
│       └── zoneManager.lua     # Zone creation
├── server/
│   ├── harvest.lua             # Harvest event handling
│   └── sellpoint.lua           # Selling event handling
├── shared/
│   ├── config.lua              # Main configuration
│   └── utils.lua               # Utility functions
├── fxmanifest.lua              # Resource manifest
└── README.md                   # This file
```

## 🔧 Customization

### Adding New Harvest Items

1. Open `shared/config.lua`
2. Add a new entry to `Config.HarvestItems`
3. Configure the location, animation, and reward
4. Restart the resource

### Adding New Selling Points

1. Open `shared/config.lua`
2. Add a new entry to `Config.SellingPoints`
3. Configure the NPC, location, and items they buy
4. Restart the resource

### Modifying Prices

Edit the `price` field in the selling point configuration to change item values.

### Changing Currencies

Modify the `currency` field to switch between `"money"` (cash) and `"black_money"` (dirty money).

## 🐛 Troubleshooting

### Common Issues

1. **Items not appearing**: Check if ox_inventory is properly configured
2. **NPCs not spawning**: Verify ped models exist in your server
3. **Blips not showing**: Ensure blip sprites are valid
4. **Harvesting not working**: Check if zones are properly configured

### Debug Mode

Set `debug = true` in zone configurations to see zone boundaries.

## 📞 Support

For support, issues, or feature requests, please contact the developer or create an issue in the repository.

## 📄 License

This resource is created by Fahad. Please respect the terms of use and do not redistribute without permission.

---

**Version**: 1.0.0  
**Author**: Fahad  
**Framework**: ESX Legacy  
**Last Updated**: 2024
