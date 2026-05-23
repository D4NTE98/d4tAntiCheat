local banFile = 'bans.json'

local function saveBans()
    SaveResourceFile(GetCurrentResourceName(), banFile, json.encode(ACBans, {
        indent = true
    }), -1)
end

function LoadACBans()
    local raw = LoadResourceFile(GetCurrentResourceName(), banFile)

    if raw and raw ~= '' then
        local decoded = json.decode(raw)

        if type(decoded) == 'table' then
            ACBans = decoded
        end
    end

    return ACBans
end

function AddACBan(source, reason)
    local identifiers = D4TAntiCheat.IdentifierList(source)

    ACBans[#ACBans + 1] = {
        name = GetPlayerName(source) or 'Unknown',
        reason = reason,
        identifiers = identifiers,
        created = os.time()
    }

    saveBans()
end

AddEventHandler('playerConnecting', function(_, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)

    LoadACBans()

    for _, ban in ipairs(ACBans) do
        for _, identifier in ipairs(identifiers) do
            for _, bannedIdentifier in ipairs(ban.identifiers or {}) do
                if identifier == bannedIdentifier then
                    deferrals.done(('You are banned by d4tAntiCheat. Reason: %s'):format(ban.reason or 'Anti-cheat violation'))
                    CancelEvent()
                    return
                end
            end
        end
    end
end)

LoadACBans()
