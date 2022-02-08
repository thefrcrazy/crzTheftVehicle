SetTimeout(500, function()
    if Config.framework == "ESX" then
        ESX = nil
        TriggerEvent(Config.eventESX, function(obj) ESX = obj end)

    elseif Config.framework == "QBCore" then
        QBCore = nil
        QBCore = exports['qb-core']:GetCoreObject()

    end
end)

PaidPlayer = function(src, price)
    if Config.framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addMoney(price)

    elseif Config.framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney("cash", price)

    end
end