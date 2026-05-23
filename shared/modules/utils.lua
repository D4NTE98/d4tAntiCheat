D4TAntiCheat = D4TAntiCheat or {}

function D4TAntiCheat.Hash(value)
    local hash = 5381

    for index = 1, #value do
        hash = ((hash * 33) ~ value:byte(index)) & 0xffffffff
    end

    return tostring(hash)
end

function D4TAntiCheat.RandomString(length)
    local charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local result = {}

    for index = 1, length do
        local rand = math.random(1, #charset)
        result[index] = charset:sub(rand, rand)
    end

    return table.concat(result)
end

function D4TAntiCheat.Time()
    return os.time()
end

function D4TAntiCheat.Now()
    return GetGameTimer()
end

function D4TAntiCheat.SafeReason(value)
    if type(value) ~= 'string' or value == '' then
        return 'Anti-cheat violation'
    end

    return value
end

function D4TAntiCheat.Contains(list, value)
    if type(list) ~= 'table' then
        return false
    end

    for _, item in ipairs(list) do
        if item == value then
            return true
        end
    end

    return false
end

function D4TAntiCheat.IdentifierList(source)
    local result = {}

    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        result[#result + 1] = identifier
    end

    return result
end
