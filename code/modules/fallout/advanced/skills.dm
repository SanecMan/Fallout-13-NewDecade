/datum/skills
	var
		small_guns = 1
		big_guns = 1
		barter = 1
		energy_weapons = 1
		explosives = 1
		lockpick = 1
		medicine = 1
		melee_weapons = 1
		repair = 1
		science = 1
		sneak = 1
		speech = 1
		unarmed = 1
	//(1-10)
	//var/datum/browser/popup

	var/mob/living/carbon/human/owner

/datum/skills/proc/skillSuccessChance(var/skill_name)
	var/chance = 100

	var/I = getPoint(skill_name)
	if(!I)
		return chance

	switch(I)
		if(1) chance = 5
		if(2) chance = 10
		if(3) chance = 15
		if(4) chance = 20
		if(5) chance = 25
		if(6) chance = 40
		if(7) chance = 50
		if(8) chance = 60
		if(9) chance = 70
		if(10) chance = 80
	return chance

/datum/skills/proc/skillSpeedMod(var/skill_name, var/duration)
	var/I = getPoint(skill_name)
	if(!I)
		return duration

	switch(I)
		if(1) duration = duration * 4
		if(2) duration = duration * 3
		if(3) duration = round(duration * 2.75)
		if(4) duration = round(duration * 2.50)
		if(5) duration = round(duration * 2.25)
		if(6) duration = duration * 2
		if(7) duration = round(duration * 1.75)
		if(8) duration = round(duration * 1.50)
		if(9) duration = round(duration * 1.25)
	return duration


/datum/skills/proc/reagent(type)
	if(!owner)
		return FALSE

	return owner.reagents.has_reagent(type)

/datum/skills/proc/getMeleeMod()
	return (getPoint("unarmed") * 1.5)

/datum/skills/proc/getPoint(type, base = FALSE)
	switch(type)
		if("small_guns")
			. = small_guns
		if("big_guns")
			. = big_guns
		if("barter")
			. = barter
		if("energy_weapons")
			. = energy_weapons
		if("explosives")
			. = explosives
		if("lockpick")
			. = lockpick
		if("medicine")
			. = medicine
		if("melee_weapons")
			. = melee_weapons
		if("repair")
			. = repair
		if("sneak")
			. = sneak
		if("speech")
			. = speech
		if("unarmed")
			. = unarmed
		if("science")
			. = science
		else
			. = FALSE

/datum/skills/proc/getSpentPoints()
	return small_guns + big_guns + barter + energy_weapons +  explosives + lockpick + medicine + melee_weapons + repair + sneak + speech + unarmed + science

/datum/skills/proc/setPoint(type, value)
	switch(type)
		if("small_guns")
			small_guns = value
		if("big_guns")
			big_guns = value
		if("barter")
			barter = value
		if("energy_weapons")
			energy_weapons = value
		if("explosives")
			explosives = value
		if("lockpick")
			lockpick = value
		if("medicine")
			medicine = value
		if("melee_weapons")
			melee_weapons = value
		if("repair")
			repair = value
		if("sneak")
			sneak = value
		if("speech")
			speech = value
		if("unarmed")
			unarmed = value
		if("science")
			science = value

/datum/skills/proc/getPointDescription(type)
	var/description

	if(usr.client && (usr.client.prefs.chat_toggles & CHAT_LANGUAGE))
		switch(type)
			if("small_guns")
				description = "The use, care and general knowledge of small firearms - pistols, SMGs and rifles."
			if("big_guns")
				description = "The operation and maintenance of really big guns - miniguns, rocket launchers, flamethrowers and such.)"
			if("barter")
				description = "Trading and trade-related tasks. The ability to get better prices for items you sell, and lower prices for items you buy."
			if("energy_weapons")
				description = "The care and feeding of energy-based weapons. How to arm and operate weapons that use laser or plasma technology."
			if("explosives")
				description = "The finding and removal of traps. Also the setting of explosives for demolition purposes."
			if("lockpick")
				description = "The skill of opening locks without the proper key. The use of lockpicks or electronic lockpicks will greatly enhance this skill."
			if("medicine")
				description = "The higher a player's Medicine skill, the more hit points they will replenish when using a stimpak and the more effective they are at using any other medicinal item (such as Rad-X or RadAway)."
			if("melee_weapons")
				description = "Using non-ranged weapons in hand-to-hand or melee combat - knives, sledgehammers, spears, clubs and so on."
			if("repair")
				description = "The practical application of the Science skill, for fixing of broken equipment, machinery and electronics."
			if("sneak")
				description = "Quiet movement, and the ability to remain unnoticed. If successful, you will be much harder to locate. You cannot run and sneak at the same time."
			if("speech")
				description = "The ability to communicate in a practical and efficient manner. The skill of convincing others that your position is correct. The ability to lie and not get caught."
			if("unarmed")
				description = "A combination of martial arts, boxing and other hand-to-hand martial arts. Combat with your hands and feet."
			if("science")
				description = "Covers a variety of high-technology skills, such as computers, biology, physics, and geology."
		return description
	else
		switch(type)
			if("small_guns")
				description = "РћР±С‰РёРµ Р·РЅР°РЅРёСЏ РѕР± РјРµР»РєРѕРј Рё СЃСЂРµРґРЅРµРј РѕСЂСѓР¶РёРё Рё РµРіРѕ РѕР±СЃР»СѓР¶РёРІР°РЅРёРё - РїРёСЃС‚РѕР»РµС‚С‹, РџРџ Рё РІРёРЅС‚РѕРІРєРё."
			if("big_guns")
				description = "РћР±С‰РёРµ Р·РЅР°РЅРёСЏ РѕР± РєСЂСѓРїРЅРѕРј РѕСЂСѓР¶РёРё Рё РµРіРѕ РѕР±СЃР»СѓР¶РёРІР°РЅРёРё - РјРёРЅРёРіР°РЅС‹, СЂР°РєРµС‚РЅРёС†С‹, РѕРіРЅРµРјС‘С‚С‹."
			if("barter")
				description = "РўРѕСЂРІРіР»СЏ. Р’РѕР·РјРѕР¶РЅРѕСЃС‚СЊ РґРѕРіРѕРІР°СЂРёРІР°С‚СЊСЃСЏ, СЃРЅРёР¶Р°СЏ С†РµРЅСѓ Сѓ С‚РѕСЂРіРѕРІС†РµРІ."
			if("energy_weapons")
				description = "РћР±С‰РёРµ Р·РЅР°РЅРёСЏ РѕР± СЌРЅРµСЂРіРёС‚РёС‡РµСЃРєРѕРј РѕСЂСѓР¶РёРё Рё РµРіРѕ РѕР±СЃР»СѓР¶РёРІР°РЅРёРё - Р»Р°Р·РµСЂРЅРѕРµ Рё РїР»Р°Р·РјРµРЅРЅРѕРµ."
			if("explosives")
				description = "РЎРїРѕСЃРѕР±РЅРѕСЃС‚СЊ Р·Р°РјРµС‡Р°С‚СЊ Р»РѕРІСѓС€РєРё Рё РІР·СЂС‹РІС‡Р°С‚РєСѓ. Рђ С‚Р°Рє-Р¶Рµ Р·РЅР°РЅРёСЏ Рѕ С‚РѕРј, РєР°Рє СЌС‚РѕР№ РІР·СЂС‹РІС‡Р°С‚РєРѕР№ РїРѕР»СЊР·РѕРІР°С‚СЊСЃСЏ."
			if("lockpick")
				description = "РЎРїРѕСЃРѕР±РЅРѕСЃС‚СЊ РІР·Р»Р°РјС‹РІР°С‚СЊ РґРІРµСЂРё Рё РЅРµ С‚РѕР»СЊРєРѕ. РћС‚РјС‹С‡РєРё, С…РѕСЂРѕС€Рѕ РґРѕРїРѕР»РЅСЏСЋС‚ СЌС‚Рѕ СѓРјРµРЅРёРµ."
			if("medicine")
				description = "Р§РµРј РІС‹С€Рµ СЌС‚РѕС‚ РЅР°РІС‹Рє, С‚РµРј Р±РѕР»СЊС€Рµ РѕС‡РєРѕРІ Р·РґРѕСЂРѕРІСЊСЏ РІС‹ РїРѕР»СѓС‡РёС‚Рµ РїСЂРё РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРё СЃС‚РёРјСѓР»СЏС‚РѕСЂРѕРІ, РђРЅС‚РёР Р°РґРёРЅР° РёР»Рё Р Р°РґРРєСЃ."
			if("melee_weapons")
				description = "РћР±С‰РёРµ Р·РЅР°РЅРёСЏ РѕР± РѕСЂСѓР¶РёРё Р±Р»РёР¶РЅРµРіРѕ Р±РѕСЏ - РЅРѕР¶Рё, Р±РёС‚С‹, С‚СЂСѓР±С‹ Рё РїСЂРѕС‡РµРµ."
			if("repair")
				description = "РџСЂР°РєС‚РёС‡РµСЃРєРѕРµ РІРѕРїР»РѕС‰РµРЅРёРµ РќР°СѓРєРё, СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ СЂРµРјРѕРЅС‚РёСЂРѕРІР°С‚СЊ РІРµС‰Рё, СЌР»РµРµРєС‚СЂРѕРЅРёРєСѓ Рё.С‚.Рї."
			if("sneak")
				description = "РЎРїРѕСЃРѕР±РЅРѕСЃС‚СЊ РЅРµР·Р°РјРµС‚РЅРѕ РїРµСЂРµРґРІРёРіР°С‚СЊСЃСЏ, РѕС‡РµРЅСЊ РІР°Р¶РЅР° РµСЃР»Рё РІС‹ РїР»РѕС…Рѕ СЃСЂР°Р¶Р°РµС‚РµСЃСЊ."
			if("speech")
				description = "РЈРјРµРЅРёРµ РІРµСЃС‚Рё РґРёР°Р»РѕРі, РѕРґРЅРѕ РёР· Р»СѓС‡С€РёС… СѓРјРµРЅРёР№ РґР»СЏ РІС‹Р¶РёРІР°РЅРёСЏ РЅР° РїСѓСЃС‚РѕС€Рё."
			if("unarmed")
				description = "РћР±С‰РёРµ Р·РЅР°РЅРёСЏ Рѕ С‚РѕРј, РєР°Рє РґСЂР°С‚СЊСЃСЏ РЅРµ РёРјРµСЏ РЅРёС‡РµРіРѕ РїРѕРґ СЂСѓРєРѕР№."
			if("science")
				description = "Р‘Р»Р°РіРѕРґР°СЂСЏ СЌС‚РѕРјСѓ, РѕРїСЂРµРґРµР»СЏСЋС‚СЃСЏ РІР°С€Рё РїРѕР·РЅР°РЅРёСЏ РІ С„РёР·РёРєРµ, Р±РёРѕР»РѕРіРёРё Рё РїСЂРѕС‡РёС… РЅР°СѓРєР°С…."
		return description

/*
/datum/skills/proc/ui(type)
	if(popup)
		popup.close()

	var/html

	switch(type)
		if("list")
			html += "<a href='byond://?src=\ref[src];skills=small_guns'>small guns</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=big_guns'>big guns</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=barter'>barter</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=energy_weapons'>energy weapons</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=explosives'>explosives</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=lockpick'>lockpick</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=medicine'>medicine</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=melee_weapons'>melee weapons</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=repair'>repair</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=sneak'>sneak</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=speech'>speech</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=unarmed'>unarmed</a> <br>"
			html += "<a href='byond://?src=\ref[src];skills=science'>science</a> <br>"
			html += "<br><a href='byond://?src=\ref[src];apply=1'>Apply</a> <br>"
		else
			usr.browse_rsc_icon("icons/special/special.dmi", "skills_[type]")
			html += "<img src='skills_[type].png' class='center'> <br>"
			html += getPointDescription(type)
			var/current = getPoint(type, TRUE)
			var/left = max(0, SKILLS_POINTS - getSpentPoints())

			html += "<br>пїЅпїЅпїЅпїЅпїЅпїЅ/Current: [current] (пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ/left [left])<br>"

			if((current > 1))
				html += "<a href='byond://?src=\ref[src];dec=[type]'>пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ/Reduce</a>"

			if((left > 0) & (current < 10))
				html += "<a href='byond://?src=\ref[src];inc=[type]'>пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ/Increace</a>"

			html += "<br><a href='byond://?src=\ref[src];back=1'>пїЅпїЅпїЅпїЅпїЅ/Back</a> <br>"

	popup.set_content(html)
	popup.open()

/datum/skills/Topic(href, href_list)
	if(..())
		return

	if(href_list["apply"])
		var/mob/living/carbon/human/user = usr

		if(getSpentPoints() != SKILLS_POINTS)
			to_chat(usr, "<span class='warning'>пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅ!</span>")
			return

		user.skills = src

		popup.close()

	if(href_list["skills"])
		var/type = href_list["skills"]
		ui(type)

	if(href_list["back"])
		ui("list")

	if(href_list["inc"])
		var/type = href_list["inc"]
		var/newPoints = getPoint(type, TRUE) + 1
		if(newPoints <= 10)
			setPoint(type, newPoints)
		ui(type)

	if(href_list["dec"])
		var/type = href_list["dec"]
		var/newPoints = getPoint(type, TRUE) - 1
		if(newPoints > 0)
			setPoint(type, newPoints)
		ui(type)
*/