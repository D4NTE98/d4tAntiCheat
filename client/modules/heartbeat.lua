CreateThread(function()
    while true do
        if ACState.ready and ACState.token then
            TriggerServerEvent('d4tAntiCheat:server:heartbeat', ACState.token)
        end

        Wait(Config.Heartbeat.interval)
    end
end)
