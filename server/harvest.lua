RegisterNetEvent('harvest:collect')
AddEventHandler('harvest:collect', function(itemType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local itemConfig = Config.HarvestItems[itemType]
    if not itemConfig then return end

    -- Get the configured amount
    local amount = itemConfig.reward.amount
    
    -- Add items using ox_inventory
    exports.ox_inventory:AddItem(source, itemConfig.reward.item, amount)
    
    -- Notify player using ox_lib
    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Success',
        description = ('You harvested %dx %s'):format(amount, itemConfig.label),
        type = 'success'
    })
end)