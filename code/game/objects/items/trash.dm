//Added by Jack Rost
/obj/item/trash
	icon = 'icons/obj/janitor.dmi'
	desc = "Мусор."
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE

/obj/item/trash/raisins
	name = "\improper 4Причины"
	icon_state= "4no_raisins"

/obj/item/trash/candy
	name = "конфета"
	icon_state= "candy"

/obj/item/trash/cheesie
	name = "сырный хонкерс"
	icon_state = "cheesie_honkers"

/obj/item/trash/chips
	name = "чипсы"
	icon_state = "chips"

/obj/item/trash/popcorn
	name = "popcorn"
	icon_state = "popcorn"

/obj/item/trash/sosjerky
	name = "\improper Scaredy's Private Reserve Beef Jerky"
	icon_state = "sosjerky"

/obj/item/trash/syndi_cakes
	name = "syndi-cakes"
	icon_state = "syndi_cakes"

/obj/item/trash/waffles
	name = "поднос из под вафель"
	icon_state = "waffles"

/obj/item/trash/plate
	name = "тарелка"
	icon_state = "plate"
	resistance_flags = 0

/obj/item/trash/pistachios
	name = "pistachios pack"
	icon_state = "pistachios_pack"

/obj/item/trash/semki
	name = "упаковка семечек"
	icon_state = "semki_pack"

/obj/item/trash/tray
	name = "поднос"
	icon_state = "tray"
	resistance_flags = 0

/obj/item/trash/candle
	name = "свеча"
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle4"

/obj/item/trash/can
	name = "мятая банка"
	icon_state = "cola"
	resistance_flags = 0

/obj/item/trash/attack(mob/M, mob/living/user)
	return

/obj/item/trash/coal
	name = "lump of coal"
	icon = 'icons/obj/mining.dmi'
	icon_state = "slag"
	desc = "Someone's gotten on the naughty list."

/obj/item/trash/coal/burn()
	visible_message("[src] fuses into a diamond! Someone wasn't so naughty after all...")
	new /obj/item/weapon/ore/diamond(loc)
	qdel(src)