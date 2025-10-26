local BlipManager = {}

function BlipManager.CreateBlip(coords, blipData)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, blipData.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, blipData.scale)
    SetBlipColour(blip, blipData.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.label)
    EndTextCommandSetBlipName(blip)
    return blip
end

function BlipManager.CreateHarvestBlips()
    for item, data in pairs(Config.HarvestItems) do
        -- Create single central blip for each harvest area
        BlipManager.CreateBlip(data.blip.coords, data.blip)
    end
end

return BlipManager