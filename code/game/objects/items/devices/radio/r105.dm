////говнокод раций////


/obj/item/weapon/prc
	name = "PRC-68"
	desc = "The massive external power source for the laser gatling gun"
	icon = 'icons/obj/storage.dmi'
	icon_state = "prc"
	item_state = "backpack"
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/device/radio/prc = null
	var/armed = 0 //whether the gun is attached, 0 is attached, 1 is the gun is wielded.
	var/overheat = 0
	var/overheat_max = 100
	var/heat_diffusion = 2
	var/obj/item/weapon/prc/ammo_pack

/obj/item/weapon/prc/New()
	gun = new(src)
	START_PROCESSING(SSobj, src)
	..()

/obj/item/weapon/prc/Destroy()
	STOP_PROCESSING(SSobj, src)
	..()
/obj/item/weapon/prc/attack_hand(var/mob/living/carbon/user)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(slot_back) == src)
				armed = 1
				if(!user.put_in_hands(gun))
					armed = 0
					to_chat(user, "<span class='warning'>You need a free hand to hold radio!</span>")
					return
				update_icon()
				gun.forceMove(user)
				user.update_inv_back()
		else
			to_chat(user, "<span class='warning'>You are already holding the radio!</span>")
	else
		..()

/obj/item/weapon/prc/attackby(obj/item/weapon/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.unEquip(gun,1)
	else
		..()

/obj/item/weapon/prc/dropped(mob/user)
	if(armed)
		user.unEquip(gun,1)

/obj/item/weapon/prc/MouseDrop(atom/over_object)
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.restrained() && !M.stat)

			if(istype(over_object, /obj/screen/inventory/hand))
				var/obj/screen/inventory/hand/H = over_object
				if(!M.unEquip(src))
					return
				M.put_in_hand(src, H.held_index)


/obj/item/weapon/prc/update_icon()
	if(armed)
		icon_state = "prc_on"
	else
		icon_state = "prc"

/obj/item/weapon/prc/proc/attach_gun(var/mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = 0
	if(user)
		to_chat(user, "<span class='notice'>You attach the radio to the [name].</span>")
	else
		src.visible_message("<span class='warning'>The radio snaps back onto the [name]!</span>")
	update_icon()
	user.update_inv_back()


/obj/item/device/radio/dropped(mob/user)
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/device/radio/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, "You need the backpack power source to fire the gun!")
	..()

/obj/item/device/radio/New()
	if(!ammo_pack)
		if(istype(loc,/obj/item/device/radio)) //We should spawn inside a ammo pack so let's use that one.
			ammo_pack = loc
			..()
		else
			qdel(src)//No pack, no radio

/obj/item/device/radio/dropped(mob/living/user)
	ammo_pack.attach_gun(user)
