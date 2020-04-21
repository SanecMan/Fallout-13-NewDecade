/obj/machinery/door/poddoor/gate
	name = "city gate"
	desc = "Большие механические ворота."
	icon = 'icons/fallout/objects/structures/city_gate.dmi'
	icon_state = "closed"
	id = 333
	bound_width = 96
	var/list/opacity_objects = list() //FUCK BYOND

/obj/machinery/door/poddoor/gate/New()
	..()
	var/atom/movable/S = new (locate(x+1,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S
	S = new (locate(x+2,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S

/obj/machinery/door/poddoor/gate/Destroy()
	for(var/atom/movable/S in opacity_objects)
		qdel(S)
	..()

/obj/machinery/door/poddoor/gate/open()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(0)
	..()

/obj/machinery/door/poddoor/gate/close()
	..()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(1)

/obj/machinery/door/poddoor/gate/heavy
	name = "heavy gate"
	desc = "Большие ворота, которые выдержат почти что угодно."
	icon = 'icons/fallout/objects/structures/brotherhood_gate.dmi'
	icon_state = "closed"
	id = "heavydoor"
	bound_width = 64

/obj/machinery/door/poddoor/gate/heavy/New()
	..()
	var/atom/movable/S = new (locate(x+1,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S
	S = new (locate(x+2,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S

/obj/machinery/door/poddoor/gate/heavy/Destroy()
	for(var/atom/movable/S in opacity_objects)
		qdel(S)
	..()

/obj/machinery/door/poddoor/gate/heavy/open()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(0)
	..()

/obj/machinery/door/poddoor/gate/heavy/close()
	..()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(1)

/obj/machinery/door/poddoor/gate/heavy/vertical
	name = "heavy gate"
	desc = "Большие ворота, которые выдержат почти что угодно."
	icon = 'icons/fallout/objects/structures/heavygatevertical.dmi'
	icon_state = "closed"
	id = "heavydoor"
	bound_width = 64

/obj/machinery/door/poddoor/gate/heavy/vertical/New()
	..()
	var/atom/movable/S = new (locate(x+1,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S
	S = new (locate(x+2,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S

/obj/machinery/door/poddoor/gate/heavy/vertical/Destroy()
	for(var/atom/movable/S in opacity_objects)
		qdel(S)
	..()

/obj/machinery/door/poddoor/gate/heavy/vertical/open()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(0)
	..()

/obj/machinery/door/poddoor/gate/heavy/vertical/close()
	..()
	for(var/atom/movable/S in opacity_objects)
		S.set_opacity(1)