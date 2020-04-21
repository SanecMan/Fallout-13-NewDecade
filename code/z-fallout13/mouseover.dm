/client/MouseEntered(object, location)
	..()
	if(!maptext_toggle)
		return
	if(istype(object, /atom) && !istype(object, /obj/lobby))
		var/atom/A = object
		if(mob.hud_used)
			var/obj_name = A.name
			if(mob.hud_used.maptext.last_word == obj_name)
				return
			mob.hud_used.maptext.maptext = "<span style='font-family: Arial; font-size: 12px; text-align: center;text-shadow: 1px 1px 2px black;'>[obj_name]</span>"

/obj/screen/maptext
    screen_loc = "NORTH:14,WEST"
    plane = 20
    layer = 20
    maptext_height = 32
    maptext_width = 480