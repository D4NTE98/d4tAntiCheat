for _, eventName in ipairs(Config.ProtectedEvents) do
    RegisterNetEvent(eventName, function(token)
        local source = source

        if not ValidateACToken(source, token) then
            CancelEvent()
            PunishPlayer(source, 'invalidToken', eventName)
            return
        end

        if not CheckACRate(source, eventName, Config.RateLimits.protectedEventMax, Config.RateLimits.protectedEventWindow) then
            CancelEvent()
            PunishPlayer(source, 'eventSpam', eventName)
        end
    end)
end

RegisterNetEvent('d4tAntiCheat:server:flag', function(token, violation, data)
    local source = source

    if not ValidateACToken(source, token) then
        PunishPlayer(source, 'invalidToken', 'client flag invalid token')
        return
    end

    if not CheckACRate(source, 'clientFlag', Config.RateLimits.maxEvents, Config.RateLimits.window) then
        PunishPlayer(source, 'eventSpam', 'client flag spam')
        return
    end

    if type(violation) ~= 'string' then
        return
    end

    PunishPlayer(source, violation, json.encode(data or {}))
end)

RegisterNetEvent('d4tAntiCheat:server:resourceStopped', function()
    local source = source

    if Config.Detections.resourceStop then
        PunishPlayer(source, 'resourceStop', 'client resource stopped')
    end
end)
