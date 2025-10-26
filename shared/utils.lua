Utils = {}

function Utils.HasRequiredIngredients(playerInventory, recipe)
    for _, ingredient in ipairs(recipe.ingredients) do
        local item = playerInventory[ingredient.item]
        if not item or item.count < ingredient.amount then
            return false
        end
    end
    return true
end