//Fallout 13 holodisks directory
//Here we get the basic mechanics as coded by WB! Praise him and other Unknown coder for this.

/obj/item/weapon/holodisk
	name = "голозапись"
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time."
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "holodisk"
	item_state = "holodisk"
	throwforce = 0
	hitsound = null
	throw_speed = 3
	throw_range = 7
	attack_verb = list("had a wonderful day, and was about to examine the holodisk, but suddenly noticed that someone nearby is making rather abusive gestures, and decided to hit")
	var/busy = 0
	var/soundLength = 50
	var/soundFile = 'sound/f13music/mysterious_stranger.ogg'
	w_class = WEIGHT_CLASS_TINY

/obj/item/weapon/holodisk/Initialize()
        src.name = "holodisk #[rand(1,999)]"
        return ..()

/obj/item/weapon/holodisk/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	src.playAudio(user)
	return ..()

/obj/item/weapon/holodisk/attack_self(mob/user as mob)
	src.playAudio(user)
	return

/obj/item/weapon/holodisk/proc/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			src.icon_state = initial(src.icon_state)
			src.busy = 0
	return

//Here we get any holodisks we want, using the basic mechanics.

/obj/item/weapon/holodisk/abducted
	soundFile =  'sound/f13items/holodisk_abducted.ogg'
	soundLength = 430

/obj/item/weapon/holodisk/runninggun
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time.<br>This particular holodisk contains a rare Radio New Vegas broadcast.<br>An inscription on the side reads \"Running Gun\""
	soundFile =  'sound/f13music/new_vegas_show_bonus_1.ogg'
	soundLength = 1836

/obj/item/weapon/holodisk/bigiron
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time.<br>This particular holodisk contains a rare Radio New Vegas broadcast.<br>An inscription on the side reads \"Big Iron\""
	soundFile =  'sound/f13music/new_vegas_show_bonus_2.ogg'
	soundLength = 2448

/obj/item/weapon/holodisk/civildefence_samaya
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time.<br>This particular holodisk contains a Civil Defence song.<br>An inscription on the side reads \"Sam (Aya)\""
	soundFile =  'sound/f13music/civildefence1.ogg'
	soundLength = 255

/obj/item/weapon/holodisk/JohnnyGuitar
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time.<br>This particular holodisk contains a song.<br>An inscription on the side reads \"Johnny Guitar\""
	soundFile =  'sound/f13music/Johnny Guitar.ogg'
	soundLength = 183

/obj/item/weapon/holodisk/maybe
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time.<br>This particular holodisk contains a song.<br>An inscription on the side reads \"Maybe\""
	soundFile =  'sound/f13music/maybe.ogg'
	soundLength = 1836

/obj/item/weapon/holodisk/takemehome
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time.<br>This particular holodisk contains a song.<br>An inscription on the side reads \"Take me Home, Country roads\""
	soundFile =  'sound/f13music/takemehome.ogg'
	soundLength = 1836

/obj/item/weapon/holodisk/WouldnItBeNice
	desc = "A durable laser-readable storage device produced by Wattz Electronics.<br>Based on tape holography technology, it can store information safely for extended periods of time.<br>This particular holodisk contains a song.<br>An inscription on the side reads \"Wouldn't It Be Nice\""
	soundFile =  'sound/f13music/wibn.ogg'
	soundLength = 1836

//One special holodisk can gib the listener or cripple someone else.

/obj/item/weapon/holodisk/cursed
	soundFile =  'sound/f13items/holodisk_cursed.ogg'
	soundLength = 230
	throwforce = 50 //It's funny counting you can't give objects hand to hand on TG, but have to throw or drop them instead.

/obj/item/weapon/holodisk/cursed/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			if(user) user.gib()
			src.icon_state = initial(src.icon_state)
			src.busy = 0
	return

//Music box is based of holodisk

/obj/item/weapon/holodisk/musicbox
	name = "музыкальная шкатулка"
	desc = "Довоенное напоминание о былом человечестве и его искусстве..."
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "music1"
	item_state = "music1"
	soundFile =  'sound/f13items/music_box.ogg' //Amazing grace
	soundLength = 320
	price = 1000

/obj/item/weapon/holodisk/musicbox/Initialize()
	..()
	name = "music box"