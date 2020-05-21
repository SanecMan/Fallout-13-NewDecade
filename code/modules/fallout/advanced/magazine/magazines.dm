/obj/machinery/magazine/weapon
	name = "Weapon shop"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"
	light_color = LIGHT_COLOR_ORANGE
	light_power = 1
	shipment = list(
	/obj/item/weapon/gun/energy/laser/pistol,
	/obj/item/weapon/gun/energy/laser/rifle,
	/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
	/obj/item/weapon/gun/ballistic/automatic/rifle,
	/obj/item/weapon/gun/ballistic/automatic/garand,
	/obj/item/weapon/gun/ballistic/automatic/smg10mm,
	/obj/item/weapon/gun/ballistic/shotgun/rifle/scope,
	/obj/item/weapon/gun/ballistic/shotgun/pipe,
	/obj/item/weapon/gun/ballistic/shotgun/trail

	)


/obj/machinery/magazine/medical
	name = "Misc shop"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "med_idle"
	light_color = LIGHT_COLOR_BLUE
	light_power = 1
	shipment = list (

	/obj/item/weapon/reagent_containers/f13stimpack,
	/obj/item/weapon/reagent_containers/f13stimpack/super,
	/obj/item/weapon/reagent_containers/pill/patch/radaway,
	/obj/item/kit/random,
	/obj/item/crafting/weapon_repair_kit
	)

/obj/machinery/magazine/sierra
	name = "Sierra Madre shop"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"
	light_color = LIGHT_COLOR_ORANGE
	light_power = 1
	shipment = list(
	/obj/item/weapon/stock_parts/cell/high,
	/obj/item/weapon/storage/box/lethalshot,
	/obj/item/weapon/reagent_containers/f13stimpack,
	/obj/item/weapon/reagent_containers/f13stimpack/super,
	/obj/item/weapon/reagent_containers/pill/patch/radaway,
	/obj/item/weapon/reagent_containers/pill/patch/medx,
	/obj/item/weapon/reagent_containers/pill/patch/psycho,
	/obj/item/weapon/reagent_containers/pill/patch/radx,
	/obj/item/weapon/reagent_containers/pill/patch/turbo,
	/obj/item/weapon/storage/pill_bottle/mentats,
	/obj/item/weapon/storage/fancy/cigarettes,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/wine,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/grappa,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/sunset,
	/obj/item/weapon/reagent_containers/food/snacks/f13/cram,
	/obj/item/weapon/reagent_containers/food/snacks/f13/sugarbombs,
	/obj/item/weapon/reagent_containers/food/snacks/f13/steak,
	/obj/item/weapon/reagent_containers/food/snacks/f13/specialapples,
	/obj/item/weapon/reagent_containers/food/snacks/f13/blamco,
	/obj/item/weapon/reagent_containers/food/snacks/f13/instamash,
	/obj/item/weapon/reagent_containers/food/snacks/f13/crisps,
	/obj/item/device/flashlight/seclite,
	/obj/item/kit/random,
	/obj/item/crafting/weapon_repair_kit,
	/obj/item/weapon/grenade/mine/explosive
	)

///trader///
/obj/machinery/magazine/human
	var/product_slogans = ""
	icon = 'icons/fallout/mobs/trader.dmi'
	name = "Торговец"
	icon_state = "trader-1"

/obj/machinery/magazine/human/trader_misc
	name = "Герберт Шнобель"
	icon_state = "trader-1"
	shipment = list(
	/obj/item/weapon/pipe,
	/obj/item/weapon/hammer,
	/obj/item/weapon/pickaxe/rust,
	/obj/item/weapon/machete/imp_machete,
	/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
	/obj/item/weapon/gun/ballistic/automatic/rifle,
	/obj/item/weapon/gun/ballistic/automatic/garand,
	/obj/item/weapon/gun/ballistic/shotgun/rifle,
	/obj/item/weapon/gun/ballistic/automatic/smg10mm,
	/obj/item/weapon/gun/ballistic/shotgun/pipe,
	/obj/item/weapon/gun/ballistic/shotgun/trail,
	/obj/item/weapon/gun/ballistic/automatic/assault_rifle,
	/obj/item/weapon/gun/ballistic/automatic/service_rifle,
	/obj/item/weapon/gun/ballistic/automatic/assault_rifle/chinese,
	/obj/item/weapon/gun/ballistic/automatic/pistol/f4/pipe_pistol,
	/obj/item/ammo_box/magazine/F13/m10smg,
	/obj/item/ammo_box/F13/m44,
	/obj/item/ammo_box/magazine/F13/g308,
	/obj/item/ammo_box/magazine/F13/chinese,
	/obj/item/ammo_box/magazine/F13/m223
	)

/obj/machinery/magazine/human/trader_clothing
	name = "Джозеф Брактович"
	icon_state = "trader-2"
	shipment = list(
	/obj/item/clothing/glasses/f13/old,
	/obj/item/clothing/glasses/f13/biker,
	/obj/item/clothing/glasses/f13/supermutant_glasses,
	/obj/item/clothing/glasses/sunglasses/f13/legion,
	/obj/item/clothing/gloves/f13/military,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/gloves/f13/ncr,
	/obj/item/clothing/head/helmet/f13/broken,
	/obj/item/clothing/head/helmet/f13/motorcycle,
	/obj/item/clothing/head/helmet/f13/firefighter,
	/obj/item/clothing/head/helmet/f13/supaflyhelmet,
	/obj/item/clothing/head/helmet/f13/yankee,
	/obj/item/clothing/head/helmet/f13/marine,
	/obj/item/clothing/head/helmet/f13/combat_mk1,
	/obj/item/clothing/head/helmet/f13/combat_mk2,
	/obj/item/clothing/shoes/f13/explorer,
	/obj/item/clothing/shoes/f13/military,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/suit/armor/f13/punk,
	/obj/item/clothing/suit/armor/f13/chestplate,
	/obj/item/clothing/suit/armor/f13/leatherarmor,
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/suit/armor/f13/bmetalarmor,
	/obj/item/clothing/suit/armor/f13/combat_mk1,
	/obj/item/clothing/suit/armor/f13/combat_mk2,
	/obj/item/clothing/under/f13/bdu,
	/obj/item/clothing/under/f13/dbdu,
	/obj/item/clothing/under/f13/recon
	)

/obj/machinery/magazine/human/trader_merchant // lol what
	name = "Торговец"
	icon_state = "trader-3"
	shipment = list(
	/obj/item/weapon/reagent_containers/food/drinks/bottle/victorycola,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/yellowcola,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/cherrycola,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/fusioncola,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/quantumcola,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/quartzcola,
	/obj/item/weapon/reagent_containers/food/snacks/soup/f13/sawdust,
	/obj/item/weapon/gun/ballistic/automatic/assault_rifle/fnfal,
	/obj/item/weapon/gun/ballistic/automatic/assault_rifle/marksman,
	/obj/item/weapon/gun/ballistic/automatic/assault_rifle/infiltrator,
	/obj/item/weapon/gun/ballistic/shotgun/rifle/scope,
	/obj/item/weapon/twohanded/superhammer,
	/obj/item/ammo_box/magazine/f13/sniper_rounds,
	/obj/item/ammo_box/magazine/F13/m556,
	/obj/item/ammo_box/magazine/F13/fnfal,
	/obj/item/ammo_box/magazine/F13/service,
	/obj/item/key/motorcycle,
	/obj/item/weapon/holodisk/musicbox
	)

/obj/machinery/magazine/human/trader_explosive_and_kits
	name = "Вильям Гриневич"
	icon_state = "trader-4"
	shipment = list(
	/obj/item/kit/random,
	/obj/item/weapon/bottlecap_mine
	)

/obj/machinery/magazine/human/trader_brotherhood //undone
	name = "Паладин Хувс"
	shipment = list(
	/obj/item/kit/random,
	/obj/item/weapon/bottlecap_mine
	)

/obj/machinery/magazine/human/trader_mechanic
	name = "Болт"
	shipment = list(
	/obj/item/weaponcrafting/reciever,
	/obj/item/weaponcrafting/stock,
	/obj/item/weaponcrafting/handle/rifle,
	/obj/item/weaponcrafting/handle/pistol,
	/obj/item/crafting/barrel_l,
	/obj/item/crafting/barrel_s,
	/obj/item/crafting/diode,
	/obj/item/crafting/transistor,
	/obj/item/crafting/capacitor,
	/obj/item/crafting/fuse,
	/obj/item/crafting/resistor,
	/obj/item/crafting/switch,
	/obj/item/crafting/bulb,
	/obj/item/crafting/board,
	/obj/item/crafting/buzzer,
	/obj/item/crafting/frame,
	/obj/item/crafting/small_gear,
	/obj/item/crafting/large_gear,
	/obj/item/crafting/duct_tape,
	/obj/item/crafting/toaster,
	/obj/item/crafting/vacuum_cleaner,
	/obj/item/crafting/sensor_module,
	/obj/item/crafting/wonderglue,
	/obj/item/crafting/turpentine,
	/obj/item/crafting/abraxo,
	/obj/item/crafting/igniter,
	/obj/item/crafting/timer,
	/obj/item/crafting/sensor,
	/obj/item/crafting/lunchbox,
	/obj/item/crafting/weapon_parts/ballistic,
	/obj/item/crafting/weapon_parts/energy,
	/obj/item/crafting/weapon_parts/plasma,
	)


/obj/machinery/magazine/human/random
	name = "Джонатан Милсбрук"
	icon_state = "rand"
	product_slogans = "Эй! Не хочешь прикупить себе новую пушку?; Оружие! Медикаменты! Подходим берём!; Не желаете чего-нибудь приобрести?; У меня как в греции, всё есть!"
	shipment = list()

/obj/machinery/magazine/human/random/New()
	icon_state = "trader-[rand(1,5)]"
	if(icon_state == "trader-1")
		name = "Герберт Шнобель"
		shipment = list(
		/obj/item/weapon/pipe,
		/obj/item/weapon/hammer,
		/obj/item/weapon/pickaxe/rust,
		/obj/item/weapon/machete/imp_machete,
		/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
		/obj/item/weapon/gun/ballistic/automatic/rifle,
		/obj/item/weapon/gun/ballistic/automatic/garand,
		/obj/item/weapon/gun/ballistic/shotgun/rifle,
		/obj/item/weapon/gun/ballistic/automatic/smg10mm,
		/obj/item/weapon/gun/ballistic/shotgun/pipe,
		/obj/item/weapon/gun/ballistic/shotgun/trail,
		/obj/item/weapon/gun/ballistic/automatic/assault_rifle,
		/obj/item/weapon/gun/ballistic/automatic/service_rifle,
		/obj/item/weapon/gun/ballistic/automatic/assault_rifle/chinese,
		/obj/item/weapon/gun/ballistic/automatic/pistol/f4/pipe_pistol,
		/obj/item/ammo_box/magazine/F13/m10smg,
		/obj/item/ammo_box/F13/m44,
		/obj/item/ammo_box/magazine/F13/g308,
		/obj/item/ammo_box/magazine/F13/chinese,
		/obj/item/ammo_box/magazine/F13/m223
		)
	if(icon_state == "trader-2")
		name = "Джозеф Брактович"
		shipment = list(
		/obj/item/clothing/glasses/f13/old,
		/obj/item/clothing/glasses/f13/biker,
		/obj/item/clothing/glasses/f13/supermutant_glasses,
		/obj/item/clothing/glasses/sunglasses/f13/legion,
		/obj/item/clothing/gloves/f13/military,
		/obj/item/clothing/gloves/f13/leather,
		/obj/item/clothing/gloves/f13/ncr,
		/obj/item/clothing/head/helmet/f13/broken,
		/obj/item/clothing/head/helmet/f13/motorcycle,
		/obj/item/clothing/head/helmet/f13/firefighter,
		/obj/item/clothing/head/helmet/f13/supaflyhelmet,
		/obj/item/clothing/head/helmet/f13/yankee,
		/obj/item/clothing/head/helmet/f13/marine,
		/obj/item/clothing/head/helmet/f13/combat_mk1,
		/obj/item/clothing/head/helmet/f13/combat_mk2,
		/obj/item/clothing/shoes/f13/explorer,
		/obj/item/clothing/shoes/f13/military,
		/obj/item/clothing/suit/armor/f13/kit,
		/obj/item/clothing/suit/armor/f13/punk,
		/obj/item/clothing/suit/armor/f13/chestplate,
		/obj/item/clothing/suit/armor/f13/leatherarmor,
		/obj/item/clothing/suit/armor/f13/metalarmor,
		/obj/item/clothing/suit/armor/f13/bmetalarmor,
		/obj/item/clothing/suit/armor/f13/combat_mk1,
		/obj/item/clothing/suit/armor/f13/combat_mk2,
		/obj/item/clothing/under/f13/bdu,
		/obj/item/clothing/under/f13/dbdu,
		/obj/item/clothing/under/f13/recon
		)
	if(icon_state == "trader-3")
		name = "Торговец"
		shipment = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/victorycola,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/yellowcola,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/cherrycola,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/fusioncola,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/quantumcola,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/quartzcola,
		/obj/item/weapon/reagent_containers/food/snacks/soup/f13/sawdust,
		/obj/item/weapon/gun/ballistic/automatic/assault_rifle/fnfal,
		/obj/item/weapon/gun/ballistic/automatic/assault_rifle/marksman,
		/obj/item/weapon/gun/ballistic/automatic/assault_rifle/infiltrator,
		/obj/item/weapon/gun/ballistic/shotgun/rifle/scope,
		/obj/item/weapon/twohanded/superhammer,
		/obj/item/ammo_box/magazine/f13/sniper_rounds,
		/obj/item/ammo_box/magazine/F13/m556,
		/obj/item/ammo_box/magazine/F13/fnfal,
		/obj/item/ammo_box/magazine/F13/service,
		/obj/item/key/motorcycle,
		/obj/item/weapon/holodisk/musicbox
		)
	if(icon_state == "trader-4")
		name = "Вильям Гриневич"
		shipment = list(
		/obj/item/kit/random,
		/obj/item/weapon/bottlecap_mine
		)
	if(icon_state == "trader-5")
		name = "Паладин Хувс"
		shipment = list(
		/obj/item/kit/random,
		/obj/item/weapon/bottlecap_mine
		)
	if(icon_state == "trader-6")
		name = "Болт"
		shipment = list(
		/obj/item/weaponcrafting/reciever,
		/obj/item/weaponcrafting/stock,
		/obj/item/weaponcrafting/handle/rifle,
		/obj/item/weaponcrafting/handle/pistol,
		/obj/item/crafting/barrel_l,
		/obj/item/crafting/barrel_s,
		/obj/item/crafting/diode,
		/obj/item/crafting/transistor,
		/obj/item/crafting/capacitor,
		/obj/item/crafting/fuse,
		/obj/item/crafting/resistor,
		/obj/item/crafting/switch,
		/obj/item/crafting/bulb,
		/obj/item/crafting/board,
		/obj/item/crafting/buzzer,
		/obj/item/crafting/frame,
		/obj/item/crafting/small_gear,
		/obj/item/crafting/large_gear,
		/obj/item/crafting/duct_tape,
		/obj/item/crafting/toaster,
		/obj/item/crafting/vacuum_cleaner,
		/obj/item/crafting/sensor_module,
		/obj/item/crafting/wonderglue,
		/obj/item/crafting/turpentine,
		/obj/item/crafting/abraxo,
		/obj/item/crafting/igniter,
		/obj/item/crafting/timer,
		/obj/item/crafting/sensor,
		/obj/item/crafting/lunchbox,
		/obj/item/crafting/weapon_parts/ballistic,
		/obj/item/crafting/weapon_parts/energy,
		/obj/item/crafting/weapon_parts/plasma,
		)