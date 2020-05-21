//Fallout 13 Centaur directory

/mob/living/simple_animal/hostile/centaur
	name = "кентавр"
	desc = "Кентавры, как ни странно, это мутанты. Они, это результат Вируса Рукотворной Эволюции."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "centaur"
	icon_living = "centaur"
	icon_gib = "centaur_g"
	speak_chance = 0
	speak_emote = list("gnashes")
	turns_per_move = 4
	butcher_results = list()
	response_help = "pokes"
	response_disarm = "punches"
	response_harm = "hits"
	emote_taunt = list("gnashes")
	taunt_chance = 30
	move_to_delay = 2
	maxHealth = 120
	health = 120
	environment_smash = 1
	force_threshold = 10
	melee_damage_lower = 5
	armour_penetration = 25
	melee_damage_upper = 25
	aggro_vision_range = 8
	see_in_dark = 8
	idle_vision_range = 7
	self_weight = 60
	faction = list("hostile", "centaur")
	sound_speak = list('sound/f13npc/Npc_centaur_chasevox_02.ogg','sound/f13npc/Npc_centaur_conscious_lp.ogg','sound/f13npc/Npc_centaur_idle_scan.ogg','sound/f13npc/Npc_centaur_walkbreath_01.ogg')
	sound_speak_chance = 5

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/Npc_centaur_attack_01.ogg'

	death_sound = 'sound/f13npc/Npc_centaur_death_01.ogg'

	damage_coeff = list(BRUTE = 0.6, BURN = 1, TOX = 0.2, CLONE = 0, STAMINA = 1, OXY = 0)
	attacktext = "кусает"
	attack_sound = 'sound/f13npc/Npc_centaur_attackspit_03.ogg'

	XP = 15

/mob/living/simple_animal/hostile/centaur/New()
	icon_state = pick("centaur", "centaur2")
	icon_living = pick("centaur", "centaur2")

/mob/living/simple_animal/hostile/centaur/death(gibbed)
	icon_dead = pick("centaur_d", "centaur_d2")
	..()