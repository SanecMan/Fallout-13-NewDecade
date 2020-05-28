///Gun runners///

/datum/job/gunrunner
	title = "Gun Runner"
	desc = "Make weapons. Sell weapons. Trading save the Wasteland!"
	flag = GUNRUNNER
	department_flag = MEDSCI
	faction = "none"
	status = "none"
	total_positions = 5
	spawn_positions = 5
	supervisors = "никому"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/gunrunner
	whitelist_on = 0
	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "specops", "f76")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/under/f13/merchant,
	/obj/item/clothing/under/f13/caravaneer,
	/obj/item/clothing/under/f13/trader,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/suit/armor/f13/leatherarmor,
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/head/helmet/f13/marine,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
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

/datum/outfit/job/gunrunner
	name = "Gun Runner"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/merchant
	shoes = /obj/item/clothing/shoes/f13/military
	suit = null
	head = null
	belt = null
	weapon = null
	glasses = /obj/item/clothing/glasses/f13/biker
	id = /obj/item/weapon/card/id/passport_trader