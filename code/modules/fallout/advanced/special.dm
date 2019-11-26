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
			description = "Грубая физическая сила. Оказывает влияние на грузоподъёмность и урон оружия ближнего боя, так же незначительно влияет на тяжелое оружие. Raw physical strength. A high Strength is good for physical characters (Modifies: Melee Damage, and Carry Weight, also slightly improve big guns skills)."
		if("p")
			description = "Способность видеть, слышать, вынюхивать и замечать необычные вещи. Высокий показатель восприятия важен для снайперов. Влияет на шанс попадания и лут с мобов, так же незначительно влияет на энергетическое оружие. The ability to see, hear, taste and notice unusual things. A high Perception is important for a sharpshooter. (Modifies: Ranged combat, looting from mobs, also slightly improve energy guns skills.)"
		if("e")
			description = "Выдержка и физическая стойкость. Влияет на количество здоровья. Stamina and physical toughness. A character with a high Endurance will survive where others may not. (Modifies: Hit Points)"
		if("c")
			description = "Определяет цены при торговле. A combination of appearance and charm. A high Charisma is important for characters that want to influence people with words. (Modifies: Trading skills with autotraders)"
		if("i")
			description = "Влияет на длительность использования медикаментов и химикатов, количество получаемого опыта. Knowledge, wisdom and the ability to think quickly. A high Intelligence is important for any character. (Modifies: The number of exp getting from all actions, medical skills)"
		if("a")
			description = "Влияет на скорость стрельбы оружия, уклонение, так же незначительно влияет на легкое оружие. Coordination and the ability to move well. A high Agility is important for any active character. (Modifies: Rate of fire of ranged weapons, evasion, also slightly improve small guns skills)"
		if("l")
			description = "Влияет на шанс попадания по Вам, качество вещей в мобах. Fate. Karma. An extremely high or low Luck will affect the character - somehow. Events and situations will be changed by how lucky (or unlucky) your character is. (Modifies: Evasion, looting from mobs.)"

	return description
