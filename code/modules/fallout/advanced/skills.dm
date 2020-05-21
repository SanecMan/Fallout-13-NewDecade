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
	switch(type)
		if("small_guns")
			description = "Общие знания об мелком и среднем оружии и его обслуживании - пистолеты, ПП и винтовки."
		if("big_guns")
			description = "Общие знания об крупном оружии и его обслуживании - миниганы, ракетницы, огнемёты."
		if("barter")
			description = "Торвгля. Возможность договариваться, снижая цену у торговцев."
		if("energy_weapons")
			description = "Общие знания об энергитическом оружии и его обслуживании - лазерное и плазменное."
		if("explosives")
			description = "Способность замечать ловушки и взрывчатку. А так-же знания о том, как этой взрывчаткой пользоваться."
		if("lockpick")
			description = "Способность взламывать двери и не только. Отмычки, хорошо дополняют это умение."
		if("medicine")
			description = "Чем выше этот навык, тем больше очков здоровья вы получите при использовании стимуляторов, АнтиРадина или РадИкс."
		if("melee_weapons")
			description = "Общие знания об оружии ближнего боя - ножи, биты, трубы и прочее."
		if("repair")
			description = "Практическое воплощение Науки, способность ремонтировать вещи, элеектронику и.т.п."
		if("sneak")
			description = "Способность незаметно передвигаться, очень важна если вы плохо сражаетесь."
		if("speech")
			description = "Умение вести диалог, одно из лучших умений для выживания на пустоши."
		if("unarmed")
			description = "Общие знания о том, как драться не имея ничего под рукой."
		if("science")
			description = "Благодаря этому, определяются ваши познания в физике, биологии и прочих науках."
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