function CheckACRate(source, bucketName, maxEvents, window)
    if not Config.RateLimits.enabled then
        return true
    end

    local now = GetGameTimer()
    local key = ('%s:%s'):format(source, bucketName)
    local bucket = ACRate[key] or {
        start = now,
        count = 0
    }

    if now - bucket.start > window then
        bucket.start = now
        bucket.count = 0
    end

    bucket.count = bucket.count + 1
    ACRate[key] = bucket

    return bucket.count <= maxEvents
end

AddEventHandler('playerDropped', function()
    local source = source

    ACPlayers[source] = nil

    for key in pairs(ACRate) do
        if key:find('^' .. source .. ':') then
            ACRate[key] = nil
        end
    end
end)
