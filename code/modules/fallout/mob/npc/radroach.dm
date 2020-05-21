//Fallout 13 radroach directory

/mob/living/simple_animal/hostile/radroach
	name = "Радтаракан"
	desc = "Огромный Американский Таракан, но в основном их все просто называют тараканами-переростками, довоенный вид животного, подвершегося мутации."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "radroach"
	icon_living = "radroach"
	icon_dead = "radroach_d"
	icon_gib = "radroach_g"
	speak_chance = 0
	turns_per_move = 5
	response_help = "тыкает"
	response_disarm = "пихает"
	response_harm = "пинает"
	environment_smash = 0
	respawn_time_of_mob = 150000000
	move_to_delay = 2
	maxHealth = 45
	health = 45
	//pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	//mob_size = MOB_SIZE_TINY
	self_weight = 15
	//density = 0

	faction = list("hostile", "radroach")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/roach_charge1.ogg','sound/f13npc/roach_charge2.ogg','sound/f13npc/roach_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/roach_alert.ogg'

	death_sound = 'sound/f13npc/roach_death.ogg'

	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "кусает"
	attack_sound = 'sound/weapons/bite.ogg'
	aggro_vision_range = 10
	idle_vision_range = 5

	XP = 2

/mob/living/simple_animal/hostile/radroach/radioactive
	name = "Радиоактивный-Радтаракан"
	desc = "Огромный Американский Радиоактивный Таракан, но в основном их все просто называют тараканами-переростками, довоенный вид животного, подвершегося мутации. Этот еще и светится."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "glowingroach"
	icon_living = "glowingroach"
	icon_dead = "glowingroach_dead"
	icon_gib = "radroach_g"
	speak_chance = 0
	turns_per_move = 5
	response_help = "тыкает"
	response_disarm = "пихает"
	response_harm = "пинает"
	environment_smash = 0
	respawn_time_of_mob = 150000000
	move_to_delay = 2
	maxHealth = 55
	health = 55
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 1

/mob/living/simple_animal/hostile/radroach/radioactive/New()
	..()
	SSradiation.processing += src

/mob/living/simple_animal/hostile/radroach/radioactive/legendary
	name = "Легендарный Радтаракан"
	desc = "Огромный радтаракан излучающий радиацию! Этот явно сильнее своих сородией."
	icon_state = "radroach_radioactive_boss"
	icon_living = "radroach_radioactive_boss"
	icon_dead = "radroach_radioactive_boss_d"
	maxHealth = 100
	health = 100
	light_power = 2
	light_range = 2
