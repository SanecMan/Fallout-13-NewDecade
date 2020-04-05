/mob/living/carbon/verb/give()
	set category = "IC"
	set name = "Give"
	set src in view(1)

	if(src == usr)
		to_chat(usr,"<span class='warning'>You feel stupider, suddenly.</span>")
		return

	if(!ismonkey(src)&&!ishuman(src) || isalien(src) || src.stat || usr.stat || !src.client)
		to_chat(usr,"<span class='warning'>[src.name] не может вз€ть что-либо</span>")
		return

	var/obj/item/I = usr.get_active_held_item()
	if(!I)
		to_chat(usr,"<span class='warning'>” вас нет ничего что вы бы могли дать [src].</span>")
		return

	if(!usr.canUnEquip(I))
		return

	var/list/empty_hands = get_empty_held_indexes()
	if(!empty_hands.len)
		to_chat(usr,"<span class='warning'>–уки [src] полны.</span>")
		return

	switch(alert(src,"[usr] хочет передать вам [I]?",,"Yes","No"))
		if("Yes")
			if(!I || !usr)
				return
			if(!Adjacent(usr))
				to_chat(usr,"<span class='warning'>You need to stay in reaching distance while giving an object.</span>")
				to_chat(usr,"<span class='warning'>[usr] moved too far away.</span>")
				return

			if(I != usr.get_active_held_item())
				to_chat(usr,"<span class='warning'>You need to keep the item in your active hand.</span>")
				to_chat(usr,"<span class='warning'>[name] seem to have given up on giving [I] to you.</span>")
				return

			if(src.lying || src.handcuffed)
				to_chat(usr,"<span class='warning'>¬ наручниках.</span>")
				return

			empty_hands = get_empty_held_indexes()
			if(!empty_hands.len)
				to_chat(usr,"<span class='warning'>¬аши руки заполнены.</span>")
				to_chat(usr,"<span class='warning'>–уки заполнены.</span>")
				return

			if(!usr.drop_item_v())
				return

			if(!put_in_hands(I))
				to_chat(usr,"<span class='warning'>¬ы не можете вз€ть [I], так что [usr] сдаетс€!</span>")
				to_chat(usr,"<span class='warning'>[src] не может вз€ть [I]!</span>")
				return

			src.visible_message("<span class='notice'>[usr] передал [I] в руки [src].</span>")
		if("No")
			src.visible_message("<span class='warning'>[usr] пытаетс€ передать [I] в руки [src], но [src] отказываетс€ брать.</span>")