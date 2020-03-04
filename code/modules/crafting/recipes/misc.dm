/datum/crafting_recipe/radio
	name = "PRC Radio"
	result = /obj/item/device/radio/prc
	time = 800
	reqs = list(/obj/item/crafting/diode = 2,
				/obj/item/crafting/transistor = 1,
				/obj/item/crafting/capacitor = 2,
				/obj/item/crafting/resistor = 3,
				/obj/item/crafting/bulb = 1,
				/obj/item/crafting/board = 1,
				/obj/item/crafting/frame = 1)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	category = CAT_MISC
	default = 1
	XP = 50

/datum/crafting_recipe/barrel
	name = "long weapon barrel"
	result = /obj/item/crafting/barrel_l
	time = 800
	reqs = list(/obj/item/stack/sheet/metal = 4)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters, /obj/item/crafting/instruments)
	category = CAT_MISC
	default = 1
	XP = 60

/datum/crafting_recipe/barrel_s
	name = "long weapon barrel"
	result = /obj/item/crafting/barrel_s
	time = 400
	reqs = list(/obj/item/stack/sheet/metal = 2)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters, /obj/item/crafting/instruments)
	category = CAT_MISC
	default = 1
	XP = 30

/datum/crafting_recipe/weaponparts/handle_p
	name = "Pistol Handle"
	reqs = list(/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 300
	category = CAT_MISC
	default = 1
	XP = 2
	result = /obj/item/weaponcrafting/handle/pistol

/datum/crafting_recipe/weaponparts/handle_r
	name = "Rifle Handle"
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 300
	category = CAT_MISC
	default = 1
	XP = 4
	result = /obj/item/weaponcrafting/handle/rifle

//WEAPON PARTS


/datum/crafting_recipe/weaponparts/ballistic
	name = "Ballistic Weapon Parts"
	reqs = list(/obj/item/weapon/gun/ballistic/automatic = 1)
	time = 400
	category = CAT_MISC
	default = 1
	XP = 10
	result = /obj/item/crafting/weapon_parts/ballistic

/datum/crafting_recipe/weaponparts/energy
	name = "Energy Weapon Parts"
	reqs = list(/obj/item/weapon/gun/energy/laser = 1)
	time = 800
	category = CAT_MISC
	default = 1
	XP = 15
	result = /obj/item/crafting/weapon_parts/energy

/datum/crafting_recipe/weaponparts/plasma
	name = "Plasma Weapon Parts"
	reqs = list(/obj/item/weapon/gun/energy/plasma = 1)
	time = 900
	category = CAT_MISC
	default = 1
	XP = 20
	result = /obj/item/crafting/weapon_parts/plasma

/datum/crafting_recipe/rope
	name = "Rope"
	reqs = list(/obj/item/stack/sheet/cloth = 4)
	time = 100
	category = CAT_MISC
	default = 1
	XP = 5
	result = /obj/item/weapon/restraints/handcuffs/cable/rope