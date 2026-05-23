local function flag(reason, data)
    if not ACState.ready or not ACState.token then
        return
    end

    TriggerServerEvent('d4tAntiCheat:server:flag', ACState.token, reason, data or {})
end

local function checkGodmode(ped)
    if not Config.Detections.godmode then
        return
    end

    local health = GetEntityHealth(ped)
    local armor = GetPedArmour(ped)

    if health > Config.ClientScan.maxHealth or armor > Config.ClientScan.maxArmor then
        flag('godmode', {
            health = health,
            armor = armor
        })
    end
end

local function checkInvisible(ped)
    if not Config.Detections.invisible then
        return
    end

    if not IsEntityVisible(ped) and not IsPedInAnyVehicle(ped, false) then
        flag('invisible', {})
    end
end

local function checkSpeed(ped)
    if not Config.Detections.speedhack then
        return
    end

    local speed = GetEntitySpeed(ped)
    local limit = IsPedInAnyVehicle(ped, false) and Config.ClientScan.maxSpeedInVehicle or Config.ClientScan.maxSpeedOnFoot

    if speed > limit then
        flag('speedhack', {
            speed = speed,
            limit = limit
        })
    end
end

local function checkSpectate()
    if not Config.Detections.spectate then
        return
    end

    if NetworkIsInSpectatorMode() then
        flag('spectate', {})
    end
end

CreateThread(function()
    while true do
        if ACState.ready then
            local ped = PlayerPedId()

            checkGodmode(ped)
            checkInvisible(ped)
            checkSpeed(ped)
            checkSpectate()
        end

        Wait(Config.ClientScan.interval)
    end
end)
