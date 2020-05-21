//Fallout 13 - I am a soldier and I'm marching on, I am a warrior and this is my song

/datum/f13_objective/join
	name = "Мечта всей жизни"
	desc = "С самого своего детства, вы мечтали примкнуть к %faction_name% для борьбы за лучшее будущее. И наконец, вы решились на это.<br>Найдите лидеров %faction_name% и вступите в их группировку!"
	points = 0
	kind = INDIVIDUAL

	check_mob(mob/living/carbon/human/H)
		var/faction = H.social_faction
		if(faction == "city" || faction == "raiders" || faction == "neutral")
			return 1
		return 0

	assignto_mind(datum/mind/M, var/list/data = list())
		var/mob/living/mob = M.current
		var/list/factions = shuffle(human_factions)
		for(var/f_name in factions)
			if(f_name == "none")
				continue
			var/datum/f13_faction/target = human_factions[f_name]
			if(target.id != mob.social_faction)
				data["target_faction"] = target.id
				data["faction_name"] = target.full_name
				break
		..()

	check_complete(var/datum/objective_holder/holder)
		var/datum/mind/mind = holder.owner
		var/mob/living/mob = mind.current
		if(mob.social_faction != holder.data["target_faction"])
			return 0
		return 1