local function createToken(source)
    local seed = ('%s:%s:%s:%s'):format(source, os.time(), math.random(100000, 999999), GetPlayerEndpoint(source) or 'endpoint')
    return D4TAntiCheat.RandomString(Config.Token.minLength) .. D4TAntiCheat.Hash(seed)
end

function IssueACToken(source)
    local token = createToken(source)

    ACPlayers[source] = ACPlayers[source] or {}
    ACPlayers[source].token = token
    ACPlayers[source].lastHeartbeat = GetGameTimer()
    ACPlayers[source].missed = 0
    ACPlayers[source].issuedAt = GetGameTimer()

    TriggerClientEvent('d4tAntiCheat:client:setToken', source, token)

    return token
end

function ValidateACToken(source, token)
    if not Config.Token.enabled then
        return true
    end

    local data = ACPlayers[source]

    if not data or type(token) ~= 'string' or token ~= data.token then
        return false
    end

    return true
end

CreateThread(function()
    while true do
        Wait(Config.Token.rotateEvery)

        for _, id in ipairs(GetPlayers()) do
            IssueACToken(tonumber(id))
        end
    end
end)

RegisterNetEvent('d4tAntiCheat:server:heartbeat', function(token)
    local source = source

    if not ValidateACToken(source, token) then
        PunishPlayer(source, 'invalidToken', 'heartbeat invalid token')
        return
    end

    ACPlayers[source] = ACPlayers[source] or {}
    ACPlayers[source].lastHeartbeat = GetGameTimer()
    ACPlayers[source].missed = 0
end)
