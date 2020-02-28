/*
Опилки. Пока что не сьедобны.
*/

/obj/item/weapon/sawdust
	name = "A Sawdust"
	icon = 'icons/fallout/flora/flora.dmi'
	icon_state = "sawdust_1"
	desc = "This is tree radioactive sawdust. Not a good."
	force = 0
	resistance_flags = FLAMMABLE

/obj/item/weapon/sawdust/New()
	icon_state = "sawdust_[rand(1, 4)]"
	..()
