Config = {
	lang = "en",

	framework = "ESX", -- ESX or QBCore or Ur Framework        Add your custom framework on sv_paid.lua
	eventESX = "esx:getSharedObject", -- if using ESX

	use_crzNotify = false, -- start crzNotify >> https://thefrcrazy-shop.tebex.io/package/4842150
	
	npc = {
		{ pos = vector3(-437.24, -2170.59, 10.32), head = 39.0 },
		{ pos = vector3(1208.80, -3115.45, 5.54), head = 55.5 },
		{ pos = vector3(1386.61, -784.64, 67.46), head = 310.0 },
		{ pos = vector3(-1498.50, -893.91, 10.22), head = 322.0 }
	},
	npcModel = "ig_chengsr",
	npcTime = 6*60, -- on minute 2*60 == 2 hours
	npcAnim = {
		dict = "anim@heists@heist_corona@single_team",
		anim = "single_team_loop_boss"
	},
	waitTime = 15, -- in minute
	vehicles = {
		{ label = "Schafter", name = "schafter2", price = 250, percent = 3.33 },
		{ label = "Premier", name = "premier", price = 250, percent = 3.33 },
		{ label = "Gauntlet", name = "gauntlet", price = 250, percent = 3.33 },
		{ label = "Intruder", name = "intruder", price = 250, percent = 3.33 },
		{ label = "F620", name = "f620", price = 250, percent = 3.33 },
		{ label = "Penumbra", name = "penumbra", price = 250, percent = 3.33 },
		{ label = "Regina", name = "regina", price = 250, percent = 3.33 },
		{ label = "Vielle Voodoo", name = "voodoo2", price = 250, percent = 3.33 },
		{ label = "Vielle Tornado", name = "tornado3", price = 250, percent = 3.33 },
		{ label = "Dominator", name = "dominator", price = 250, percent = 3.33 },
		{ label = "Blista Compact", name = "blista2", price = 250, percent = 3.33 },
		
		{ label = "Landstalker", name = "landstalker", price = 250, percent = 3.33 },
		{ label = "BeeJay XL", name = "bjxl", price = 250, percent = 3.33 },
		{ label = "Serrano", name = "serrano", price = 250, percent = 3.33 },
		{ label = "Bobcat XL", name = "bobcatxl", price = 250, percent = 3.33 },
		{ label = "Patriot", name = "patriot", price = 250, percent = 3.33 },
		{ label = "Injection", name = "bfinjection", price = 250, percent = 3.33 },
		{ label = "Vieu Surfer", name = "surfer2", price = 250, percent = 3.33 },
		{ label = "Sandking SWB", name = "sandking2", price = 250, percent = 3.33 },
		{ label = "Mesa", name = "mesa", price = 250, percent = 3.33 },
		
		{ label = "Carbonizzare", name = "carbonizzare", price = 250, percent = 3.33 },
		{ label = "Huntley S", name = "huntley", price = 250, percent = 3.33 },
		{ label = "Sabre Turbo", name = "sabregt", price = 250, percent = 3.33 },
		{ label = "Rapid GT", name = "rapidgt", price = 250, percent = 3.33 },
		{ label = "Massacro", name = "massacro", price = 250, percent = 3.33 },
		{ label = "Infernus", name = "infernus", price = 250, percent = 3.33 },
		{ label = "9F", name = "ninef", price = 250, percent = 3.33 },
		
		{ label = "Nemesis", name = "nemesis", price = 250, percent = 3.33 },
		{ label = "Sanchez", name = "sanchez2", price = 250, percent = 3.33 },
		{ label = "Bati 801", name = "bati", price = 250, percent = 3.33 }
	},


	text = {
		["fr"] = {
			helpHint = "~INPUT_CONTEXT~ Pour interagir avec la personne.",
			getVehicle = "Hé ! Va me chercher\nce véhicule: ~y~%s\n~s~j'en ai besoin de suite !",
			notVehicle = "Hé, mec je n'est pas de véhicule à te proposer, revient plus tard !",
			nearVehicle = "Rapproche le véhicule j'ai du mal à reconnaitre le modèle.",			
			goodVehicle = "Merci c'est bien celui-ci, tient cadeau: %s~g~$",
			errorVehicle = "Ceci n'est pas le véhicule que je tes demandes,\nil me faut ce modèle-ci: ~y~%s",
			airVehicle = "Wow quel ~y~joli véhicule ~s~! De l'air pff...",
		},
		["en"] = {
			helpHint = "~INPUT_CONTEXT~ To interact with the person.",
			getVehicle = "Hey ! Go get me\nthis vehicle: ~y~%s\n~s~i need it now !",
			notVehicle = "Hey, man, I don't have a vehicle for you, come back later !",
			nearVehicle = "Bring the vehicle closer, I have trouble recognizing the model.",			
			goodVehicle = "Thank you it's this one, holds a gift: %s~g~$",
			errorVehicle = "This is not the vehicle I'm asking for,\ni need this model: ~y~%s",
			airVehicle = "Wow what a ~y~nice vehicle ~s~! The Air pff...",
		}
	}
}