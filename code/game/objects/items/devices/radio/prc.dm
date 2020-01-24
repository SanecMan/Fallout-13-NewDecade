////говнокод раций////

/obj/item/device/radio/prc
	icon = 'icons/obj/prc.dmi'
	name = "PRC-68"
	desc = "Такие рации использовали еще до войны..."
	icon_state = "prc"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = SLOT_BACK
	materials = list(MAT_METAL=850, MAT_GLASS=450)
	self_weight = 20
	frequency = 6359
	key = 343

/obj/item/device/radio/prc/bs
	icon = 'icons/obj/prc.dmi'
	name = "R-105"
	desc = "Где вообще можно было нарыть этот древний кусок дерьма?"
	icon_state = "r105"
	frequency = 1919
	key = 1501

/obj/item/device/radio/headset/radist
	name = "radio headset"
	icon = 'icons/obj/prc.dmi'
	icon_state = "headset"

/////////////////////

/obj/item/device/radio/prc/attack_hand(mob/user)
	if(loc == user)
		if(slot_flags == SLOT_BACK)
			if(user.get_item_by_slot(slot_back) == src)
				ui_action_click()
			else
				to_chat(user, "<span class='warning'>Put the radio on your back first!</span>")
		return
	..()

/obj/item/device/radio/prc/MouseDrop(obj/over_object)
	if(ismob(src.loc))
		var/mob/M = src.loc
		if(istype(over_object, /obj/screen/inventory/hand))
			var/obj/screen/inventory/hand/H = over_object
			if(!M.unEquip(src))
				return
			M.put_in_hand(src, H.held_index)
