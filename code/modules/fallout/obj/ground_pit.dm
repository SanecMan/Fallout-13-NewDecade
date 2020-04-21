//Fallout 13 - Ain't no grave, that can hold my body down.

//functions for digging pits in the ground and storing stuff in it
#define NUMCONTENT 5
#define NUMBURYTIMES 3

/turf/open/indestructible/ground
	name = "песок"

/turf/open/indestructible/ground/desert
	name = "песок"
	var/turf_type = /turf/open/indestructible/ground/desert
	var/dug = 0
	var/storedindex = 0
	var/mob/living/gravebody
	var/obj/structure/closet/coffin/gravecoffin
	var/pitcontents = list()
	var/obj/dugpit/mypit
	var/unburylevel = 0


/obj/dugpit
	name = "dug pit"
	anchored = 1
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "pit"
	mouse_opacity = 0
	var/turf/open/indestructible/ground/desert/parent

obj/dugpit/New(lnk)
	..()
	parent = lnk

/obj/dugpit/container_resist(usr) // RESIST
	//try to unbury self
	to_chat(usr, "<span class='danger'>You start digging from the inside, trying to unbury yourself!</span>")
	if(do_after(usr, 450, target = src))
		to_chat(usr, "<span class='danger'>You have undug yourself!</span>")
		parent.gets_dug(null)

/turf/open/indestructible/ground/desert/proc/handle_item_insertion(obj/item/W, mob/usr)
	if(!istype(W))
		return
	if (storedindex>=NUMCONTENT)
		to_chat(usr, "<span class='danger'>The pit is filled to the brim!</span>")
		return
	if(usr)
		if(!usr.unEquip(W))
			return
	if(usr)
		if(usr.client && usr.s_active != src)
			usr.client.screen -= W

		add_fingerprint(usr)

		if(!istype(W, /obj/item/weapon/gun/energy/kinetic_accelerator/crossbow))
			for(var/mob/M in viewers(usr, null))
				if(M == usr)
					to_chat(usr, "<span class='notice'>Вы положили [W] в яму.</span>")
				else if(in_range(M, usr)) //If someone is standing close enough, they can tell what it is...
					M.show_message("<span class='notice'>[usr] кладёт [W] в яму.</span>", 1)
				else if(W && W.w_class >= 3) //Otherwise they can only see large or normal items from a distance...
					M.show_message("<span class='notice'>[usr] кладёт [W] в яму.</span>", 1)
		pitcontents += W
		W.forceMove(mypit)
		storedindex = storedindex+1

/turf/open/indestructible/ground/desert/attack_hand(mob/living/carbon/human/M)
	. = ..()
	if (!. && dug)
		if (storedindex==0)
			to_chat(usr, "<span class='danger'>В яме ничего нет!</span>")
			return
		else
			var/obj/item/I = pitcontents[storedindex]
			storedindex = storedindex - 1
			I.forceMove(M.loc)
			pitcontents-=I

/turf/open/indestructible/ground/desert/proc/finishBury(mob/user)
	to_chat(user, "<span class='notice'>Вы закопали яму.</span>")
	dug = 0
	//icon_plating = "[environment_type]"
	icon_state = "wasteland[rand(1,31)]"
	mypit.invisibility = 101

/turf/open/indestructible/ground/desert/proc/finishBody()
	gravebody.forceMove(mypit)
	unburylevel = 0

/turf/open/indestructible/ground/desert/proc/finishCoffin()
	gravecoffin.forceMove(mypit)

/turf/open/indestructible/ground/desert/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(.)
		return .

	var/digging_speed = 0
	if (istype(W, /obj/item/weapon/shovel))
		var/obj/item/weapon/shovel/S = W
		digging_speed = S.digspeed
	else if (istype(W, /obj/item/weapon/pickaxe))
		var/obj/item/weapon/pickaxe/P = W
		digging_speed = P.digspeed
	if (digging_speed)
		var/turf/T = user.loc
		if (!( istype(T, /turf) ))
			return
		if (dug)
			for (var/mob/living/mobongrave in mypit.loc)
				//bury the first one
				gravebody = mobongrave
				break
			for (var/obj/structure/closet/coffin/curcoffin in mypit.loc)
				if (!curcoffin.opened)
					gravecoffin = curcoffin
					break
			playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1)
			if (gravebody!=null)
				to_chat(user, "<span class='notice'>Вы начали закидывать тело в яме землей...</span>")
				if (do_after(user, digging_speed*3, target=gravebody))
					if(istype(src, /turf/open/indestructible/ground/desert))
						finishBury(user)
						finishBody()
			else if (gravecoffin != null)
				to_chat(user, "<span class='notice'>Вы начали закапывать гроб...</span>")
				if (do_after(user, digging_speed*1.5, target=gravebody))
					if(istype(src, /turf/open/indestructible/ground/desert))
						finishBury(user)
						finishCoffin()
			else
				to_chat(user, "<span class='notice'>Вы начали закидывать дыру землей...</span>")
				if(do_after(user, digging_speed, target = src))
					if(istype(src, /turf/open/indestructible/ground/desert))
						finishBury(user)


		else
			to_chat(user, "<span class='notice'>Вы начали копать...</span>")
			playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1) //FUCK YO RUSTLE I GOT'S THE DIGS SOUND HERE
			if(do_after(user, digging_speed, target = src))
				if(istype(src, /turf/open/indestructible/ground/desert))
					to_chat(user, "<span class='notice'>Вы выкопали дыру.</span>")
					gets_dug(user)
					new /obj/item/weapon/ore/glass(src)
					//new /obj/item/weapon/ore/glass(src)
					for(var/obj/effect/O in src)
						if(is_cleanable(O))
							qdel(O)
	else
		//not digging
		if (dug)
			//add items
			handle_item_insertion(W, user)


/turf/open/indestructible/ground/desert/proc/gets_dug(mob/user)
	if(dug)
		return
	for (var/obj/item/I in pitcontents)
		I.forceMove(user.loc)
	if (mypit==null)
		mypit = new/obj/dugpit(src)
	mypit.invisibility = 0
	storedindex = 0
	pitcontents = list()
	dug = 1
//	icon_plating = "[environment_type]_dug"
	icon_state = "wasteland32"
	slowdown = 0
	if (gravebody!=null)
		if (user!=null)
			to_chat(user, "<span class='danger'>Вы обнаружили тело в яме!</span>")
		gravebody.forceMove(mypit.loc)
	if (gravecoffin!=null)
		if (user!=null)
			to_chat(user, "<span class='notice'>Вы выкопали гроб из ямы.</span>")
		gravecoffin.forceMove(mypit.loc)
	gravebody = null
	gravecoffin = null
	return