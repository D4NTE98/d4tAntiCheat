function HasACBypass(source)
    return IsPlayerAceAllowed(source, Config.Permissions.bypassAce)
end

function PunishPlayer(source, violation, details)
    if not source or source <= 0 then
        return
    end

    if HasACBypass(source) then
        ACLog(source, violation, 'bypassed')
        return
    end

    local punishment = Config.Punishments[violation] or Config.Punishments.default
    local reason = ('d4tAntiCheat: %s'):format(violation)

    ACLog(source, violation, details or punishment)

    if punishment == 'ban' then
        AddACBan(source, reason)
        DropPlayer(source, reason)
        return
    end

    if punishment == 'kick' then
        DropPlayer(source, reason)
    end
end
