/*
  /////////////////////////////////////////////////////////////////////
 //Ебал я лопатить вам всю систему стрельбы, так что пока будет так //
/obj/item/weapon/gun/ballistic/shotgun/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_casing/shotgun))
		if(magazine.attackby(A, user, params, 1))
			to_chat(user, "<span class='notice'>You load [A.name] shell\s into \the [src]!</span>")
			playsound(loc, mag_load_sound, 50)
			A.update_icon()
			update_icon()
	else
		..()


  ////////////////////
 //SHOTGUN MAGAZINE//
/obj/item/ammo_box/magazine/internal/shot
	ammo_type = /obj/item/ammo_casing/shotgun
	var/ammo_to_load = /obj/item/ammo_casing/shotgun/stunslug

/obj/item/ammo_box/magazine/internal/shot/New()
	..()
	if(!start_empty)
		ammo_left = max_ammo
		for(var/i, i <= max_ammo, i++)
			new ammo_to_load(src)
	update_icon()

/obj/item/ammo_box/magazine/internal/shot/give_round(obj/item/ammo_casing/shotgun/R, mob/user)
	if(!R)
		return 0

	if(ammo_left < max_ammo)
		user.drop_item()
		R.forceMove(src)
		ammo_left += 1
		update_icon()
		return 1
	return 0

/obj/item/ammo_box/magazine/internal/shot/get_round(keep = 0)
	if(!ammo_left)
		return null
	else
		ammo_left = contents.len + 1
		return contents.len

/obj/item/ammo_box/magazine/internal/shot/attackby(obj/item/A, mob/user, params, silent = 0, replace_spent = 0)
	var/num_loaded = 0
	if(!can_load(user))
		return

	if(istype(A, /obj/item/ammo_casing/shotgun))
		var/obj/item/ammo_casing/AC = A
		if(give_round(AC, user))
			num_loaded++

	if(num_loaded)
		if(!silent)
			to_chat(user, "<span class='notice'>You load [num_loaded] shell\s into \the [src]!</span>")
		A.update_icon()
		update_icon()

	return num_loaded

/obj/item/ammo_box/magazine/internal/shot/attack_self(mob/user)
	to_chat(user, "<span class='notice'>Containts [contents.len]!</span>")
	to_chat(user, "<span class='notice'>Ammo [ammo_left]!</span>")

	var/obj/item/ammo_casing/A = get_round()
	if(A)
		user.put_in_hands(A)
		to_chat(user, "<span class='notice'>You remove a round from \the [src]!</span>")
		update_icon()
*/