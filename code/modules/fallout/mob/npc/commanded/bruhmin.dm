//Fallout 13 dog companion

/mob/living/simple_animal/hostile/commanded/bruhmin
	name = "Brahmin"
	desc = "A large brown cow. With two heads."

	icon_state = "brahmin"
	icon_living = "brahmin"
	icon_dead = "brahmin_d"
	icon_gib = "brahmin_g"

	health = 250
	maxHealth = 250

	move_to_delay = 1

	density = 1
	var/obj/item/inventory_back
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	speak = list("Moo.","Moo?","Moo!","MOOOOOO","Moo, I say.","Heeey brooo!","Heeey yooou!") //Original Brahmin from Fallout
	speak_emote = list("moos","moos hauntingly")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.")
	faction = list("brahmin")
	see_in_dark = 5
	speak_chance = 1
	turns_per_move = 10
	speed = 4
	self_weight = 150
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 6, /obj/item/stack/sheet/animalhide/generic=2)

	attacktext = "бодает"
	melee_damage_lower = 15
	melee_damage_upper = 45
	attack_sound = 'sound/weapons/bite.ogg'

	known_commands = list("stay", "stop", "follow", "friend", "pull")

/mob/living/simple_animal/hostile/commanded/bruhmin/listen(var/mob/speaker, var/text)
	..()
	if(stance == COMMANDED_DEFEND || stance == COMMANDED_ATTACK)
		icon_state = "[initial(icon_state)]_angry"
	else
		icon_state = "[initial(icon_state)]"

/mob/living/simple_animal/hostile/commanded/bruhmin/accepted()
	emote("me",1,pick(emote_see))

/mob/living/simple_animal/hostile/commanded/bruhmin/unacsessable()
	emote("me",1,"whines")

/mob/living/simple_animal/hostile/commanded/bruhmin/GiveTarget(new_target)
	..()
//	if((stance == COMMANDED_DEFEND || stance == COMMANDED_ATTACK) && is_enemy(new_target))


/mob/living/simple_animal/hostile/commanded/bruhmin/handle_automated_speech(var/override)
	if(stance == COMMANDED_DEFEND || stance == COMMANDED_ATTACK)
		if(prob(5))
			emote("me",1,pick(emote_see))

/mob/living/simple_animal/hostile/commanded/bruhmin/show_inv(mob/user)
	user.set_machine(src)
	if(user.stat) return
	var/dat = {"<meta charset="UTF-8">"}
	dat += 	"<div align='center'><b>Inventory of [name]</b></div><p>"
	if(inventory_back)
		dat +=	"<br><b>Back:</b> [inventory_back] (<a href='?src=\ref[src];remove_inv=back'>Remove</a>)"
	else
		dat +=	"<br><b>Back:</b> <a href='?src=\ref[src];add_inv=back'>Nothing</a>"

	user << browse(dat, text("window=mob[];size=325x500", real_name))
	onclose(user, "mob[real_name]")
	return

/mob/living/simple_animal/hostile/commanded/bruhmin/Topic(href, href_list)
	if(usr.stat) return

	//Removing from inventory
	if(href_list["remove_inv"])
		if(!Adjacent(usr) || !(ishuman(usr) || ismonkey(usr) || iscyborg(usr) ||  isalienadult(usr)))
			return
		var/remove_from = href_list["remove_inv"]
		switch(remove_from)
			if("back")
				if(inventory_back)
					inventory_back.forceMove(src.loc)
					inventory_back = null
					regenerate_icons()
				else
					to_chat(usr, "<span class='danger'>There is nothing to remove from its [remove_from].</span>")
					return

		show_inv(usr)

	//Adding things to inventory
	else if(href_list["add_inv"])
		if(!Adjacent(usr) || !(ishuman(usr) || ismonkey(usr) || iscyborg(usr) ||  isalienadult(usr)))
			return

		var/add_to = href_list["add_inv"]

		switch(add_to)
			if("back")
				if(inventory_back)
					to_chat(usr, "<span class='warning'>It's already wearing something!</span>")
					return
				else
					var/obj/item/item_to_add = usr.get_active_held_item()

					if(!item_to_add)
						usr.visible_message("[usr] pets [src].","<span class='notice'>You rest your hand on [src]'s back for a moment.</span>")
						return

					if(!usr.drop_item())
						to_chat(usr, "<span class='warning'>\The [item_to_add] is stuck to your hand, you cannot put it on [src]'s back!</span>")
						return

					if(istype(item_to_add,/obj/item/weapon/grenade/plastic)) // last thing he ever wears, I guess
						item_to_add.afterattack(src,usr,1)
						return
					regenerate_icons()

		show_inv(usr)
	else
		..()