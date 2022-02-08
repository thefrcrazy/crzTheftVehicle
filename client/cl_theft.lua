local npcData = nil
local npcPed = nil
local onMission = false

local LG = Config.text[Config.lang]

CreateThread(function()
    Wait(500)
    while NetworkIsPlayerActive(PlayerId()) do 
        InitFunction()
        break
        Wait(250)
    end
end)

RegisterNetEvent("crzTheftVeh:sendNpcData")
AddEventHandler("crzTheftVeh:sendNpcData", function(data, onTheft)
    npcData = data
    if not onMission then 
        onMission = onTheft or false
    end
    if onMission and onMission ~= nil then 
        StartTheftMission()
    end
    DeleteNpc()
    Wait(10)
    CreateNpc()
end)

RegisterNetEvent("crzTheftVeh:sendRandomVehicle")
AddEventHandler("crzTheftVeh:sendRandomVehicle", function(data)
    onMission = data
    StartTheftMission()
end)

RegisterNetEvent("crzTheftVeh:stoppingMission")
AddEventHandler("crzTheftVeh:stoppingMission", function()
    onMission = false
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if npcPed then 
        DeleteNpc()
    end
end)

DeleteNpc = function()
    if DoesEntityExist(npcPed) then 
        DeleteEntity(npcPed)
        npcPed = nil
    end
end

CreateNpc = function()
    local model = GetHashKey(Config.npcModel)
    LoadModel(model, function()
        npcPed = CreatePed(26, model, npcData.pos.x, npcData.pos.y, npcData.pos.z-0.98, npcData.head+0.0, 0, 0)
        FreezeEntityPosition(npcPed, true)
        SetEntityInvincible(npcPed, true)
        SetBlockingOfNonTemporaryEvents(npcPed, true)
        LoadDict(Config.npcAnim.dict)
        TaskPlayAnim(npcPed, Config.npcAnim.dict, Config.npcAnim.anim, 2.0, 2.0, -1, 1, 0, false, false, false)
    end)
end

LoadModel = function(model, cbk)
	if not HasModelLoaded(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(100)
		end
	end
    return cbk()
end

LoadDict = function(dict)
    if not HasAnimDictLoaded(dict) then
		RequestAnimDict(dict)
		while not HasAnimDictLoaded(dict) do
			Wait(100)
		end
	end
end

HelpNotify = function(msg)
	AddTextEntry('crzTheftVeh', msg)
	BeginTextCommandDisplayHelp('crzTheftVeh')
	EndTextCommandDisplayHelp(0, false, false, -1)
end


RegisterNetEvent("crzTheftVeh:notify")
AddEventHandler("crzTheftVeh:notify", function(msg)
    Notify(msg)
end)

Notify = function(msg)
	if Config.use_crzNotify then 
		local data = {
			time = 5,
			text = msg,
			color = "blue"
		}
		TriggerEvent("crzNotify::sendNotify", data)
	else
		SetNotificationTextEntry('STRING')
		AddTextComponentString(msg)
		DrawNotification(0, 1)
	end
end

InitFunction = function()
    TriggerServerEvent("crzTheftVeh:getNpcData")
    CreateThread(InitClosestNpc)
end

InitClosestNpc = function()
    while true do 
        local interval = 650
        local pPed = PlayerPedId()
        local pPos = GetEntityCoords(pPed)

        if npcData ~= nil then 
            local dist = #(pPos-npcData.pos)
            if dist <= 1.6 then 
                interval = 5
                HelpNotify(LG.helpHint)
                if IsControlJustPressed(0, 51) then 
                    if not onMission then 
                        onMission = true
                        TriggerServerEvent("crzTheftVeh:getRandomVehicle")
                    else
                        local veh = GetVehiclePedIsIn(pPed, true)
                        local netId = NetworkGetNetworkIdFromEntity(veh)
                        TriggerServerEvent("crzTheftVeh:verifGoodVehicle", netId)
                    end
                end
            end
        end
        Wait(interval)
    end
end


StartTheftMission = function()
    Notify(LG.getVehicle:format(onMission.label))
end