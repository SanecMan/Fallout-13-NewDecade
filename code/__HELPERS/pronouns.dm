//pronoun procs, for getting pronouns without using the text macros that only work in certain positions
//datums don't have gender, but most of their subtypes do!
/datum/proc/p_they(capitalized, temp_gender)
	. = usr.client.select_lang("оно", "it")
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_their(capitalized, temp_gender)
	. = usr.client.select_lang("это", "its")
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_them(capitalized, temp_gender)
	. = usr.client.select_lang("оно", "it")
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_have(temp_gender)
	. = usr.client.select_lang("имеет", "has")

/datum/proc/p_are(temp_gender)
	. = usr.client.select_lang("есть", "is")

/datum/proc/p_were(temp_gender)
	. = usr.client.select_lang("был", "was")

/datum/proc/p_do(temp_gender)
	. = usr.client.select_lang("делает", "does")

/datum/proc/p_theyve(capitalized, temp_gender)
	. = p_they(capitalized, temp_gender) + "'" + copytext_char(p_have(temp_gender), 3)

/datum/proc/p_theyre(capitalized, temp_gender)
	. = p_they(capitalized, temp_gender) + "'" + copytext_char(p_are(temp_gender), 2)

/datum/proc/p_s(temp_gender) //is this a descriptive proc name, or what?
	. = "s"

//like clients, which do have gender.
/client/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "они"
	switch(temp_gender)
		if(FEMALE)
			. = usr.client.select_lang("она", "she")
		if(MALE)
			. = usr.client.select_lang("он", "he")
	if(capitalized)
		. = capitalize(.)

/client/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "их"
	switch(temp_gender)
		if(FEMALE)
			. = usr.client.select_lang("свой", "her")
		if(MALE)
			. = usr.client.select_lang("свой", "his")
	if(capitalized)
		. = capitalize(.)

/client/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("их", "them")
	switch(temp_gender)
		if(FEMALE)
			. = usr.client.select_lang("своих", "her")
		if(MALE)
			. = usr.client.select_lang("своих", "him")
	if(capitalized)
		. = capitalize(.)

/client/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("имеет", "has")
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = usr.client.select_lang("имеют", "have")

/client/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("", "is") //is
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = usr.client.select_lang("", "are")

/client/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("был", "was")
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = usr.client.select_lang("были", "were")

/client/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("делает", "does")
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = usr.client.select_lang("делают", "do")

/client/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL && temp_gender != NEUTER)
		. = "s"

//mobs(and atoms but atoms don't really matter write your own proc overrides) also have gender!
/mob/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "it"
	switch(temp_gender)
		if(FEMALE)
			. = usr.client.select_lang("она", "she")
		if(MALE)
			. = usr.client.select_lang("он", "he")
		if(PLURAL)
			. = usr.client.select_lang("это", "they")
	if(capitalized)
		. = capitalize(.)

/mob/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("это", "its")
	switch(temp_gender)
		if(FEMALE)
			. = usr.client.select_lang("её", "her")
		if(MALE)
			. = usr.client.select_lang("его", "his")
		if(PLURAL)
			. = usr.client.select_lang("их", "their")
	if(capitalized)
		. = capitalize(.)

/mob/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "it"
	switch(temp_gender)
		if(FEMALE)
			. = usr.client.select_lang("её", "her")
		if(MALE)
			. = usr.client.select_lang("его", "him")
		if(PLURAL)
			. = usr.client.select_lang("их", "them")
	if(capitalized)
		. = capitalize(.)

/mob/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("имеет", "has")
	if(temp_gender == PLURAL)
		. = usr.client.select_lang("имеют", "have")

/mob/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = usr.client.select_lang("", "is") //is
	if(temp_gender == PLURAL)
		. = usr.client.select_lang("", "are")

/mob/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "was"
	if(temp_gender == PLURAL)
		. = "were"

/mob/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "does"
	if(temp_gender == PLURAL)
		. = "do"

/mob/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL)
		. = "s"

//humans need special handling, because they can have their gender hidden
/mob/living/carbon/human/p_they(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_their(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_them(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_have(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_are(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_were(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_do(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_s(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((slot_w_uniform in obscured) && skipface)
		temp_gender = PLURAL
	return ..()
