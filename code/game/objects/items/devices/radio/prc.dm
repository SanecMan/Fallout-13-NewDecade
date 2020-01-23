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

/obj/item/device/radio/prc/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/device/radio/prc/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/device/radio/prc/attack_hand(mob/user)
	interact(user)

/obj/item/device/radio/prc/interact(mob/user)
	..()
	ui_interact(user, state = default_state)

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