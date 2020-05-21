//Fallout 13 npc ghouls directory

/mob/living/simple_animal/hostile/ghost_man
	name = "призрак"
	desc = "Существо в химзащитном костюме, из глаз идет зеленоватое свечение."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "ghost_man"
	icon_living = "ghost_man"
	icon_dead = "ghost_man_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 10
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 6
	respawn_time_of_mob = 500000000
	maxHealth = 250
	health = 250
	self_weight = 45

	faction = list("hostile", "ghost")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghost.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghost.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 25
	melee_damage_upper = 35
	aggro_vision_range = 10
	idle_vision_range = 5
	attacktext = "царапает"
	attack_sound = "punch"
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 1
	check_friendly_fire = 1
	del_on_death = 1
	loot = list(/obj/effect/mine/ghost_man)
	XP = 5

/mob/living/simple_animal/hostile/ghost_man_bear_trap
	name = "Призрак-охотник"
	desc = "Если видише медвежий капкан, значит, призраки неподалёку."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "ghost_man_bear_trap"
	icon_living = "ghost_man_bear_trap"
	icon_dead = "ghost_man_bear_trap_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 8
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 5
	respawn_time_of_mob = 500000000
	maxHealth = 350
	health =350
	self_weight = 55

	faction = list("hostile", "ghost")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghost.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghost.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 25
	melee_damage_upper = 45
	aggro_vision_range = 10
	idle_vision_range = 5
	attacktext = "царапает"
	attack_sound = "punch"
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 1
	check_friendly_fire = 1
	del_on_death = 1
	loot = list(/obj/effect/mine/ghost_man, /obj/item/weapon/beartrapfist)
	XP = 5

/mob/living/simple_animal/hostile/ghost_man_spear
	name = "Призрак-жнец"
	desc = "Призраки-жнецы - самый распространённый вид людей-призраков. Они наименьшие в своём роде и легко различимы по своим капюшонам и меньшим противогазам."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "ghost_man_spear"
	icon_living = "ghost_man_spear"
	icon_dead = "ghost_man_spear_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 7
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 5
	respawn_time_of_mob = 500000000
	maxHealth = 250
	health =250
	self_weight = 55

	retreat_distance = 4
	minimum_distance = 4
	ranged = 1
	rapid = 0
	projectiletype = /obj/item/projectile/bullet/F13/spear
	projectilesound = 'sound/f13weapons/throw.ogg'

	faction = list("hostile", "ghost")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghost.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghost.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 20
	melee_damage_upper = 35
	aggro_vision_range = 10
	idle_vision_range = 5
	attacktext = "царапает"
	attack_sound = "punch"
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 1
	check_friendly_fire = 1
	del_on_death = 1
	loot = list(/obj/effect/mine/ghost_man, /obj/item/stack/spear)
	XP = 10