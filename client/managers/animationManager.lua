local AnimationManager = {}

function AnimationManager.PlayHarvestAnimation(animation)
    lib.requestAnimDict(animation.dict)
    TaskPlayAnim(PlayerPedId(), animation.dict, animation.clip, 8.0, -8.0, -1, 0, 0, false, false, false)
end

function AnimationManager.StopAnimation()
    ClearPedTasks(PlayerPedId())
end

return AnimationManager