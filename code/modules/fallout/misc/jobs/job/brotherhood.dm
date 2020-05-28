//Fallout 13 Brotherhood of Steel faction roles

/datum/job/elder
	title = "Elder of Brotherhood"
	desc = "A mentor, the source of wisdom.<br>You are the one who shall fulfill destiny."
	flag = ELDER
	department_head = list("Brotherhood of Steel command HQ")
	department_flag = ENGSEC
	faction = "bs"
	status = "elder"
	total_positions = 1
	spawn_positions = 1
	supervisors = "центральному штабу Братства Стали"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	whitelist_on = 1

	allowed_packs = list("starter", "cigarettes", "follower", "bard", "super_ten", "f76", "specops")

	required_items = list(
	/obj/item/clothing/gloves/f13/military,
	/obj/item/clothing/under/f13/recon,
//	/obj/item/clothing/suit/armor/f13/power_armor/t51b,
//	/obj/item/clothing/head/helmet/power_armor/t51b,
	/obj/item/clothing/head/soft/f13/utility/navy,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/gun/energy/laser/rifle/tri,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/mask/bandana/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/elder

	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom, access_tech_storage, access_genetics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom)

/datum/outfit/job/elder
	name = "Elder"
	backpack = null
	satchel = null
	ears = /obj/item/device/radio/headset/bs
	id = /obj/item/weapon/card/id/gold
	uniform = /obj/item/clothing/under/f13/combat
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/f13/elder
	weapon = /obj/item/weapon/gun/energy/laser/pistol
	belt = /obj/item/weapon/storage/belt/military/army

//Brotherhood Paladin

/datum/job/paladin
	title = "Paladin of Brotherhood"
	desc = "A guardian, the bringer of light.<br>You are the one who shall protect others."
	flag = PALADIN
	department_head = list("elder")
	department_flag = ENGSEC
	faction = "bs"
	status = "paladin"
	total_positions = 1
	spawn_positions = 2
	supervisors = "Старейшине"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	whitelist_on = 1
	allowed_packs = list("starter", "cigarettes", "follower", "bard", "super_ten", "f76", "specops")

	outfit = /datum/outfit/job/paladin

	required_items = list(
	/obj/item/clothing/under/f13/recon,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/gun/energy/laser/pistol,
	/obj/item/weapon/gun/energy/laser/rifle/aer13,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/mask/bandana/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom, access_tech_storage, access_genetics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom)

/datum/outfit/job/paladin
	name = "Paladin"
	backpack = null
	satchel = null
	id = /obj/item/weapon/card/id/dogtag
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/combat
	shoes = /obj/item/clothing/shoes/f13/military
	ears = /obj/item/device/radio/headset/bs
//	suit = /obj/item/clothing/suit/armor/f13/power_armor/t51b
//	head = /obj/item/clothing/head/helmet/power_armor/t51b
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/energy/laser/rifle/aer13
	belt_contents = list(/obj/item/weapon/reagent_containers/f13stimpack = 2,/obj/item/weapon/kitchen/knife/combat = 1)

//Brotherhood Knight

/datum/job/knight
	title = "Knight of Brotherhood"
	desc = "A warrior, the keeper of peace.<br>You are the one who shall bring justice."
	flag = KNIGHT
	department_head = list("elder", "paladin")
	department_flag = ENGSEC
	faction = "bs"
	status = "knight"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Старейшине и Паладинам"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	whitelist_on = 1
	allowed_packs = list("starter", "cigarettes", "follower", "bard", "super_ten", "f76", "specops")

	required_items = list(
	/obj/item/clothing/under/f13/recon,
	/obj/item/weapon/gun/energy/laser/pistol,
	/obj/item/weapon/twohanded/largehammer
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/mask/bandana/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)


	outfit = /datum/outfit/job/knight

	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom, access_tech_storage, access_genetics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom)


/datum/outfit/job/knight
	name = "Knight"
	backpack = null
	satchel = null
	id = /obj/item/weapon/card/id/dogtag
	ears = /obj/item/device/radio/headset/bs
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/combat
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/armor/f13/brotherhood_armor
	head = /obj/item/clothing/head/helmet/f13/brotherhood_helmet
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/energy/laser/rifle
	belt_contents = list(/obj/item/weapon/reagent_containers/f13stimpack = 1, /obj/item/weapon/kitchen/knife/combat = 1)

/datum/job/scriber
	title = "Scriber of Brotherhood"
	desc = "Brotherhood's memory holder."
	flag = SCRIBER
	department_head = list("elder", "paladin")
	department_flag = ENGSEC
	faction = "bs"
	status = "scriber"
	total_positions = 2
	spawn_positions = 7
	supervisors = "Старейшине"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	whitelist_on = 1
	allowed_packs = list("starter", "cigarettes", "follower", "bard", "super_ten", "f76", "specops")

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/mask/bandana/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)


	outfit = /datum/outfit/job/scriber

	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom, access_tech_storage, access_genetics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom)

/datum/outfit/job/scriber
	name = "Scriber"
	backpack = null
	ears = /obj/item/device/radio/headset/bs
	satchel = null
	id = /obj/item/weapon/card/id/dogtag
	uniform = /obj/item/clothing/under/f13/combat
	shoes = /obj/item/clothing/shoes/f13/tan
	suit = /obj/item/clothing/suit/f13/scribe
	belt = /obj/item/weapon/storage/belt/military/army

///radist///

/datum/job/radist_bs
	title = "Radist of Brotherhood"
	desc = "A warrior, the keeper of peace.<br>You are the one who shall bring justice."
	flag = KNIGHTRADIST
	department_head = list("elder", "paladin")
	department_flag = ENGSEC
	faction = "bs"
	status = "paladin_r"
	total_positions = 2
	spawn_positions = 1
	supervisors = "Старейшине и Паладинам"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	whitelist_on = 1
	allowed_packs = list("starter", "cigarettes", "follower", "bard", "super_ten", "f76", "specops")

	required_items = list(
	/obj/item/clothing/under/f13/recon,
	/obj/item/weapon/gun/energy/laser/pistol,
	/obj/item/device/radio/prc/bs
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/mask/bandana/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)


	outfit = /datum/outfit/job/radist_bs

	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom, access_tech_storage, access_genetics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom)


/datum/outfit/job/radist_bs
	name = "BS Radist"
	back = /obj/item/device/radio/prc/bs
	ears = /obj/item/device/radio/headset/bs
	id = /obj/item/weapon/card/id/dogtag
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/radist_bs
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/armor/f13/brotherhood_armor
	head = /obj/item/clothing/head/helmet/f13/brotherhood_helmet
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/energy/laser/rifle

	belt_contents = list(/obj/item/weapon/reagent_containers/f13stimpack = 1,/obj/item/weapon/kitchen/knife/combat = 1)