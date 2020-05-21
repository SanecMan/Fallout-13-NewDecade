/datum/special
	var/strength = 1
	var/perception = 1
	var/endurance = 1
	var/charisma = 1
	var/intelligence = 1
	var/agility = 1
	var/luck = 1
	var/mob/living/carbon/human/owner

/datum/special/proc/reagent(type)
	if(!owner)
		return FALSE

	return owner.reagents.has_reagent(type)

/datum/special/proc/getMeleeMod()
	return (0.7 + (getPoint("s") * 0.10))

/datum/special/proc/getWeight(var/mob/living/carbon/human/user)
	if(!user)
		return 0

	. = 0
	if (user:dna.species && user:dna.species.id=="supermutant")
		. += 50

	if (user:dna.species && user:dna.species.id=="ghoul")
		. -= 15

	if(user.perks.have(/datum/perk/strongback))
		. += 20

	if(istype(user.wear_suit, /obj/item/clothing/suit/armor/f13/power_armor))
		. += 10 + getPoint("s") * 5 + 20

	. += 10 + getPoint("s") * 5

	return .

/datum/special/proc/getPointBonus(type)
	. = 0
	switch(type)
		if("s")
			. = (reagent("jet") ? 3 : 0) + (reagent("psyho") ? 2 : 0)
		if("p")
			. = 0
		if("e")
			. = (reagent("psyho") ? 3 : 0)
		if("c")
			. = 0
		if("i")
			. = (reagent("mentats") ? 4 : 0)
		if("a")
			. = (reagent("turbo") ? 4 : 0)
		if("l")
			. = 0

/datum/special/proc/getPoint(type, base = FALSE)
	switch(type)
		if("s")
			. = strength
		if("p")
			. = perception
		if("e")
			. = endurance
		if("c")
			. = charisma
		if("i")
			. = intelligence
		if("a")
			. = agility
		if("l")
			. = luck
		else
			. = 14

	if(!base)
		. += getPointBonus(type)

/datum/special/proc/getSpentPoints()
	var/i = strength + perception + endurance + charisma
	i += intelligence + agility + luck
	return i

/datum/special/proc/setPoint(type, value)
	switch(type)
		if("s")
			strength = value
		if("p")
			perception = value
		if("e")
			endurance = value
		if("c")
			charisma = value
		if("i")
			intelligence = value
		if("a")
			agility = value
		if("l")
			luck = value

/datum/special/proc/getPointDescription(type)
	var/description
	switch(type)
		if("s")
			description = "Грубая физическая сила. Оказывает влияние на грузоподъёмность и урон оружия ближнего боя, так же незначительно влияет на тяжелое оружие.  (Улучшает: Урон в ближнем бою, переносимый вес и немного владение оружием)."
		if("p")
			description = "Способность видеть, слышать, вынюхивать и замечать необычные вещи. Высокий показатель восприятия важен для снайперов. Влияет на шанс попадания и лут с мобов, так же незначительно влияет на энергетическое оружие.  (Улучшает: Огнестрельные навыки, лут с мобов, и немного улучшает навык владения энергооружием.)"
		if("e")
			description = "Выдержка и физическая стойкость. Влияет на количество здоровья. (Улучшает: Здоровье)"
		if("c")
			description = "Определяет цены при торговле. A combination of appearance and charm. (Улучшает: Торговый навык с автотрейдерами)"
		if("i")
			description = "Влияет на длительность использования медикаментов и химикатов, количество получаемого опыта. (Улучшает: Количество получаемого опыта и медицину)"
		if("a")
			description = "Влияет на скорость стрельбы оружия, уклонение, так же незначительно влияет на легкое оружие. (Улучшает: Темп стрельбы, шанс уворота от огня и немного владение оружием)"
		if("l")
			description = "Влияет на шанс попадания по Вам, качество вещей в мобах. (Улучшает: Лут с мобов и шанс уворота.)"
	return description
