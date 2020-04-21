/obj/item/weapon/storage/f76bag
	name = "Сумка Вест-Тек"
	desc = "Какой-то набор вещей от компании Вест-Тек."
	icon = 'icons/fallout/objects/storage.dmi'
	icon_state = "f76bag"
	throw_speed = 3
	throw_range = 7
	var/empty = 0

/obj/item/weapon/storage/f76bag/bag
	icon_state = "f76bag"
	desc = "A first aid kit with the ability to heal common types of injuries."

/obj/item/weapon/storage/f76bag/bag/New()
	..()
	if(empty) return
	icon_state = "f76bag"
	new /obj/item/clothing/head/helmet/power_armor/t51b(src)
	new /obj/item/weapon/holodisk/takemehome(src)
	new /obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum/large(src)
	new /obj/item/weapon/reagent_containers/food/drinks/bottle/oldnukacola(src)
	new /obj/item/weapon/reagent_containers/food/drinks/bottle/oldnukacola(src)
	new /obj/item/toy/nuke(src)
	new /obj/item/toy/talking/charisma(src)
	return