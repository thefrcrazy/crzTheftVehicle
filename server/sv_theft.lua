local ms = 1000
local s = 1*ms
local m = 60*s

local npcData = nil
local playersInMission = {}
local playersWaiting = {}
local LG = Config.text[Config.lang]

CreateThread(function()
    while true do 
        local max = #Config.npc
        local rdm = math.random(1, max)
        npcData = Config.npc[rdm]
        TriggerClientEvent("crzTheftVeh:sendNpcData", -1, npcData)
        Wait(Config.npcTime*m)
    end
end)

RegisterNetEvent("crzTheftVeh:getNpcData")
AddEventHandler("crzTheftVeh:getNpcData", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    TriggerClientEvent("crzTheftVeh:sendNpcData", src, npcData, playersInMission[identifier])
end)

RegisterNetEvent("crzTheftVeh:getRandomVehicle")
AddEventHandler("crzTheftVeh:getRandomVehicle", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local starting = true
    if playersWaiting[identifier] then 
        local time = os.time()
        if time < playersWaiting[identifier] then 
            starting = false
        end
    end
    if starting then 
        playersInMission[identifier] = GetRandomVeh(Config.vehicles)
        TriggerClientEvent("crzTheftVeh:sendRandomVehicle", src, playersInMission[identifier])
    else
        TriggerClientEvent("crzTheftVeh:stoppingMission", src)
        Notify(src, LG.notVehicle)
    end
end)

RegisterNetEvent("crzTheftVeh:verifGoodVehicle")
AddEventHandler("crzTheftVeh:verifGoodVehicle", function(netId)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    local dVeh = playersInMission[identifier]

    local veh = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(veh) then 
        local vehPos = GetEntityCoords(veh)
        if #(vehPos-npcData.pos) > 5.0 then 
            Notify(src, LG.nearVehicle)
        else
            if GetEntityModel(veh) == GetHashKey(dVeh.name) then 
                local time = os.time()
                playersWaiting[identifier] = time+(60*Config.waitTime)
                if playersInMission[identifier] then 
                    playersInMission[identifier] = nil
                end
                Notify(src, LG.goodVehicle:format(dVeh.price))
                TriggerClientEvent("crzTheftVeh:stoppingMission", src)
                PaidPlayer(src, dVeh.price)
                SetTimeout(5000, function()
                    DeleteEntity(veh)
                end)
            else
                Notify(src, LG.errorVehicle:format(dVeh.label))
            end
        end
    else
        Notify(src, LG.airVehicle)
    end
end)


GetRandomVeh = function(table)
    local i = 0
    local random = math.random(1, 10000)
    for _, data in ipairs(table) do
        i = i + (data.percent*100)
        if random <= i then
            return data
        end
    end
    return nil
end

Notify = function(src, msg)
    TriggerClientEvent("crzTheftVeh:notify", src, msg)
end