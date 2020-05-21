/mob/living/carbon/human/examine(mob/user)
//this is very slightly better than it was because you can use it more places. still can't do \his[src] though.
	var/t_He = p_they(TRUE)
	var/t_His = p_their(TRUE)
	var/t_his = p_their()
	var/t_him = p_them()
	var/t_has = p_have()
	var/t_is = p_are()

	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	var/wielded = 0

	var/msg = "<span class='info'>*---------* <br>Это [bicon(src)] <EM>[src]</EM>!\n"

	//uniform
	if(w_uniform && !(slot_w_uniform in obscured))
		//Ties
		var/tie_msg
		if(istype(w_uniform,/obj/item/clothing/under))
			var/obj/item/clothing/under/U = w_uniform
			if(U.hastie)
				tie_msg += " с [bicon(U.hastie)]  [U.hastie]"

		if(w_uniform.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_is] носит [bicon(w_uniform)] [w_uniform.gender==PLURAL?"some":"a"] покрытую кровью [w_uniform.name][tie_msg]!</span>\n"
		else
			msg += "[t_He] [t_is] носит [bicon(w_uniform)] [w_uniform][tie_msg].\n"

	//head
	if(head)
		if(head.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_is] носит [bicon(head)] [head.gender==PLURAL?"some":"a"] покрытую кровью [head.name] на своей голове!</span>\n"
		else
			msg += "[t_He] [t_is] носит [bicon(head)] [head] на своей голове.\n"

	//suit/armor
	if(wear_suit)
		if(wear_suit.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_is] носит [bicon(wear_suit)] [wear_suit.gender==PLURAL?"some":"a"] покрытый кровью [wear_suit.name]!</span>\n"
		else
			msg += "[t_He] [t_is] носит [bicon(wear_suit)] [wear_suit].\n"

		//suit/armor storage
		if(s_store)
			if(s_store.blood_DNA)
				msg += "<span class='warning'>[t_He] [t_is] тащит [bicon(s_store)] [s_store.gender==PLURAL?"some":"a"] покрытый кровью [s_store.name] на своём [wear_suit.name]!</span>\n"
			else
				msg += "[t_He] [t_is] тащит [bicon(s_store)] [s_store] на своем [wear_suit.name].\n"

	//back
	if(back)
		if(back.blood_DNA)
			msg += msg += "<span class='warning'>[t_He] [t_has] [bicon(back)] [back.gender==PLURAL?"some":"a"] покрытый кровью [back] на своей спине.</span>\n"
		else
			msg += msg += "[t_He] носит [bicon(back)] [back] на своей спине.\n"

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.flags & ABSTRACT))
			if(istype(I,/obj/item/weapon))
				var/obj/item/weapon/W = I
				if(W.wielded)
					wielded = 1
			if(I.blood_DNA)
				msg += "<span class='warning'>[t_He] [t_is] держит [bicon(I)] [I.gender==PLURAL?"немного":""] покрытый кровью [I.name] в своих [wielded ? "руках" : get_held_index_name(get_held_index_of_item(I))]!</span>\n"
			else
				msg += "[t_He] [t_is] держит [bicon(I)] [I] в [wielded ? "своих руках" : get_held_index_name(get_held_index_of_item(I))].\n"

	//gloves
	if(gloves && !(slot_gloves in obscured))
		if(gloves.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_has] [bicon(gloves)] [gloves.gender==PLURAL?"some":"a"] покрытые кровью [gloves.name] на своих руках!</span>\n"
		else
			msg += "[t_He] [t_has] [bicon(gloves)]  [gloves] на своих руках.\n"
	else if(blood_DNA)
		var/hand_number = get_num_arms()
		if(hand_number)
			msg += "<span class='warning'>[t_He] [t_has] покрытую кровью [hand_number > 1 ? "левую" : "правую"] руку!</span>\n"

	//handcuffed?

	//handcuffed?
	if(handcuffed)
		if(istype(handcuffed, /obj/item/weapon/restraints/handcuffs/cable))
			msg += "<span class='warning'>[t_He] [t_is] [bicon(handcuffed)] связан кабелем</span>\n"
		else
			msg += "<span class='warning'>[t_He] [t_is] [bicon(handcuffed)] в наручниках!</span>\n"

	//belt
	if(belt)
		if(belt.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_has] [bicon(belt)] [belt.gender==PLURAL?"some":""] покрытый кровью [belt.name] вокруг своего пояса!</span>\n"
		else
			msg += "[t_He] [t_has] [bicon(belt)] [belt] вокруг [t_his] пояса.\n"

	//shoes
	if(shoes && !(slot_shoes in obscured))
		if(shoes.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_is] носит [bicon(shoes)] [shoes.gender==PLURAL?"some":"a"] покрытые кровью [shoes.name] на своих ногах!</span>\n"
		else
			msg += "[t_He] [t_is] носит [bicon(shoes)]  [shoes] на [t_his] ногах.\n"

	//mask
	if(wear_mask && !(slot_wear_mask in obscured))
		if(wear_mask.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_has] [bicon(wear_mask)] [wear_mask.gender==PLURAL?"some":""] покрытую кровью [wear_mask.name] на своём лице!</span>\n"
		else
			msg += "[t_He] [t_has] [bicon(wear_mask)]  [wear_mask] на своём лице.\n"

	if (wear_neck && !(slot_neck in obscured))
		msg += "[t_He] [t_is] носит [bicon(src.wear_neck)]  [src.wear_neck] вокруг своей шеи.\n"

	//eyes
	if(glasses && !(slot_glasses in obscured))
		if(glasses.blood_DNA)
			msg += "<span class='warning'>[t_He] [t_has] [bicon(glasses)] [glasses.gender==PLURAL?"some":"a"] покрытые кровью [glasses] скрывающие [t_his] глаза!</span>\n"
		else
			msg += "[t_He] [t_has] [bicon(glasses)]  [glasses] скрывающие [t_his] глаза.\n"

	//ears
	if(ears && !(slot_ears in obscured))
		msg += "[t_He] [t_has] [bicon(ears)]  [ears] на своих ушах.\n"

	//ID
	if(wear_id)
		msg += "[t_He] [t_is] носит [bicon(wear_id)] [wear_id].\n"

	if(src.status != "Wastelander" && !skipface)
		var/datum/status/S = get_status_datum(src.status)
		if(S != null && S.id != "none")
			msg += "[t_He] [t_is] <span style='color: [S.color]'>[S.name]</span>"
			if(src.social_faction && !istype(src.social_faction, /list))
				var/datum/f13_faction/F = get_faction_datum(src.social_faction)
				if(F != null && F.id != "none")
					msg += " of <span style='color: [F.color]'>[F.name]</span>"
			msg += "\n"

	msg += karmaText()

	//Jitters
	switch(jitteriness)
		if(300 to INFINITY)
			msg += "<span class='warning'><B>[t_He] [t_is] convulsing violently!</B></span>\n"
		if(200 to 300)
			msg += "<span class='warning'>[t_He] [t_is] extremely jittery.</span>\n"
		if(100 to 200)
			msg += "<span class='warning'>[t_He] [t_is] twitching ever so slightly.</span>\n"

	var/appears_dead = 0
	if(stat == DEAD || (status_flags & FAKEDEATH))
		appears_dead = 1
		if(getorgan(/obj/item/organ/brain))//Only perform these checks if there is no brain
			if(suiciding)
				msg += "<span class='warning'>[t_He] пытается совершить самоубийство... нет надежды спасти.</span>\n"
			if(hellbound)
				msg += "<span class='warning'>[t_His] похоже, душа покинула [t_his] тело.  Реанимация невозможна.</span>\n"
			msg += "<span class='deadsay'>Конечности не двигаются. Жизнь окончательно покинула это тело."
			if(!key)
				var/foundghost = 0
				if(mind)
					for(var/mob/dead/observer/G in player_list)
						if(G.mind == mind)
							foundghost = 1
							if (G.can_reenter_corpse == 0)
								foundghost = 0
							break
				if(!foundghost)
					msg += " и [t_his] душа покинула тело"
			msg += "...</span>\n"
		else if(get_bodypart("head")) //Brain is gone, doesn't matter if they are AFK or present. Check for head first tho. Decapitation has similar message.
			msg += "<span class='deadsay'>Похоже, что [t_his] мозг отсутствует...</span>\n"

	var/temp = getBruteLoss() //no need to calculate each of these twice

	msg += "<span class='warning'>"

	var/list/missing = list("head", "chest", "l_arm", "r_arm", "l_leg", "r_leg")
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		missing -= BP.body_zone
		for(var/obj/item/I in BP.embedded_objects)
			msg += "<B>[t_He] [t_has] \a [bicon(I)] [I] застрял в [t_his] [BP.name]!</B>\n"

	//stores missing limbs
	var/l_limbs_missing = 0
	var/r_limbs_missing = 0
	for(var/t in missing)
		if(t=="head")
			msg += "<span class='deadsay'><B>[t_His] [parse_zone(t)] отсутствует!</B><span class='warning'>\n"
			continue
		if(t == "l_arm" || t == "l_leg")
			l_limbs_missing++
		else if(t == "r_arm" || t == "r_leg")
			r_limbs_missing++

		msg += "<B>[capitalize(t_his)] [parse_zone(t)] отсутствует!</B>\n"

	if(l_limbs_missing >= 2 && r_limbs_missing == 0)
		msg += "[t_He] looks all right now.\n"
	else if(l_limbs_missing == 0 && r_limbs_missing >= 2)
		msg += "[t_He] really keeps to the left.\n"
	else if(l_limbs_missing >= 2 && r_limbs_missing >= 2)
		msg += "[t_He] doesn't seem all there.\n"

	if(temp)
		if(temp < 30)
			msg += "[t_He] [t_has] небольшие подтёки крови.\n"
		else
			msg += "<B>[t_He] [t_has] тяжелые кровоподтёки!</B>\n"

	temp = getFireLoss()
	if(temp)
		if(temp < 30)
			msg += "[t_He] [t_has] небольшие ожоги.\n"
		else
			msg += "<B>[t_He] [t_has] тяжелые ожоги!</B>\n"

	temp = getCloneLoss()
	if(temp)
		if(temp < 30)
			msg += "[t_He] [t_has] minor cellular damage.\n"
		else
			msg += "<B>[t_He] [t_has] severe cellular damage.</B>\n"


	if(fire_stacks > 0)
		msg += "[t_He] [t_is] покрыт чем-то горючим.\n"
	if(fire_stacks < 0)
		msg += "[t_He] выглядит немного промокшим.\n"


	if(pulledby && pulledby.grab_state)
		msg += "[t_He] [t_is] сдерживается хваткой [pulledby].\n"

	if(nutrition < NUTRITION_LEVEL_STARVING - 50)
		msg += "[t_He] [t_is] сильно истощен.\n"
	else if(nutrition >= NUTRITION_LEVEL_FAT)
		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
			msg += "[t_He] [t_is] plump and delicious looking - Like a fat little piggy. A tasty piggy.\n"
		else
			msg += "[t_He] [t_is] немного пухляшка.\n"

	if(blood_volume < BLOOD_VOLUME_SAFE)
		msg += "[t_He] [t_has] бледную кожу.\n"

	if(bleedsuppress)
		msg += "[t_He] [t_is] чем-то перебинтован.\n"
	else if(bleed_rate)
		if(reagents.has_reagent("heparin"))
			msg += "<b>[t_He] [t_is] теряет кровь в огромных количествах!</b>\n"
		else
			msg += "<B>[t_He] [t_is] теряет кровь!</B>\n"

	if(reagents.has_reagent("teslium"))
		msg += "[t_He] излучает мягкий голубой свет!\n"

	if(islist(stun_absorption))
		for(var/i in stun_absorption)
			if(stun_absorption[i]["end_time"] > world.time && stun_absorption[i]["examine_message"])
				msg += "[t_He] [t_is][stun_absorption[i]["examine_message"]]\n"

	if(drunkenness && !skipface && !appears_dead) //Drunkenness
		switch(drunkenness)
			if(11 to 21)
				msg += "[t_He] [t_is] slightly flushed.\n"
			if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
				msg += "[t_He] [t_is] flushed.\n"
			if(41.01 to 51)
				msg += "[t_He] [t_is] quite flushed and [t_his] breath smells of alcohol.\n"
			if(51.01 to 61)
				msg += "[t_He] is very flushed and [t_his] movements jerky, with breath reeking of alcohol.\n"
			if(61.01 to 91)
				msg += "[t_He] looks like a drunken mess.\n"
			if(91.01 to INFINITY)
				msg += "[t_He] [t_is] a shitfaced, slobbering wreck.\n"

	msg += "</span>"

	if(!appears_dead)
		if(stat == UNCONSCIOUS)
			msg += "[t_He] [t_is]n't responding to anything around [t_him] and seems to be asleep.\n"
		else if(getBrainLoss() >= 60)
			msg += "[t_He] [t_has] a stupid expression on [t_his] face.\n"

		if(getorgan(/obj/item/organ/brain))
			if(istype(src,/mob/living/carbon/human/interactive))
				var/mob/living/carbon/human/interactive/auto = src
				if(auto.showexaminetext)
					msg += "<span class='deadsay'>[t_He] [t_is] appears to be some sort of sick automaton, [t_his] eyes are glazed over and [t_his] mouth is slightly agape.</span>\n"
				if(auto.debugexamine)
					var/dodebug = auto.doing2string(auto.doing)
					var/interestdebug = auto.interest2string(auto.interest)
					msg += "<span class='deadsay'>[t_He] [t_is] appears to be [interestdebug] and [dodebug].</span>\n"
			else if(!key)
				msg += "<span class='deadsay'>[t_He] [t_is] в ступоре. Стрессы жизни на Пустошах, по разному сказываются на людях. Any recovery is unlikely.</span>\n"
			else if(!client)
				msg += "[t_He] [t_has] пустой, безжизненный взгляд аутиста...\n"

		if(digitalcamo)
			msg += "[t_He] [t_is] moving [t_his] body in an unnatural and blatantly inhuman manner.\n"

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/cyberimp/eyes/hud/CIH = H.getorgan(/obj/item/organ/cyberimp/eyes/hud)
		if(istype(H.glasses, /obj/item/clothing/glasses/hud) || CIH)
			var/perpname = get_face_name(get_id_name(""))
			if(perpname)
				var/datum/data/record/R = find_record("name", perpname, data_core.general)
				if(R)
					msg += "<span class='deptradio'>Ранг:</span> [R.fields["rank"]]<br>"
					msg += "<a href='?src=\ref[src];hud=1;photo_front=1'>\[Front photo\]</a> "
					msg += "<a href='?src=\ref[src];hud=1;photo_side=1'>\[Side photo\]</a><br>"
				if(istype(H.glasses, /obj/item/clothing/glasses/hud/health) || istype(CIH,/obj/item/organ/cyberimp/eyes/hud/medical))
					var/cyberimp_detect
					for(var/obj/item/organ/cyberimp/CI in internal_organs)
						if(CI.status == ORGAN_ROBOTIC)
							cyberimp_detect += "[name] модифицирован [CI.name].<br>"
					if(cyberimp_detect)
						msg += "Обнаружены кибернитические модификации:<br>"
						msg += cyberimp_detect
					if(R)
						var/health_r = R.fields["p_stat"]
						msg += "<a href='?src=\ref[src];hud=m;p_stat=1'>\[[health_r]\]</a>"
						health_r = R.fields["m_stat"]
						msg += "<a href='?src=\ref[src];hud=m;m_stat=1'>\[[health_r]\]</a><br>"
					R = find_record("name", perpname, data_core.medical)
					if(R)
						msg += "<a href='?src=\ref[src];hud=m;evaluation=1'>\[Medical evaluation\]</a><br>"


				if(istype(H.glasses, /obj/item/clothing/glasses/hud/security) || istype(CIH,/obj/item/organ/cyberimp/eyes/hud/security))
					if(!user.stat && user != src)
					//|| !user.canmove || user.restrained()) Fluff: Sechuds have eye-tracking technology and sets 'arrest' to people that the wearer looks and blinks at.
						var/criminal = "None"

						R = find_record("name", perpname, data_core.security)
						if(R)
							criminal = R.fields["criminal"]

						msg += "<span class='deptradio'>Криминальный статус:</span> <a href='?src=\ref[src];hud=s;status=1'>\[[criminal]\]</a>\n"
						msg += "<span class='deptradio'>Записи СБ:</span> <a href='?src=\ref[src];hud=s;view=1'>\[View\]</a> "
						msg += "<a href='?src=\ref[src];hud=s;add_crime=1'>\[Add crime\]</a> "
						msg += "<a href='?src=\ref[src];hud=s;view_comment=1'>\[View comment log\]</a> "
						msg += "<a href='?src=\ref[src];hud=s;add_comment=1'>\[Add comment\]</a>\n"
	msg += "*---------*</span>"

	to_chat(user, msg)
