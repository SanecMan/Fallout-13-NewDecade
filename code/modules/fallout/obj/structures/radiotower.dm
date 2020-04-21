/obj/structure/radiotower
	name = "радио вышка"
	desc = "Высокая радио вышка, покрытая слоями ржавчины и оборванными проводами..."
	icon = 'icons/fallout/misc/radiotower.dmi'
	icon_state = "radiotower"
	density = 1
	anchored = 1
	layer = 5
	resistance_flags = INDESTRUCTIBLE

/obj/structure/radiotower/New()
	..()

	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()