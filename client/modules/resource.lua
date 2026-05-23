AddEventHandler('onClientResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end

    ACState.stopped = true
    TriggerServerEvent('d4tAntiCheat:server:resourceStopped')
end)
