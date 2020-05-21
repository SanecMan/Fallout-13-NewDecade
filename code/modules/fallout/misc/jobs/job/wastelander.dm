//Fallout 13 Neutral faction aka Wastelanders roles

/datum/job/settler
	title = "Settler"
	flag = SETTLER
	department_flag = WASTELAND
	desc = "A true child of the wasteland.<br>In badlands you are born, in badlands lays your grave."
	faction = "none"
	status = "none"
	total_positions = -1
	spawn_positions = -1
	supervisors = "никому"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/settler

	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "specops", "f76")

/datum/outfit/job/settler
	name = "Settler"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/rag

//Adventurer

/datum/job/adventurer
	title = "Adventurer"
	desc = "An offspring of wasteland wanderers.<br>Your life is a journey, and you are free to choose what kind of a journey it will be."
	flag = ADVENTURER
	department_flag = WASTELAND
	faction = "none" //desert faction shall disable appearing as scavenger after readying
	status = "none"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "зову приключений"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/adventurer

	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "specops", "f76")

	required_items = list(
	/obj/item/clothing/shoes/f13/brownie,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/under/f13/female/mercadv,
	/obj/item/clothing/under/f13/merccharm,
	/obj/item/clothing/under/f13/female/merccharm,
	/obj/item/clothing/under/f13/doctor,
	/obj/item/clothing/under/f13/female/doctor,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/clothing/glasses/eyepatch
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/suit/f13/mantle_liz
	)

/datum/outfit/job/adventurer
	name = "Adventurer"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/mercadv
	shoes = /obj/item/clothing/shoes/f13/tan
//	head = /obj/item/clothing/head/hardhat/f13/headlamp

//Mercenary

/datum/job/mercenary
	title = "Mercenary"
	desc = "A spawn of guns and bullets.<br>You know that peace is not always applicable.<br>Why waste time on diplomacy when you can shoot things and earn yourself a fortune?"
	flag = MERCENARY
	department_flag = MEDSCI
	faction = "none"
	status = "none"
	total_positions = 4
	spawn_positions = 4
	supervisors = "кодексу чести наёмника"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/mercenary
	whitelist_on = 0
	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "specops", "f76")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/gloves/f13/military,
	/obj/item/clothing/under/f13/mercadv,
	/obj/item/clothing/under/f13/female/mercadv,
	/obj/item/clothing/under/f13/female/merccharm,
	/obj/item/clothing/under/f13/doctor,
	/obj/item/clothing/under/f13/female/doctor,
	/obj/item/clothing/under/f13/bodyguard,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/suit/armor/f13/leatherarmor,
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/suit/armor/f13/bmetalarmor,
	/obj/item/clothing/head/soft/f13/utility/navy,
	/obj/item/clothing/head/helmet/f13/tribal,
	/obj/item/clothing/head/helmet/f13/eyebot,
	/obj/item/clothing/head/helmet/f13/marine,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/detonator
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/suit/f13/mantle_liz
	)

/datum/outfit/job/mercenary
	name = "Mercenary"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/merccharm
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/f13/veteran
	head = null
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/ballistic/automatic/pistol/f4/pipe_pistol
	belt_contents = list(/obj/item/stack/medical/healingpowder = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival = 1,
		/obj/item/ammo_box/magazine/internal/cylinder/piperev = 2,
		/obj/item/device/flashlight/torch/flare/green = 1)

///Tribeman///
/*
/datum/job/arroyov
	title = "Arroyo villager"
	desc = "They are descendants of Vault 13 dwellers. They are simple villagers who do their daily jobs in Arroyo."
	flag = ARROYV
	department_flag = WASTELAND
	faction = "none" //desert faction shall disable appearing as scavenger after readying
	status = "none"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "Arroyo elder"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/arroyov

	required_items = list(
	/obj/item/clothing/suit/armor/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/tribaldoctor,
	/obj/item/clothing/under/f13/tribalshaman,
	/obj/item/clothing/under/f13/tribalwarrior,
	/obj/item/weapon/nullrod/tribal_knife,
	/obj/item/weapon/twohanded/tribal_spear,
	/obj/item/stack/medical/healingpowder
	)


/datum/outfit/job/arroyov
	name = "Arroyo villager"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/tribal
	shoes = /obj/item/clothing/shoes/f13/rag

/datum/job/arroyoe
	title = "Arroyo elder"
	desc = "The Elder is just that - old, older than you can remember. Still, she has the strength and fire to lead the village through these hard times."
	flag = ARROYE
	department_flag = WASTELAND
	faction = "none" //desert faction shall disable appearing as scavenger after readying
	status = "none"
	total_positions = 1
	spawn_positions = -1 //does not matter for late join
	supervisors = "none"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/arroyoe

	required_items = list(
	/obj/item/clothing/suit/armor/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/tribaldoctor,
	/obj/item/clothing/under/f13/tribalshaman,
	/obj/item/clothing/under/f13/tribalwarrior,
	/obj/item/weapon/nullrod/tribal_knife,
	/obj/item/weapon/twohanded/tribal_spear,
	/obj/item/stack/medical/healingpowder
	)


/datum/outfit/job/arroyoe
	name = "Arroyo elder"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/tribalshaman
	shoes = /obj/item/clothing/shoes/f13/rag
*/

/*
//Sierra Madre
/datum/job/sierramadre
	title = "Sierra Madre Explorer"
	desc = "Rob a casino or die trying"
	flag = GUNRUNNER
	department_flag = MEDSCI
	faction = "none"
	status = "none"
	total_positions = 50
	spawn_positions = 50
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/sierramadre

	allowed_packs = list("cigarettes")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/clothing/glasses/sunglasses
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/suit/f13/mantle_liz
	)

/datum/outfit/job/sierramadre
	name = "Sierra Madre Explorer"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/deadmoney
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit = null
	head = null
	belt = null
	weapon = null
	neck = /obj/item/device/slave_collar
	glasses = null
*/