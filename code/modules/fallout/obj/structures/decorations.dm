/obj/structure/decoration_f13/
	icon = 'icons/obj/structures.dmi'
	icon_state = "yashik_musor2_full"
	density = 1
	anchored = 1
	layer = 5
	resistance_flags = INDESTRUCTIBLE

/obj/structure/decoration_f13/panel
	name = "прибор"
	desc = "Какой-то военный прибор.  Не работает."
	icon_state = "panel_1"

/obj/structure/decoration_f13/panel/v2
	icon_state = "panel_2"

/obj/structure/decoration_f13/stove
	name = "плита"
	desc = "Довоенная плита, ржавая, старая и нерабочая."
	icon_state = "gasstove"
	pass_flags = LETPASSTHROW

/obj/structure/decoration_f13/radiator
	name = "радиатор"
	desc = "Большие ржавые трубы, когда-то служившие системой отопления..."
	icon = 'icons/obj/structures.dmi'
	icon_state = "radiator"
	layer = 3.2
	density = 0

/obj/structure/decoration_f13/dresser
	name = "шкаф для одежды"
	desc = "A nicely-crafted wooden dresser. It's filled with lots of undies."
	icon = 'icons/obj/structures.dmi'
	icon_state = "wardrobe"
	density = 1
	anchored = 1

/obj/structure/decoration_f13/dresser/attack_hand(mob/user)
	if(!Adjacent(user))//no tele-grooming
		return
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		var/choice = input(user, "Underwear, Undershirt, or Socks?", "Changing") as null|anything in list("Underwear","Undershirt","Socks")

		if(!Adjacent(user))
			return
		switch(choice)
			if("Underwear")
				var/new_undies = input(user, "Select your underwear", "Changing")  as null|anything in underwear_list
				if(new_undies)
					H.underwear = new_undies

			if("Undershirt")
				var/new_undershirt = input(user, "Select your undershirt", "Changing") as null|anything in undershirt_list
				if(new_undershirt)
					H.undershirt = new_undershirt
			if("Socks")
				var/new_socks = input(user, "Select your socks", "Changing") as null|anything in socks_list
				if(new_socks)
					H.socks= new_socks

		add_fingerprint(H)
		H.update_body()

/obj/structure/decoration_f13/decal
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "lifeweb"
	density = 0

/obj/structure/decoration_f13/decal/blood
	name = "кровь"
	desc = "Кровь... Много мать её крови. Целое художество."
	icon_state = "blood_pic_2"

/obj/structure/decoration_f13/decal/blood/hands
	icon_state = "blood_pic_4"

/obj/structure/decoration_f13/decal/blood/die
	icon_state = "blood_pic_1"

/obj/structure/decoration_f13/decal/blood/honk
	icon_state = "blood_pic_3"

/obj/structure/decoration_f13/decal/blood/i_see_you
	icon_state = "blood_pic_5"

/obj/structure/decoration_f13/decal/blood/help_me
	icon_state = "blood_pic_6"

/obj/structure/decoration_f13/decal/blood/its_safe
	icon_state = "blood_pic_8"

/obj/structure/decoration_f13/decal/blood/dead_space
	icon_state = "blood_pic_9"

/obj/structure/decoration_f13/decal/hole
	name = "дырка от пули"
	desc = "Походе, кто-то вёл тут ожесточенную перестрелку... Когда-то."
	icon_state = "bhole-small"

/obj/structure/decoration_f13/decal/hole/medium
	icon_state = "bhole-medium"

/obj/structure/decoration_f13/decal/hole/large
	icon_state = "bhole-large"

/obj/structure/decoration_f13/poster
	name = "постер"
	desc = "Просто постер."
	icon = 'icons/obj/contraband.dmi'
	icon_state = "rolled_poster"
	anchored = 1

/obj/structure/decoration_f13/poster/v2
	icon_state = "poster2"

/obj/structure/decoration_f13/poster/v3
	icon_state = "poster2_legit"

/obj/structure/decoration_f13/poster/v4
	icon_state = "poster3_legit"

/obj/structure/decoration_f13/poster/v5
	icon_state = "poster5_legit"

/obj/structure/decoration_f13/poster/v6
	icon_state = "poster17_legit"

/obj/structure/decoration_f13/poster/v7
	icon_state = "poster20_legit"

/obj/structure/decoration_f13/poster/v8
	icon_state = "poster21_legit"

/obj/structure/decoration_f13/poster/v9
	icon_state = "poster26_legit"

/obj/structure/decoration_f13/poster/v10
	icon_state = "poster11_legit"

/obj/structure/decoration_f13/poster/v11
	icon_state = "poster7"

/obj/structure/decoration_f13/poster/v12
	icon_state = "poster20_legit"

/obj/structure/decoration_f13/poster/pinup
	name = "пинап"
	desc = "постер с красивой женщиной, раньше их называли пинапами..."
	icon_state = "poster4"

/obj/structure/decoration_f13/poster/pinup/v2
	icon_state = "poster36"