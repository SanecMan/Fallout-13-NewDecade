//Fallout 13 decorative derelict vehicles directory

/obj/structure/cargocrate
	name = "контейнер"
	desc = "Ржавый контейнер."
	icon = 'icons/fallout/cargocrate.dmi'
	icon_state = "cargocrate1"
	anchored = 1
	density = 1
	layer = ABOVE_MOB_LAYER
	resistance_flags = INDESTRUCTIBLE

/obj/structure/cargocrate/Initialize()
	..()
//	icon_state = "cargocrate[rand(1, 6)]"

	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()