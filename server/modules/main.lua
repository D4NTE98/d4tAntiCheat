AddEventHandler('playerJoining', function()
    local source = source
    IssueACToken(source)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end

    Wait(1000)

    for _, id in ipairs(GetPlayers()) do
        IssueACToken(tonumber(id))
    end
end)

exports('CheckToken', ValidateACToken)
exports('Punish', PunishPlayer)
exports('IssueToken', IssueACToken)
