/mob/living/simple_animal/hostile/ghoul/scorched
	name = "Горелый"
	desc = "В дополнение к сморщенной, обгоревшей коже, типичной для гулей, горелые обладают зелеными ультрацитовыми наростами по всему телу, пронизывающими их кожу нерегулярными узорами. Причины образования и предназначение этих ростков неизвестны, но, согласно предварительным исследованиям на местах, проводимым смотрительницей Убежища 76, горелые — это бывшие люди, которые заразились «чумой горелых», распространяемой зверожогами.."
	eng_name = "scorched"
	eng_desc = "It's like ghoul, but... not ghoul. What is this?"
	icon = 'icons/fallout/mobs/scorched.dmi'
	icon_state = "scorched_m-1"
	icon_living = "scorched_m-1"
	icon_dead = "scorched_m_d"
	icon_gib = "gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "hits"
	eng_attacktext = "sliced"
	attacktext = "режет"
	move_to_delay = 4
	respawn_time_of_mob = 500000000 //Stalkeros: Чё так много? // iWuna: Надо.
	maxHealth = 80
	health = 80
	self_weight = 45

	faction = list("hostile", "scorched")

	sound_speak_chance = 1
	sound_speak = list('sound/f13npc/scor_br1.ogg','sound/f13npc/scor_b2.ogg','sound/f13npc/scor_b3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = list('sound/f13npc/scor_d1.ogg','sound/f13npc/scor_d2.ogg','sound/f13npc/scor_d3.ogg','sound/f13npc/scor_d4.ogg','sound/f13npc/scor_d5.ogg')

	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	idle_vision_range = 7
	attack_sound = "punch"
	XP = 10

/mob/living/simple_animal/hostile/ghoul/scorched/New()
	icon_state = "scorched_m-[rand(1,5)]"
	icon_living = "scorched_m-[rand(1,5)]"


/mob/living/simple_animal/hostile/ghoul/scorched/ranged
	name = "Горелый"
	desc = "В дополнение к сморщенной, обгоревшей коже, типичной для гулей, горелые обладают зелеными ультрацитовыми наростами по всему телу, пронизывающими их кожу нерегулярными узорами. Причины образования и предназначение этих ростков неизвестны, но, согласно предварительным исследованиям на местах, проводимым смотрительницей Убежища 76, горелые — это бывшие люди, которые заразились «чумой горелых», распространяемой зверожогами.."
	eng_name = "scorched"
	eng_desc = "It's like ghoul, but now ghoul. Oh wait, it's... rifle?"
	icon = 'icons/fallout/mobs/scorched.dmi'
	icon_state = "scorched_r-1"
	icon_living = "scorched_r-1"
	icon_dead = "scorched_r_d"
	icon_gib = "gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "бьёт"
	move_to_delay = 4
	maxHealth = 80
	health = 80
	self_weight = 45
	ranged = 1
	ranged_cooldown_time = 200
	projectiletype = /obj/item/projectile/bullet/F13/c308mmBullet
	projectilesound = 'sound/weapons/garandshot.ogg'
	casingtype = /obj/item/ammo_casing/F13/m308

	faction = list("scorched", "hostile")

	sound_speak_chance = 1
	sound_speak = list('sound/f13npc/scor_br1.ogg','sound/f13npc/scor_b2.ogg','sound/f13npc/scor_b3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = list('sound/f13npc/scor_d1.ogg','sound/f13npc/scor_d2.ogg','sound/f13npc/scor_d3.ogg','sound/f13npc/scor_d4.ogg','sound/f13npc/scor_d5.ogg')

	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "царапает"
	eng_attacktext = "hits"
	attack_sound = "punch"
	XP = 15

/mob/living/simple_animal/hostile/ghoul/scorched/ranged/New()
	icon_state = "scorched_r-[rand(1,5)]"
	icon_living = "scorched_r-[rand(1,5)]"