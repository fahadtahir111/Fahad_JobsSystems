local ZoneManager = require 'client.managers.zoneManager'
local AnimationManager = require 'client.managers.animationManager'
local BlipManager = require 'client.managers.blipManager'
local MarkerManager = require 'client.managers.markerManager'

local isHarvesting = false

local function startHarvesting(item, zoneData)
    if isHarvesting then return end
    isHarvesting = true

    local itemConfig = Config.HarvestItems[item]
    
    -- Start progress bar and animation
    AnimationManager.PlayHarvestAnimation(itemConfig.animation)
    
    if lib.progressBar({
        duration = zoneData.cooldown,
        label = 'Harvesting ' .. itemConfig.label,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true
        }
    }) then
        -- Trigger harvest completion
        TriggerServerEvent('harvest:collect', item)
    end

    AnimationManager.StopAnimation()
    isHarvesting = false
end

-- Initialize blips
CreateThread(function()
    BlipManager.CreateHarvestBlips()
end)

-- Create harvest zones and draw markers
CreateThread(function()
    for item, data in pairs(Config.HarvestItems) do
        for _, zone in ipairs(data.zones) do
            ZoneManager.CreateHarvestZone(item, zone)
        end
    end

    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())

        for item, data in pairs(Config.HarvestItems) do
            for _, zone in ipairs(data.zones) do
                local distance = #(playerCoords - zone.coords)
                if distance <= 30.0 then
                    sleep = 0
                    MarkerManager.DrawMarker(zone.coords, data.marker)
                end
            end
        end

        Wait(sleep)
    end
end)

-- Register harvest command
RegisterCommand('harvest', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    for item, data in pairs(Config.HarvestItems) do
        for _, zone in ipairs(data.zones) do
            local distance = #(playerCoords - zone.coords)
            if distance <= zone.radius then
                startHarvesting(item, zone)
                break
            end
        end
    end
end)

RegisterKeyMapping('harvest', 'Harvest Resources', 'keyboard', 'E')

