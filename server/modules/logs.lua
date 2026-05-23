function ACLog(source, violation, details)
    if not Config.Logs.enabled then
        return
    end

    local name = source and GetPlayerName(source) or 'Console'
    local line = ('[d4tAntiCheat] %s | %s | %s'):format(name or 'Unknown', violation or 'unknown', details or '-')

    if Config.Logs.console then
        print(line)
    end

    if Config.Logs.webhook and Config.Logs.webhook ~= '' then
        PerformHttpRequest(Config.Logs.webhook, function() end, 'POST', json.encode({
            username = 'd4tAntiCheat',
            content = line
        }), {
            ['Content-Type'] = 'application/json'
        })
    end
end
