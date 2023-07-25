Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
            if IsPedFalling(PlayerPedId()) then
                SetEntityInvincible(PlayerPedId(), true)
                SetPlayerInvincible(PlayerId(), true)
                ClearPedBloodDamage(PlayerPedId())
                ResetPedVisibleDamage(PlayerPedId())
                ClearPedLastWeaponDamage(PlayerPedId())
                SetEntityProofs(PlayerPedId(), true, true, true, true, true, true, true, true)
                SetEntityOnlyDamagedByPlayer(PlayerPedId(), false)
                SetEntityCanBeDamaged(PlayerPedId(), false)
            else
                SetEntityInvincible(PlayerPedId(), false)
                SetPlayerInvincible(PlayerId(), false)
                ClearPedLastWeaponDamage(PlayerPedId())
                SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false)
                SetEntityOnlyDamagedByPlayer(PlayerPedId(), false)
                SetEntityCanBeDamaged(PlayerPedId(), true)
            end 
	end
end)
