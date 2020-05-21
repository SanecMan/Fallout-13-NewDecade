//Fallout 13 general indestructible floor directory

/turf
	var/baseturf_icon
	var/baseturf_dir = 0

/turf/open/indestructible/ground
	icon = 'icons/fallout/turfs/ground.dmi'
	name = "\proper пол"
	icon_state = "wasteland1"
	intact = 1

/turf/open/indestructible/ground/New()
	..()

	baseturf = src.type
	baseturf_icon = icon_state
	baseturf_dir = dir

/turf/open/indestructible/ground/attack_paw(mob/user)
	return src.attack_hand(user)

/turf/open/indestructible/ground/attackby(obj/item/C, mob/user, params)
	if(istype(C,/obj/item/stack/tile/plasteel))
		var/obj/item/stack/tile/plasteel/S = C
		if(S.use(1))
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You build a floor.</span>")
			ChangeTurf(/turf/open/floor/plating)
		else
			to_chat(user, "<span class='warning'>You need one floor tile to build a floor!</span>")

///turf/ground/Entered(atom/movable/A)
//	..()

/turf/open/indestructible/ground/handle_slip()
	return

/turf/open/indestructible/ground/singularity_act()
	return

/turf/open/indestructible/ground/can_have_cabling()
	return 1

var/global/list/desertTurfEdgeCache

/turf/open/indestructible/ground/desert
	name = "песок"
	icon_state = "wasteland"
	step_sounds = list("human" = "dirtfootsteps")
	allowed_plants = list(/obj/item/seeds/broc, /obj/item/seeds/xander, /obj/item/seeds/agave, /obj/item/seeds/mutfruit, \
	/obj/item/seeds/ferocactus, /obj/item/seeds/corn,/obj/item/seeds/shroom)
	slowdown = 0.1
	flags = CAN_HAVE_NATURE | ADJACENCIES_OVERLAY

/turf/open/indestructible/ground/desert/New()
	icon_state = "wasteland[rand(1,31)]"
	..()
/turf/open/indestructible/ground/dirt
	name = "земля"
	icon_state = "dirtfull"
	step_sounds = list("human" = "dirtfootsteps")
	allowed_plants = list(/obj/item/seeds/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit, \
	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn)
	slowdown = 0.2
	flags = CAN_HAVE_NATURE

/turf/open/indestructible/ground/road
	name = "дорога"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphalt.dmi'
	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/sidewalk
	name = "тротуар"
	icon_state = "outermiddle"
	icon = 'icons/fallout/turfs/sidewalk.dmi'
	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/mountain
	name = "камень"
	icon_state = "rockfloor1"
	icon = 'icons/fallout/turfs/mining.dmi'
	allowed_plants = list(/obj/item/seeds/glow)
	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/mountain/New()
	..()
	icon_state = "rockfloor[rand(1,2)]"

/turf/open/indestructible/ground/subway
	name = "туннель метро"
	icon_state = "railsnone"
	icon = 'icons/fallout/turfs/ground.dmi'

/turf/open/indestructible/ground/subway/rail
	name = "rail"
	icon_state = "blankrailsmiddle"

/turf/open/indestructible/ground/subway/rail/corner
	name = "rail"
	icon_state = "railcorner"

/turf/open/indestructible/ground/subway/rail/corner2
	name = "rail"
	icon_state = "railcorner2"

/turf/open/indestructible/ground/subway/rail/corner3
	name = "rail"
	icon_state = "railcorner3"

/turf/open/indestructible/ground/subway/rail/corner4
	name = "rail"
	icon_state = "railcorner4"

/turf/open/indestructible/ground/subway/rail/end
	name = "rail"
	icon_state = "blankrailsright"

/turf/open/indestructible/ground/subway/rail/end2
	name = "rail"
	icon_state = "blankrailsleft"

/turf/open/ruins
	name = "руины"
	desc = "It's just a pile of concrete rubble."
	icon_state = "rubblefull"
	icon = 'icons/fallout/turfs/ground.dmi'
	step_sounds = list("human" = "erikafootsteps")

/turf/open/ruins/ex_act(severity, target)
	contents_explosion(severity, target)
	switch(severity)
		if(3)
			if(prob(5))
				ChangeTurf(baseturf)
		if(2)
			if(prob(50))
				ChangeTurf(baseturf)
		if(1)
			ChangeTurf(baseturf)

/turf/open/temple
	name = "храм"
	desc = "It's temple floor."
	icon_state = "temple"
	icon = 'icons/fallout/turfs/ground.dmi'
	step_sounds = list("human" = "erikafootsteps")