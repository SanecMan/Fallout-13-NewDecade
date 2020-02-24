/obj/machinery/magazine/weapon
	name = "Weapon shop"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"
	light_color = LIGHT_COLOR_ORANGE
	light_power = 1
	shipment = list (

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
	shipment = list (
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

/obj/machinery/magazine/human/trader
	name = "Джонатан Милсбрук"
	icon = 'icons/mob/animal.dmi'
	icon_state = "trader"
	product_slogans = "Эй! Не хочешь прикупить себе новую пушку?; Оружие! Медикаменты! Подходим берём!; Не желаете чего-нибудь приобрести?; У меня как в греции, всё есть!"
	var/product_slogans = ""
	shipment = list (
	/obj/item/weapon/gun/energy/laser/pistol,
	/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
	/obj/item/weapon/gun/ballistic/shotgun/pipe,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/sunset,
	/obj/item/weapon/reagent_containers/pill/patch/medx,
	/obj/item/weapon/reagent_containers/food/snacks/f13/crisps,
	/obj/item/crafting/weapon_repair_kit,
	/obj/item/weapon/gun/ballistic/shotgun/trail
	)