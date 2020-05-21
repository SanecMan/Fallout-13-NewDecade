#define CUM_TARGET_THROAT "throat"
#define CUM_TARGET_VAGINA "vagina"
#define CUM_TARGET_ANUS "anus"
//god abondoned us
/mob/living/simple_animal/hostile/deathclaw/funclaw
	name = "Еблёготь"
	desc = "Огромная рептилия с огромными мускулами и бритвенно острыми когтями. Очень агрессивное. Эй, почему оно так смотрит на мою задницу?"
	var/pound_cooldown = 0
	var/chosen_hole

/mob/living/simple_animal/hostile/deathclaw/funclaw/bossraider
	name = "Супер-Рейдер"
	desc = "ВАЛЕРА ЕЖОВ!"
	icon = 'icons/mob/raiderboss.dmi'
	icon_state = "raider"
	icon_dead = "raider_d"
	attacktext = "бьёт с размаху"
	maxHealth = 800
	health = 800
	speak_chance = 30
	faction = list("raiders")
	speak = list("ТЫ НЕ САПРЯЧЕШЬСЯ СКОТИНА!", "ГЛАЗ НА ЖОПУ НАТЯНУ!", "УМРИ! УМРИ!", "Я ХОЧУ ЖРАТЬ!", "Я ВЫЕБУ ТЕБЯ И ТВОЮ СЕМЬЮ, ПАСКУДА!", "ТВОЕЙ ЗАДНИЦЕ ПРИШЕЛ ПИЗДЕЦ!")
	speak_emote = list("орёт", "кричит")
	loot = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 3, /obj/effect/gibspawner/human = 1)
	XP = 25

/mob/living/simple_animal/hostile/deathclaw/funclaw/bossraider/karlik
	name = "Рейдер-Карлик"
	desc = "ЯРОШ КРУШИТЬ!"
	icon_state = "karlik"
	icon_dead = "raider_d"
	maxHealth = 600
	health = 600
	XP = 15


/mob/living/simple_animal/hostile/deathclaw/funclaw/AttackingTarget()
	var/mob/living/M = target
	if(!ishuman(M) || M.health > 60)
		..()
		return

	if(get_dist(src, M) > 0)
		a_intent = INTENT_GRAB
		grab_state = GRAB_NECK

		start_pulling(M, 1)
		M.grabbedby(src)
		M.drop_all_held_items()
		M.stop_pulling()

	else if(get_dist(src, M) == 0)
		if(refactory_period > 0)
			..()
			return

		if(pound_cooldown < world.time)
			chosen_hole = null
			while (chosen_hole == null)
				pickNewHole(M)
			pound_cooldown = world.time + 100

		pound(M)
		sleep(rand(1, 3))
		pound(M)
		sleep(rand(1, 3))
		pound(M)

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/pickNewHole(mob/living/M)
	switch(rand(2))
		if(0)
			chosen_hole = CUM_TARGET_ANUS
		if(1)
			if(M.has_vagina())
				chosen_hole = CUM_TARGET_VAGINA
		if(2)
			chosen_hole = CUM_TARGET_THROAT

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/pound(mob/living/M)
	if(refactory_period > 0)
		return

	switch(chosen_hole)
		if(CUM_TARGET_ANUS)
			if(tearSlot(M, SLOT_OCLOTHING))
				return
			if(tearSlot(M, SLOT_ICLOTHING))
				return
			do_anal(M)

		if(CUM_TARGET_VAGINA)
			if(tearSlot(M, SLOT_OCLOTHING))
				return
			if(tearSlot(M, SLOT_ICLOTHING))
				return
			do_vaginal(M)

		if(CUM_TARGET_THROAT)
			if(tearSlot(M, SLOT_HEAD))
				return
			if(tearSlot(M, SLOT_MASK))
				return
			do_throatfuck(M)

/mob/living/simple_animal/hostile/deathclaw/funclaw/cum(mob/living/M)

	if(refactory_period > 0)
		return

	var/message

	if(!istype(M))
		chosen_hole = null

	switch(chosen_hole)
		if(CUM_TARGET_THROAT)
			if(M.has_mouth() && M.mouth_is_free())
				message = "просовывает свой огромный ящерский член в глотку [M] и кончает."
				M.reagents.add_reagent("cum", rand(9,15))
			else
				message = "кончает на лицо [M]."
		if(CUM_TARGET_VAGINA)
			if(M.has_vagina())
				message = "пробивает писечку [M] и заполняет её спермой."
				M.reagents.add_reagent("cum", rand(8,12))
			else
				message = "кончает на живот [M]."
		if(CUM_TARGET_ANUS)
			if(M.has_anus())
				message = "трахает своим сочным членом [M] в жопу и наполняет её густой спермой Когтя Смерти."
				M.reagents.add_reagent("cum", rand(8,12))
			else
				message = "кончает на попку [M]."
		else
			message = "кончает на пол!"

	playsound(loc, "honk/sound/interactions/clawcum[rand(1, 2)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\[src]</b> [message]</font>")
	shake_camera(M, 3, 1)
	set_is_fucking(null ,null)

	refactory_period = 5
	lust = 5
	lust_tolerance += 50

	sleep(20)
	playsound(loc, "honk/sound/interactions/slap.ogg", 70, 1, -1)
	visible_message("<span class='danger'>\The [src]</b> шлёпает [M] по заднице!</span>", \
			"<span class='userdanger'>\The [src]</b> шлёпает [M] по заднице!</span>", null, COMBAT_MESSAGE_RANGE)

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/tearSlot(mob/living/M, slot)
	var/obj/item/W = M.get_item_by_slot(slot)
	if(W)
		M.drop_item_v(W)
		playsound(loc, "sound/items/poster_ripped.ogg", 70, 1, -1)
		visible_message("<span class='danger'>[src]</b> рвёт одежду на [M]!</span>", \
				"<span class='userdanger'>\The [src]</b> рвёт одежду на [M]!</span>", null, COMBAT_MESSAGE_RANGE)
		return TRUE
	return FALSE


/mob/living/simple_animal/hostile/deathclaw/funclaw/bossraider/cum(mob/living/M)

	if(refactory_period > 0)
		return

	var/message

	if(!istype(M))
		chosen_hole = null

	switch(chosen_hole)
		if(CUM_TARGET_THROAT)
			if(M.has_mouth() && M.mouth_is_free())
				message = "просовывает свой огромный клоунский член в глотку [M] и кончает."
				M.reagents.add_reagent("cum", rand(9,15))
			else
				message = "кончает на лицо [M]."
		if(CUM_TARGET_VAGINA)
			if(M.has_vagina())
				message = "пробивает писечку [M] и заполняет её спермой."
				M.reagents.add_reagent("cum", rand(8,12))
			else
				message = "кончает на живот [M]."
		if(CUM_TARGET_ANUS)
			if(M.has_anus())
				message = "трахает своим сочным членом [M] в жопу и наполняет её густой спермой Клоуна. ХОНК."
				M.reagents.add_reagent("cum", rand(8,12))
			else
				message = "кончает на попку [M]."
		else
			message = "кончает на пол!"

	playsound(loc, "honk/sound/interactions/clawcum[rand(1, 2)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\[src]</b> [message]</font>")
	shake_camera(M, 3, 1)
	set_is_fucking(null ,null)

	refactory_period = 5
	lust = 5
	lust_tolerance += 50

	sleep(20)
	playsound(loc, "honk/sound/interactions/slap.ogg", 70, 1, -1)
	visible_message("<span class='danger'>\The [src]</b> шлёпает [M] по заднице!</span>", \
			"<span class='userdanger'>\The [src]</b> шлёпает [M] по заднице!</span>", null, COMBAT_MESSAGE_RANGE)
