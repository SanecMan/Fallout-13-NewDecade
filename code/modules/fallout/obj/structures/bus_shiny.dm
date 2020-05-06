/obj/structure/decoration_f13/bus
	icon = 'icons/fallout/vehicles/bus.dmi'
	icon_state = "bus2"
	anchored = 1
	layer = ABOVE_MOB_LAYER
	density = 1
	pixel_x = -110
	obj_integrity = 200
	max_integrity = 200
	integrity_failure = 50

/obj/structure/decoration_f13/bus/orange
	name = "\proper ancient City Liner bus"
	desc = "A derelict bus that belonged to a City Liner network.<br>Despite all the decades it has spent out in the open, the exterior looks more or less intact."
	icon_state = "bus3"

/obj/structure/decoration_f13/bus/New()
	..()
	var/atom/movable/S = new (locate(x-3,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x-2,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x-1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+2,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()

/obj/structure/decoration_f13/bus/blue
	name = "\proper ancient City Liner bus"
	desc = "A derelict bus that belonged to a City Liner network.<br>Despite all the decades it has spent out in the open, the exterior looks more or less intact."
	icon_state = "bus2"

/obj/structure/decoration_f13/vertical
	name = "\proper ancient City Liner bus"
	desc = "A derelict bus that belonged to a City Liner network.<br>Despite all the decades it has spent out in the open, the exterior looks more or less intact."
	icon_state = "blue"
	icon = 'icons/fallout/vehicles/bus2.dmi'
	pixel_x = 0

/obj/structure/decoration_f13/vertical/New()
	..()
	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+1,y+1,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+1,y+2,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+1,y+3,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+1,y+4,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x,y+5,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x,y+1,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x,y+2,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x,y+3,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x,y+4,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x,y+5,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()


/obj/structure/decoration_f13/vertical/orange
	name = "\proper ancient City Liner bus"
	desc = "A derelict bus that belonged to a City Liner network.<br>Despite all the decades it has spent out in the open, the exterior looks more or less intact."
	icon_state = "orange"
	icon = 'icons/fallout/vehicles/bus2.dmi'
	pixel_x = 0
