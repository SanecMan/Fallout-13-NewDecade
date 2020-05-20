#define SINGLE "single"
#define VERTICAL "vertical"
#define HORIZONTAL "horizontal"

#define METAL 1
#define WOOD 2
#define SAND 3

//Barricades/cover

/obj/structure/barricade
	name = "chest high wall"
	desc = "Looks like this would make good cover."
	anchored = 1
	density = 1
	obj_integrity = 100
	max_integrity = 100
	var/proj_pass_rate = 50 //How many projectiles will pass the cover. Lower means stronger cover
	var/material = METAL
	var/dirlike = FALSE
	var/canpass = FALSE

/obj/structure/barricade/Initialize()
	..()
	if(dir == 2)
		layer = ABOVE_MOB_LAYER

/obj/structure/barricade/deconstruct(disassembled = TRUE)
	if(!(flags & NODECONSTRUCT))
		make_debris()
	qdel(src)

/obj/structure/barricade/proc/make_debris()
	return

/obj/structure/barricade/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/weldingtool) && user.a_intent != INTENT_HARM && material == METAL)
		var/obj/item/weapon/weldingtool/WT = I
		if(obj_integrity < max_integrity)
			if(WT.remove_fuel(0,user))
				to_chat(user, "<span class='notice'>You begin repairing [src]...</span>")
				playsound(loc, WT.usesound, 40, 1)
				if(do_after(user, 40*I.toolspeed, target = src))
					obj_integrity = Clamp(obj_integrity + 20, 0, max_integrity)

//crc
	var/obj/item/stack/sheet/S = I
	if(istype(S,/obj/item/stack/sheet/metal))
		if(S.get_amount() < 2)
			to_chat(user, "<span class='warning'>You need two sheets of metal to finish a wall!</span>")
			return
		to_chat(user, "<span class='notice'>Вы начали добавлять обшивку...</span>")
		if (do_after(user, 40, target = src))
			if(loc == null || S.get_amount() < 2)
				return
			S.use(2)
			to_chat(user, "<span class='notice'>Вы добавили обшивки.</span>")
			var/turf/T = get_turf(src)
			T.ChangeTurf(/turf/closed/wall/f13/store)
			transfer_fingerprints_to(T)
			qdel(src)
		return
	if(istype(S,/obj/item/stack/sheet/mineral/wood))
		if(S.get_amount() < 2)
			to_chat(user, "<span class='warning'>Вам необходимо еще две доски, чтобы завершить стенку!</span>")
			return
		to_chat(user, "<span class='notice'>Вы начали добавлять обшивку...</span>")
		if (do_after(user, 40, target = src))
			if(loc == null || S.get_amount() < 2)
				return
			S.use(2)
			to_chat(user, "<span class='notice'>Вы добавили обшивки.</span>")
			var/turf/T = get_turf(src)
			T.ChangeTurf(/turf/closed/wall/f13/wood/house)
			transfer_fingerprints_to(T)
			qdel(src)
		return

//crc
	else
		return ..()

/obj/structure/barricade/CanPass(atom/movable/mover, turf/target, height=0)//So bullets will fly over and stuff.
	if(height == 0 || density == FALSE)
		return TRUE

	if(dirlike && istype(mover, /mob/living))
		if(mover.throwing)
			return TRUE
		if(get_dir(loc, target) & dir)
			return FALSE
		return TRUE

	else if(locate(/obj/structure/barricade) in get_turf(mover))
		return 1
	else if(istype(mover, /obj/item/projectile))
		if(!anchored)
			return 1
		var/obj/item/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return 1
		if(prob(proj_pass_rate))
			return 1
		return 0
	else
		return !density

/obj/structure/barricade/CheckExit(atom/movable/O, turf/target)
	if(density == FALSE)
		return TRUE

	if(dirlike && istype(O, /mob/living))
		if(O.throwing)
			return TRUE

		if(get_dir(loc, target) & dir)
			return FALSE
		return TRUE
	else
		return TRUE


/obj/structure/barricade/climb_structure(mob/user)
	if(dirlike && user.loc == loc)
		src.add_fingerprint(user)
		user.visible_message("<span class='warning'>[user] starts climbing onto [src].</span>", \
									"<span class='notice'>You start climbing onto [src]...</span>")
		var/adjusted_climb_time = climb_time
		if(user.restrained())
			adjusted_climb_time *= 2
		if(isalien(user))
			adjusted_climb_time *= 0.25
		structureclimber = user
		if(do_mob(user, user, adjusted_climb_time))
			if(src.loc) //Checking if structure has been destroyed
				density = FALSE
				user.Move(get_step(loc, dir), dir)
				density = TRUE
				user.Stun(climb_stun)
				to_chat(user, "<span class='warning'>Вы перелезли через [src].</span>")
				. = 1
			else
				to_chat(user, "<span class='warning'>Вы не смогли перелезть через [src].</span>")
		structureclimber = null
	else
		..()

/////BARRICADE TYPES///////

/obj/structure/barricade/wooden
	name = "wooden barricade"
	desc = "This space is blocked off by a wooden barricade."
	icon = 'icons/fallout/objects/structures/fences.dmi'
	icon_state = "woodenbarricade"
	material = WOOD

/obj/structure/barricade/wooden/make_debris()
	new /obj/item/stack/sheet/mineral/wood(get_turf(src), 3)

/obj/structure/barricade/wooden/strong
	name = "strong wooden barricade"
	desc = "This space is blocked off by a strong wooden barricade."
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 30

/obj/structure/barricade/bars //FighterX2500 is this you?
	name = "metal bars"
	desc = "Old, corroded metal bars. Ain't got a file on you, right?" //Description by Mr.Fagetti
	icon = 'icons/fallout/objects/structures/fences.dmi'
	icon_state = "bars"
	obj_integrity = 400
	max_integrity = 400
	proj_pass_rate = 80 //Fairly good for executions.
	pass_flags = LETPASSTHROW //Feed the prisoners, or not.
	canpass = TRUE

/obj/structure/barricade/sandbags
	name = "мешки с песком"
	desc = "Хорошее укрутие, оно вызывает у вас флешбэки.."
	icon = 'icons/Marine/barricades.dmi'
	icon_state = "sandbag_0"
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 20
	pass_flags = LETPASSTHROW
	material = SAND
	climbable = TRUE
	dirlike = TRUE

/obj/structure/barricade/sandbags/metal
	name = "металлические укрепления"
	desc = "Гораздо прочнее и эффективнее мешков с песком."
	icon = 'icons/Marine/barricades.dmi'
	icon_state = "metal_0"
	proj_pass_rate = 35
	obj_integrity = 500
	max_integrity = 500

/obj/structure/barricade/sandbags/wooden
	name = "деревянные укрепления"
	desc = "Достаточно посредственное укрытие, но оно может спасти вам жизнь."
	icon = 'icons/Marine/barricades.dmi'
	icon_state = "wooden"
	proj_pass_rate = 15
	obj_integrity = 150
	max_integrity = 150

/obj/structure/barricade/security
	name = "police barrier"
	desc = "A deployable barrier. Provides good cover in fire fights."
	icon = 'icons/obj/objects.dmi'
	icon_state = "barrier0"
	density = 0
	anchored = 0
	obj_integrity = 180
	max_integrity = 180
	proj_pass_rate = 20
	armor = list(melee = 10, bullet = 50, laser = 50, energy = 50, bomb = 10, bio = 100, rad = 100, fire = 10, acid = 0)


/obj/structure/barricade/security/New()
	..()
	addtimer(CALLBACK(src, .proc/deploy), 40)

/obj/structure/barricade/security/proc/deploy()
	icon_state = "barrier1"
	density = 1
	anchored = 1
	visible_message("<span class='warning'>[src] deploys!</span>")


/obj/item/weapon/grenade/barrier
	name = "barrier grenade"
	desc = "Instant cover.<br><i>Alt+click to toggle modes.</i>"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "flashbang"
	item_state = "flashbang"
	actions_types = list(/datum/action/item_action/toggle_barrier_spread)
	var/mode = SINGLE

/obj/item/weapon/grenade/barrier/AltClick(mob/living/user)
	if(!istype(user) || user.incapacitated())
		return
	toggle_mode(user)

/obj/item/weapon/grenade/barrier/proc/toggle_mode(mob/user)
	switch(mode)
		if(SINGLE)
			mode = VERTICAL
		if(VERTICAL)
			mode = HORIZONTAL
		if(HORIZONTAL)
			mode = SINGLE

	to_chat(user, "[src] is now in [mode] mode.")

/obj/item/weapon/grenade/barrier/prime()
	new /obj/structure/barricade/security(get_turf(src.loc))
	switch(mode)
		if(VERTICAL)
			var/target_turf = get_step(src, NORTH)
			if(!(is_blocked_turf(target_turf)))
				new /obj/structure/barricade/security(target_turf)

			var/target_turf2 = get_step(src, SOUTH)
			if(!(is_blocked_turf(target_turf2)))
				new /obj/structure/barricade/security(target_turf2)
		if(HORIZONTAL)
			var/target_turf = get_step(src, EAST)
			if(!(is_blocked_turf(target_turf)))
				new /obj/structure/barricade/security(target_turf)

			var/target_turf2 = get_step(src, WEST)
			if(!(is_blocked_turf(target_turf2)))
				new /obj/structure/barricade/security(target_turf2)
	qdel(src)

/obj/item/weapon/grenade/barrier/ui_action_click(mob/user)
	toggle_mode(user)


#undef SINGLE
#undef VERTICAL
#undef HORIZONTAL

#undef METAL
#undef WOOD
#undef SAND