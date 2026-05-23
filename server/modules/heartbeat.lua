CreateThread(function()
    while true do
        Wait(Config.Heartbeat.interval)

        if Config.Heartbeat.enabled then
            local now = GetGameTimer()

            for _, id in ipairs(GetPlayers()) do
                local source = tonumber(id)
                local data = ACPlayers[source]

                if data then
                    local elapsed = now - (data.lastHeartbeat or 0)

                    if elapsed > Config.Heartbeat.timeout then
                        data.missed = (data.missed or 0) + 1
                    end

                    if data.missed and data.missed >= Config.Heartbeat.maxMissed then
                        PunishPlayer(source, 'heartbeatMissing', ('missed=%s'):format(data.missed))
                    end
                end
            end
        end
    end
end)
