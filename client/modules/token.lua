RegisterNetEvent('d4tAntiCheat:client:setToken', function(token)
    if type(token) ~= 'string' then
        return
    end

    ACState.token = token
    ACState.ready = true
    ACState.lastToken = GetGameTimer()
end)

function GetAntiCheatToken()
    return ACState.token
end

exports('Token', GetAntiCheatToken)
