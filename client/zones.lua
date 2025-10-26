local function createHarvestZone(item, zoneData)
    local zone = lib.zones.sphere({
        coords = zoneData.coords,
        radius = zoneData.radius,
        debug = false,
        inside = function()
            lib.showTextUI('[E] Harvest ' .. Config.HarvestItems[item].label)
        end,
        onExit = function()
            lib.hideTextUI()
        end
    })
    
    return zone
end

CreateThread(function()
    for item, data in pairs(Config.HarvestItems) do
        for _, zone in ipairs(data.zones) do
            createHarvestZone(item, zone)
        end
    end
end)