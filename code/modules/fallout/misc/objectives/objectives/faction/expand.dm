//Fallout 13 - Veni, vidi, vici

/datum/f13_objective/expand
	name = "Подчиняй и Властвуй"
	desc = "Ваша фракция должна насчитывать следующее количество членов, до самого конца игры: %target_size%."
	points = 0
	kind = FACTION
	available_factions = list("city", "raiders")

	assignto_faction(var/datum/f13_faction/F, var/list/data = list())
		data["target_size"] = F.members.len + round(max(5, F.members.len * rand(1.5,2.5)))
		..()

	check_complete(var/datum/objective_holder/holder)
		var/datum/f13_faction/faction = holder.owner
		if(faction.members.len < holder.data["target_size"])
			return 0
		return 1