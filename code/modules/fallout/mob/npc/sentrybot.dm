//Fallout 13 protectron directory

/mob/living/simple_animal/hostile/sentrybot
	name = "Робот-Охранник"
	desc = "Довоенный Робот-Охранник.<br>Очень грозная машина."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "sentrybot"
	icon_living = "sentrybot"
	icon_dead = "sentrybot_d"
	icon_gib = "sentrybot_d"
	speak_chance = 0
	turns_per_move = 8
	environment_smash = 0
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "бьет"
	move_to_delay = 2
	stat_attack = 1
	robust_searching = 1
	maxHealth = 1000
	health = 1000
	self_weight = 400
	healable = 0

	faction = list("hostile", "robot")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/sentrybot/idle_1.ogg','sound/f13npc/sentrybot/idle_2.ogg','sound/f13npc/sentrybot/idle_3.ogg','sound/f13npc/sentrybot/idle_4.ogg')

	aggro_sound_chance = 50
	aggro_sound = list('sound/f13npc/sentrybot/attack_1.ogg', 'sound/f13npc/sentrybot/attack_2.ogg', 'sound/f13npc/sentrybot/attack_3.ogg', 'sound/f13npc/sentrybot/attack_4.ogg', 'sound/f13npc/sentrybot/attack_5.ogg', 'sound/f13npc/sentrybot/attack_6.ogg', 'sound/f13npc/sentrybot/attack_7.ogg', 'sound/f13npc/sentrybot/attack_8.ogg', 'sound/f13npc/sentrybot/attack_9.ogg', 'sound/f13npc/sentrybot/attack_10.ogg', 'sound/f13npc/sentrybot/attack_11.ogg', 'sound/f13npc/sentrybot/attack_12.ogg')

	death_sound = list('sound/f13npc/sentrybot/death_1.ogg', 'sound/f13npc/sentrybot/death_2.ogg', 'sound/f13npc/sentrybot/death_3.ogg', 'sound/f13npc/sentrybot/death_4.ogg', 'sound/f13npc/sentrybot/death_5.ogg', 'sound/f13npc/sentrybot/death_6.ogg')

	harm_intent_damage = 15
	melee_damage_lower = 30
	melee_damage_upper = 35
	minimum_distance = 2
	retreat_distance = 4
	attacktext = "бьет"
	attack_sound = "punch"
	a_intent = "harm"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	status_flags = CANPUSH
	vision_range = 12
	aggro_vision_range = 15
	idle_vision_range = 7
	ranged = 1
	rapid = 1
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/weapons/resonator_fire.ogg'

	XP = 55