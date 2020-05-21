/mob/living/carbon/verb/give()
	set category = "IC"
	set name = "Передать"
	set src in view(1)

	if(src == usr)
		to_chat(usr,"<span class='warning'>You feel stupider, suddenly.</span>")
		return

	if(!ismonkey(src)&&!ishuman(src) || isalien(src) || src.stat || usr.stat || !src.client)
		to_chat(usr,"<span class='warning'>[src.name] не может взять что-либо</span>")
		return

	var/obj/item/I = usr.get_active_held_item()
	if(!I)
		to_chat(usr,"<span class='warning'>У вас нет ничего что вы бы могли дать [src].</span>")
		return

	if(!usr.canUnEquip(I))
		return

	var/list/empty_hands = get_empty_held_indexes()
	if(!empty_hands.len)
		to_chat(usr,"<span class='warning'>Руки [src] полны.</span>")
		return
	switch(alert(src,"[usr] trying to give you something, take [I]?",,"Yes","No"))
		if("Yes")
			if(!I || !usr)
				return
			if(!Adjacent(usr))
				to_chat(usr,"<span class='warning'>Вы слишком далеко.</span>")
				to_chat(usr,"<span class='warning'>[usr] ушел слишком далеко.</span>")
				return

			if(I != usr.get_active_held_item())
				to_chat(usr,"<span class='warning'>Вам необходимо держать предмет в активной руке.</span>")
				to_chat(usr,"<span class='warning'>[name] похоже, сдается, в попытках всё-же дать вам [I].</span>")
				return

			if(src.lying || src.handcuffed)
				to_chat(usr,"<span class='warning'>В наручниках.</span>")
				return

			empty_hands = get_empty_held_indexes()
			if(!empty_hands.len)
				to_chat(usr,"<span class='warning'>Ваши руки заняты.</span>")
				to_chat(usr,"<span class='warning'>Руки заняты.</span>")
				return

			if(!usr.drop_item_v())
				return

			if(!put_in_hands(I))
				to_chat(usr,"<span class='warning'>Вы не можете взять [I], так что [usr] сдается!</span>")
				to_chat(usr,"<span class='warning'>[src] не может взять [I]!</span>")
				return

			src.visible_message("<span class='notice'>[usr] передал [I] в руки [src].</span>")
		if("No")
			src.visible_message("<span class='warning'>[usr] пытается передать [I] в руки [src], но [src] отказывается брать.</span>")