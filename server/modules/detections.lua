local weaponHashes = {}
local vehicleHashes = {}

CreateThread(function()
    for _, weapon in ipairs(Config.BlacklistedWeapons) do
        weaponHashes[joaat(weapon)] = weapon
    end

    for _, vehicle in ipairs(Config.BlacklistedVehicles) do
        vehicleHashes[joaat(vehicle)] = vehicle
    end
end)

AddEventHandler('weaponDamageEvent', function(source, data)
    if not Config.Detections.weapons then
        return
    end

    if not CheckACRate(source, 'weaponDamage', Config.RateLimits.maxEvents, Config.RateLimits.window) then
        CancelEvent()
        PunishPlayer(source, 'eventSpam', 'weapon damage spam')
        return
    end

    if data and data.weaponType and weaponHashes[data.weaponType] then
        CancelEvent()
        PunishPlayer(source, 'blacklistedWeapon', weaponHashes[data.weaponType])
    end
end)

AddEventHandler('explosionEvent', function(source, data)
    if not Config.Detections.explosions then
        return
    end

    if not CheckACRate(source, 'explosion', Config.RateLimits.maxEvents, Config.RateLimits.window) then
        CancelEvent()
        PunishPlayer(source, 'explosionAbuse', 'explosion spam')
        return
    end

    if data and Config.BlacklistedExplosions[data.explosionType] then
        CancelEvent()
        PunishPlayer(source, 'explosionAbuse', tostring(data.explosionType))
    end
end)

AddEventHandler('entityCreating', function(entity)
    if not Config.Detections.entities then
        return
    end

    local owner = NetworkGetEntityOwner(entity)

    if not owner or owner <= 0 then
        return
    end

    local entityType = GetEntityType(entity)
    local model = GetEntityModel(entity)

    if entityType == 2 and vehicleHashes[model] then
        CancelEvent()
        PunishPlayer(owner, 'blacklistedVehicle', vehicleHashes[model])
        return
    end

    if not Config.EntityLimits.enabled then
        return
    end

    local now = GetGameTimer()
    local data = ACEntities[owner] or {
        start = now,
        vehicles = 0,
        peds = 0,
        objects = 0
    }

    if now - data.start > Config.EntityLimits.window then
        data.start = now
        data.vehicles = 0
        data.peds = 0
        data.objects = 0
    end

    if entityType == 1 then
        data.peds = data.peds + 1
    elseif entityType == 2 then
        data.vehicles = data.vehicles + 1
    elseif entityType == 3 then
        data.objects = data.objects + 1
    end

    ACEntities[owner] = data

    if data.vehicles > Config.EntityLimits.maxVehicles or data.peds > Config.EntityLimits.maxPeds or data.objects > Config.EntityLimits.maxObjects then
        CancelEvent()
        PunishPlayer(owner, 'eventSpam', 'entity spawn limit')
    end
end)
