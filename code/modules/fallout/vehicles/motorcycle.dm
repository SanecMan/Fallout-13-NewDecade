//Fallout 13 primary vehicle

/obj/vehicle/fuel/motorcycle
	name = "мотоцикл"
	desc = "Wanderer Motors LLC."
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "bike"
	pixel_x = -16
	pixel_y = -2
	layer = LYING_MOB_LAYER
	obj_integrity = 400
	max_integrity = 400
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 30, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 40)
	var/image/cover = null
	var/datum_type = /datum/riding/motorcycle
	self_weight = 500
	engine_on_sound = 'sound/f13machines/bike_start.ogg'
	engine_loop_sound = 'sound/f13machines/bike_loop.ogg'

/obj/vehicle/fuel/motorcycle/buckle_mob(mob/living/buckled_mob, force = 0, check_loc = 1)
	. = ..()
	riding_datum = new datum_type()

/obj/vehicle/fuel/motorcycle/relaymove(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_suit, /obj/item/clothing/suit/armor/f13/power_armor))
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
	..()

/obj/vehicle/fuel/motorcycle/post_buckle_mob(mob/living/M)
	if(has_buckled_mobs())
		add_overlay(cover)
	else
		overlays -= cover

/obj/vehicle/fuel/motorcycle/New()
	..()
	cover = image(icon, "[icon_state]_cover")//"bike_cover")
	cover.layer = ABOVE_MOB_LAYER

/obj/item/key/motorcycle
	name = "ключи от мотоцикла"
	desc = "Кольцо с ключиком.<br>При осмотре, вы понимаете что это ключ от мотоцикла."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'
	w_class = WEIGHT_CLASS_TINY
	price = 4500

/obj/item/key/motorcycle/New()
	..()
	icon_state = pick("key-bike-r","key-bike-y","key-bike-g","key-bike-b")

//Motorcycle subtypes with different skins

/obj/vehicle/fuel/motorcycle/rusty
	name = "ржавый мотоцикл"
	desc = "Очень старый и очень ржавый мотоцикл. <br>Однако, он еще на ходу."
	icon_state = "bike_rust_med"
	datum_type = /datum/riding/motorcycle/slow

/obj/vehicle/fuel/motorcycle/green
	name = "зеленый мотоцикл"
	desc = "Военный зеленый мотоцикл старых времен.<br>Удивительно, но он в прекрасном состоянии. Черт, Армия всегда имеет всё самое лучшее."
	icon_state = "bike_green"

/obj/vehicle/fuel/motorcycle/flamy
	name = "черный мотоцикл"
	desc = "Винтажный, черный мотоцикл.<br>Он очень хорошо покрашен в черный, а еще он сияет.<br>В дополнение ко всему, он еще имеет языки пламени на бензобаке."
	icon_state = "bike_flamy"

/obj/vehicle/fuel/motorcycle/scrambler
	name = "мотобайк"
	desc = "Этот мотобайк когда-то учавствовал в гонках.<br> Он чертовски быстрый."
	icon_state = "bike_scrambler"
	datum_type = /datum/riding/motorcycle/fast

//Motorcycle riding datum

/datum/riding/motorcycle/fast
	vehicle_move_delay = 0.7

/datum/riding/motorcycle/slow
	vehicle_move_delay = 1.2

/datum/riding/motorcycle
	keytype = /obj/item/key/motorcycle
	vehicle_move_delay = 1

/datum/riding/motorcycle/handle_vehicle_layer()
	return

/datum/riding/motorcycle/handle_vehicle_offsets()
	..()
	if(ridden.has_buckled_mobs())
		for(var/m in ridden.buckled_mobs)
			var/mob/living/buckled_mob = m
			switch(buckled_mob.dir)
				if(NORTH)
					buckled_mob.pixel_x = 0
					buckled_mob.pixel_y = 8
				if(EAST)
					buckled_mob.pixel_x = -2
					buckled_mob.pixel_y = 5
				if(SOUTH)
					buckled_mob.pixel_x = 0
					buckled_mob.pixel_y = 12
				if(WEST)
					buckled_mob.pixel_x = 2
					buckled_mob.pixel_y = 5