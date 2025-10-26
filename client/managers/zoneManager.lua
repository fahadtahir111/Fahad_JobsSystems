local ZoneManager = {}

-- Helper function to spawn ped
local function createZonePed(pedConfig, coords)
    if not pedConfig or not pedConfig.enabled then return end
    
    local pedModel = GetHashKey(pedConfig.model)
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(0)
    end

    local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z - 1.0, pedConfig.heading, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    
    if pedConfig.scenario then
        TaskStartScenarioInPlace(ped, pedConfig.scenario, 0, true)
    end
    
    return ped
end

function ZoneManager.CreateHarvestZone(item, zoneData)
    -- Spawn ped if configured
    if zoneData.ped then
        createZonePed(zoneData.ped, zoneData.coords)
    end
    
    return lib.zones.sphere({
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
end

return ZoneManager