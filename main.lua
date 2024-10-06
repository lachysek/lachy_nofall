local vehicleHash = -1553120962
local fall = false

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        SetWeaponDamageModifier(vehicleHash, 0.0)
        SetPedCanRagdoll(playerPed, false)
        SetPedCanRagdollFromPlayerImpact(playerPed, false)
        -- SetPedRagdollOnCollision(playerPed, false)
        SetPlayerFallDistance(PlayerId(), 1000000.0)
        SetPlayerCanDoDriveBy(PlayerId(), false)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= 0 then
            SetVehicleCheatPowerIncrease(vehicle, 5.0)
            SetVehicleGravityAmount(vehicle, 11.0)
        end
        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local _, ground = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)
        if not fall and IsPedFalling(playerPed) and coords.z - ground < 2.0 then
            ClearPedTasks(playerPed)
            fall = true
        elseif not IsPedFalling(playerPed) then
            fall = false
        end
        if IsPedFalling(playerPed) then
            Wait(0)
        else
            Wait(500)
        end
    end
end)
