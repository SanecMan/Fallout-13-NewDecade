/obj/item/blueprint
	name = "чертёж"
	desc = "just blueprint"
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "blueprint_empty"
	var/recipe

/obj/item/blueprint/New()
	icon_state = "blueprint[rand(1,4)]"

/obj/item/bench
	name = "Crafting Bench"
	desc = "just bench"
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "bench_1"
	density = 1
	anchored = 1
	var/recipe