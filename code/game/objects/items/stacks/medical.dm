/obj/item/stack/medical
	name = "medical pack"
	singular_name = "medical pack"
	icon = 'icons/obj/items.dmi'
	amount = 6
	max_amount = 6
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	resistance_flags = FLAMMABLE
	obj_integrity = 40
	max_integrity = 40
	var/heal_brute = 0
	var/heal_burn = 0
	var/stop_bleeding = 0
	var/self_delay = 50

/obj/item/stack/medical/attack(mob/living/M, mob/user)

	if(M.stat == 2)
		var/t_him = "it"
		if(M.gender == MALE)
			t_him = "him"
		else if(M.gender == FEMALE)
			t_him = "her"
		to_chat(user, "<span class='danger'> [M] в ином мире, вы не можете помочь [t_him]!</span>")
		return

	if(!istype(M, /mob/living/carbon) && !istype(M, /mob/living/simple_animal))
		to_chat(user, "<span class='danger'>Вы не знаете как применить [src] к [M]!</span>")
		return 1

	var/obj/item/bodypart/affecting
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		affecting = C.get_bodypart(check_zone(user.zone_selected))
		if(!affecting) //Missing limb?
			to_chat(user, "<span class='warning'>[C] потерял [parse_zone(user.zone_selected)]!</span>")
			return
		if(ishuman(C))
			var/mob/living/carbon/human/H = C
			if(stop_bleeding)
				if(H.bleedsuppress)
					to_chat(user, "<span class='warning'>Кровотечение [H] уже перебинтовано!</span>")
					return
				else if(!H.bleed_rate)
					to_chat(user, "<span class='warning'>[H] не кровоточит!</span>")
					return


	if(isliving(M))
		if(!M.can_inject(user, 1))
			return

	if(user)
		if (M != user)
			if (istype(M, /mob/living/simple_animal))
				var/mob/living/simple_animal/critter = M
				if (!(critter.healable))
					to_chat(user, "<span class='notice'> Вы не можете использовать [src] на [M]!</span>")
					return
				else if (critter.health == critter.maxHealth)
					to_chat(user, "<span class='notice'> [M] полон сил.</span>")
					return
				else if(src.heal_brute < 1)
					to_chat(user, "<span class='notice'> [src] не поможет [M].</span>")
					return
			user.visible_message("<span class='green'>[user] applies [src] on [M].</span>", "<span class='green'>Вы применили [src] на [M].</span>")
		else
			var/t_himself = "себе"
			if(user.gender == MALE)
				t_himself = "себе"
			else if(user.gender == FEMALE)
				t_himself = "себе"
			user.visible_message("<span class='notice'>[user] начинает применение [src] на [t_himself]...</span>", "<span class='notice'>Вы начинаете применение [src] на себе...</span>")
			if(!do_mob(user, M, self_delay))
				return
			user.visible_message("<span class='green'>[user] применил [src] на [t_himself].</span>", "<span class='green'>Вы успешно применили [src] на себе.</span>")


	if(iscarbon(M))
		var/mob/living/carbon/C = M
		affecting = C.get_bodypart(check_zone(user.zone_selected))
		if(!affecting) //Missing limb?
			to_chat(user, "<span class='warning'>[C] doesn't have \a [parse_zone(user.zone_selected)]!</span>")
			return
		if(ishuman(C))
			var/mob/living/carbon/human/H = C
			if(stop_bleeding)
				if(!H.bleedsuppress) //so you can't stack bleed suppression
					H.suppress_bloodloss(stop_bleeding)
		if(affecting.status == BODYPART_ORGANIC) //Limb must be organic to be healed - RR
			if(affecting.heal_damage(heal_brute, heal_burn))
				C.update_damage_overlays()
		else
			to_chat(user, "<span class='notice'>Обычная медицина не сработает на протезе!</span>")
	else
		M.heal_bodypart_damage((src.heal_brute/2), (src.heal_burn/2))

	use(1)



/obj/item/stack/medical/bruise_pack
	name = "bruise pack"
	singular_name = "bruise pack"
	desc = "Гель в сочетании с бинтами, создан для лечения физического урона вроде ран."
	icon_state = "brutepack"
	heal_brute = 40
	origin_tech = "biotech=2"
	self_delay = 20

/obj/item/stack/medical/gauze
	name = "качественная марля"
	desc = "Моток эластичной ткани, предназначен для более эффективного остановления кровотечения, но всё еще не лечит раны."
	gender = PLURAL
	singular_name = "medical gauze"
	icon_state = "gauze"
	stop_bleeding = 1800
	self_delay = 20

/obj/item/stack/medical/gauze/improvised
	name = "импровизированная марля"
	singular_name = "improvised gauze"
	desc = "Моток ткани, предназначенный для остановления кровотечения, но всё-же не может вылечить раны."
	stop_bleeding = 900

/obj/item/stack/medical/gauze/cyborg
	materials = list()
	is_cyborg = 1
	cost = 250

/obj/item/stack/medical/ointment
	name = "мазь"
	desc = "Используйте чтобы вылечить эти бесящие ожоги."
	gender = PLURAL
	singular_name = "ointment"
	icon_state = "ointment"
	heal_burn = 40
	origin_tech = "biotech=2"
	self_delay = 20
