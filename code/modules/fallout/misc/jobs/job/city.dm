//Fallout 13 City faction roles

/datum/job/mayor
	title = "Mayor"
	desc = "Неоспоримый авторитет.<br>Вас избрали для того, чтобы вы привели их к лучшему завтра."
	flag = MAYOR
	department_flag = WASTELAND
	faction = "city"
	status = "mayor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "никому"
	selection_color = "#804B00"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/mayor
	whitelist_on = 1

	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "f76", "specops")

	required_items = list(
	/obj/item/clothing/shoes/f13/brownie,
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/shoes/f13/cowboy,
	/obj/item/clothing/under/f13/manager,
	/obj/item/clothing/under/suit_jacket,
	/obj/item/clothing/under/suit_jacket/really_black,
	/obj/item/clothing/under/f13/bennys,
	/obj/item/clothing/under/f13/gentlesuit,
	/obj/item/clothing/under/f13/cowboyg,
	/obj/item/clothing/under/f13/cowboyb,
	/obj/item/clothing/under/f13/cowboyt,
	/obj/item/clothing/under/suit_jacket/female,
	/obj/item/clothing/under/female/plaid_skirt/blue,
	/obj/item/clothing/under/female/plaid_skirt/purple,
	/obj/item/clothing/under/female/plaid_skirt/green,
	/obj/item/clothing/under/female/plaid_skirt,
	/obj/item/clothing/suit/f13/cowboygvest,
	/obj/item/clothing/suit/f13/cowboybvest,
	/obj/item/clothing/head/f13/purple,
	/obj/item/clothing/glasses/monocle,
	/obj/item/weapon/lighter/gold
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

/datum/outfit/job/mayor
	name = "Mayor"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = null
	head = /obj/item/clothing/head/f13/beaver
	id = /obj/item/weapon/card/id/passport_city

//Sheriff

/datum/job/sheriff
	title = "Sheriff"
	desc = "Бесстрашный хранитель закона.<br>Вас избрали чтобы Вы защищали это место."
	flag = SHERIFF
	department_flag = WASTELAND
	faction = "city"
	status = "sheriff"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Мэру"
	selection_color = "#804B00"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/sheriff
	whitelist_on = 0
	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "f76", "specops")

	required_items = list(
	/obj/item/clothing/under/f13/cowboyg,
	/obj/item/clothing/under/f13/cowboyt,
	/obj/item/clothing/suit/f13/cowboygvest,
	/obj/item/clothing/suit/f13/cowboybvest,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/ammo_box/magazine/internal/cylinder/m44
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

/datum/outfit/job/sheriff
	name = "Sheriff"
	id = /obj/item/weapon/card/id/passport_city
	uniform = /obj/item/clothing/under/f13/cowboyb
	shoes = /obj/item/clothing/shoes/f13/cowboy
	suit = /obj/item/clothing/suit/f13/sheriff
	head = /obj/item/clothing/head/f13/cowboy
	weapon = /obj/item/weapon/gun/ballistic/revolver/magnum
	glasses = /obj/item/clothing/glasses/sunglasses
	back = /obj/item/weapon/gun/ballistic/shotgun/trail

//Citizen

/datum/job/citizen
	title = "Citizen"
	flag = CITIZEN
	department_flag = ENGSEC
	desc = "Житель города.<br>Ваша жизнь намного лучше, чем у любого другого бедолаги на пустошах."
	faction = "city"
	status = "member"
	total_positions = 6
	spawn_positions = 6
	supervisors = "мэру и шерифу"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/citizen

	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "f76", "specops")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/shoes/f13/cowboy,
	/obj/item/clothing/under/f13/cowboyg,
	/obj/item/clothing/under/f13/cowboyb,
	/obj/item/clothing/suit/f13/cowboygvest,
	/obj/item/clothing/suit/f13/cowboybvest,
	/obj/item/clothing/under/f13/female/flapper
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal
	)

/datum/outfit/job/citizen
	name = "Citizen"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/cowboyt
	shoes = /obj/item/clothing/shoes/f13/brownie
	id = /obj/item/weapon/card/id/passport_city

/datum/job/trader
	title = "Trader"
	flag = TRADER
	department_flag = ENGSEC
	desc = "Торговец.<br>Вы живёте в достатке, пока у вас есть товар."
	faction = "city"
	status = "trader"
	total_positions = 1
	spawn_positions = 1
	supervisors = "никому"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/trader
	whitelist_on = 1
	allowed_packs = list("starter", "cigarettes", "follower", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom", "f76", "specops")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/shoes/f13/cowboy,
	/obj/item/clothing/under/f13/merchant,
	/obj/item/clothing/under/f13/cowboyb,
	/obj/item/clothing/suit/f13/cowboygvest,
	/obj/item/clothing/suit/f13/cowboybvest,
	/obj/item/clothing/under/f13/female/flapper
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal
	)

/datum/outfit/job/trader
	name = "trader"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/merchant
	shoes = /obj/item/clothing/shoes/f13/brownie
	id = /obj/item/weapon/card/id/passport_trader