//Fallout 13 brahmin directory

/mob/living/simple_animal/cow/brahmin
	name = "Брамин"
	desc = "Брамин, это мутировавшая корова, с двумя головами. А еще она имеет два вымени.<br>Популярны за своё молоко."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "brahmin"
	icon_living = "brahmin"
	icon_dead = "brahmin_d"
	icon_gib = "brahmin_g"
	speak = list("Moo.","Moo?","Moo!","MOOOOOO","Moo, I say.","Heeey brooo!","Heeey yooou!") //Original Brahmin from Fallout
	speak_emote = list("moos","moos hauntingly")
	emote_hear = list("мычит.")
	emote_see = list("мотает головами.")
	speed = 4
	self_weight = 150
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 6, /obj/item/stack/sheet/animalhide/generic=2)

	XP = 2

	/mob/living/simple_animal/cow/brahmin/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans)
		if(findtext_char(raw_message, "C0WM4K6MOM0"))
			src.Hear(message, speaker, message_langs, raw_message, radio_freq, spans)
		. = ..()