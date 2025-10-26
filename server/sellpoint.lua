local ox_inventory = exports.ox_inventory

RegisterNetEvent('Fahad_JobsSystemsSystems:sellSelectedItem', function(itemName, itemPrice, currency)
    local src = source
    local player = QBCore and QBCore.Functions.GetPlayer(src) or ESX and ESX.GetPlayerFromId(src)
    local itemCount = ox_inventory:Search(src, 'count', itemName) or 0

    if itemCount > 0 then
        ox_inventory:RemoveItem(src, itemName, itemCount)
        local totalEarned = itemCount * itemPrice

        -- Add money based on currency type
        if QBCore then
            player.Functions.AddMoney(currency or 'cash', totalEarned, 'Sold ' .. itemName)
        elseif ESX then
            if currency == 'black_money' then
                player.addAccountMoney('black_money', totalEarned)
            else
                player.addMoney(totalEarned)
            end
        else
            ox_inventory:AddItem(src, currency or 'black_moeny', totalEarned)
        end

        TriggerClientEvent('ox_lib:notify', src, {
            type = 'success',
            description = ('You sold %d x %s for $%d!'):format(itemCount, itemName, totalEarned)
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = ('You do not have any %s to sell!'):format(itemName)
        })
    end
end)

RegisterNetEvent('fahad_jobs:sellItems')
AddEventHandler('fahad_jobs:sellItems', function(itemName, amount, price, currency)
    local src = source
    
    -- Check if player has the items
    local hasItem = exports.ox_inventory:Search(src, 'count', itemName)
    
    if hasItem >= amount then
        local totalPrice = price * amount
        
        -- Remove items
        local success = exports.ox_inventory:RemoveItem(src, itemName, amount)
        
        if success then
            -- Add money based on currency type
            if currency == "black_money" then
                exports.ox_inventory:AddItem(src, 'black_money', totalPrice)
            else
                exports.ox_inventory:AddItem(src, 'money', totalPrice)
            end
            
            -- Notify success
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Success',
                description = string.format('Sold %dx %s for $%s', amount, itemName, totalPrice),
                type = 'success'
            })
        else
            -- If remove failed, notify error
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Error',
                description = 'Failed to sell items',
                type = 'error'
            })
        end
    else
        -- Not enough items
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Error',
            description = 'You don\'t have enough items',
            type = 'error'
        })
    end
end)