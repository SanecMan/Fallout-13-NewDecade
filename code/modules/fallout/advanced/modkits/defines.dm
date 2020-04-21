/obj/item/weapon/gun
	var/name_original
	var/list/modifications = list ()
	var/list/modificationsNames = list ()

/obj/item/weapon/gun/examine(mob/user)
	..()

	if(usr.client && (usr.client.prefs.chat_toggles & CHAT_LANGUAGE))
		if(modificationsNames.len == 0)
			return

		to_chat(user, "Module installed:")
	else
		if(modificationsNames.len == 0)
			return

		to_chat(user, "Модуль установлен:")
	for(var/S in modificationsNames)
		to_chat(user, S)

/obj/item/weapon/gun/attackby(obj/item/weapon/W, mob/living/carbon/human/user, params)
	..()

	if(user.special.getPoint("i") + user.skills.getPoint("repair") <= 12)
		if(usr.client && (usr.client.prefs.chat_toggles & CHAT_LANGUAGE))
			to_chat(user, "You have no skills, to do this.")
			return
		else
			to_chat(user, "У вас не хватает навыхов, чтобы поставить улучшение.")
			return

	if(istype(W, /obj/item/kit))
		W:install(src)

/obj/item/weapon/gun/proc/WMK_have(var/type)
	return (type in modifications)