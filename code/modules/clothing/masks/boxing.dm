/obj/item/clothing/mask/balaclava
	name = "balaclava"
	desc = "LOADSAMONEY"
	icon_state = "balaclava"
	item_state = "balaclava"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/clothing/mask/balaclava/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/luchador
	name = "Luchador Mask"
	desc = "Worn by robust fighters, flying high to defeat their foes!"
	icon_state = "luchag"
	item_state = "luchag"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/luchador/speechModification(message)
	if(copytext_char(message, 1, 2) != "*")
		message = replacetext_char(message, "captain", "capitano-eblano")
		message = replacetext_char(message, "station", "statione")
		message = replacetext_char(message, "sir", "SEГ‘OR")
		message = replacetext_char(message, "the ", "el ")
		message = replacetext_char(message, "my ", "mi ")
		message = replacetext_char(message, "is ", "es ")
		message = replacetext_char(message, "it's", "es")
		message = replacetext_char(message, "friend", "amigo")
		message = replacetext_char(message, "buddy", "amigo")
		message = replacetext_char(message, "hello", "hola")
		message = replacetext_char(message, " hot", " caliente")
		message = replacetext_char(message, " very ", " muy ")
		message = replacetext_char(message, "sword", "espada")
		message = replacetext_char(message, "library", "biblioteca")
		message = replacetext_char(message, "traitor", "traidor")
		message = replacetext_char(message, "wizard", "mago")
		message = uppertext(message)	//Things end up looking better this way (no mixed cases), and it fits the macho wrestler image.
		if(prob(25))
			message += " OLE!"
	return message

/obj/item/clothing/mask/luchador/tecnicos
	name = "Tecnicos Mask"
	desc = "Worn by robust fighters who uphold justice and fight honorably."
	icon_state = "luchador"
	item_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "Rudos Mask"
	desc = "Worn by robust fighters who are willing to do anything to win."
	icon_state = "luchar"
	item_state = "luchar"
