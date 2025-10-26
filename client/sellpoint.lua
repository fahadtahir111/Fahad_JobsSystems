local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)

local function createPed(point)
    local pedModel = GetHashKey(point.pedModel)
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(0)
    end

    local ped = CreatePed(4, pedModel, point.coords.x, point.coords.y, point.coords.z - 1.0, point.heading, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
end

local function createBlip(point)
    if point.blip then
        local blip = AddBlipForCoord(point.coords.x, point.coords.y, point.coords.z)

        SetBlipSprite(blip, point.blip.sprite)          -- Set the blip icon
        SetBlipDisplay(blip, 4)                        -- Set to always display
        SetBlipScale(blip, point.blip.scale)           -- Adjust the blip size
        SetBlipColour(blip, point.blip.color)          -- Assign the configured color
        SetBlipAsShortRange(blip, true)                -- Only show on the minimap
        BeginTextCommandSetBlipName("STRING")          -- Start the text setup
        AddTextComponentString(point.blip.name)        -- Add the name from the config
        EndTextCommandSetBlipName(blip)                -- Finish up
    end
end

local function openSellMenu(point)
    local menuOptions = {}
    
    for _, item in ipairs(point.items) do
        -- Check if player has the item first
        local hasItem = exports.ox_inventory:Search('count', item.name)
        
        if hasItem > 0 then
            table.insert(menuOptions, {
                title = item.name,
                description = ('Sell for $%d each (%s) - You have: %d'):format(
                    item.price, 
                    item.currency == "black_money" and "Black Money" or "Cash",
                    hasItem
                ),
                onSelect = function()
                    local input = lib.inputDialog('Sell Items', {
                        {type = 'number', label = 'Amount', default = 1, min = 1, max = hasItem}
                    })
                    if input and input[1] then
                        TriggerServerEvent('fahad_jobs:sellItems', item.name, input[1], item.price, item.currency)
                    end
                end
            })
        end
    end

    if #menuOptions > 0 then
        lib.registerContext({
            id = 'sell_menu',
            title = 'Sell Items',
            options = menuOptions
        })
        lib.showContext('sell_menu')
    else
        lib.notify({
            title = 'Error',
            description = 'You don\'t have any items to sell!',
            type = 'error'
        })
    end
end

local function checkProximity(point)
    local distance = #(playerCoords - point.coords)
    if distance < 2.5 then
        -- Display 3D text to prompt interaction
        DrawText3D(point.coords.x, point.coords.y, point.coords.z, "[E] Open Sell Menu")

        if IsControlJustReleased(0, 38) then -- "E" key
            openSellMenu(point)
        end
    end
end

-- Utility: 3D Text Display
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Initialize Selling Points
CreateThread(function()
    for _, point in ipairs(Config.SellingPoints) do
        createPed(point)
        createBlip(point)
    end

    while true do
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        for _, point in ipairs(Config.SellingPoints) do
            checkProximity(point)
        end
        Wait(0) -- Prevent freezing
    end
end)

