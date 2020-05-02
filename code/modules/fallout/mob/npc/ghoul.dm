//Fallout 13 npc ghouls directory

/mob/living/simple_animal/hostile/ghoul
	name = "Дикий гуль"
	desc = "Вы видели когда-нибудь живого гуля?<br>Гули, это практически мертвые люди, гниющие и плохо пахнущие, прямо как зомби."
	eng_name = "feral ghoul"
	eng_desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/fallout/mobs/ghoul.dmi'
	icon_state = "retro_ghoul-1"
	icon_living = "retro_ghoul-1"
	icon_dead = "retro_ghoul_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 4
	respawn_time_of_mob = 500000000
	maxHealth = 150
	health = 150
	self_weight = 45

	faction = list("hostile", "ghoul")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 10
	armour_penetration = 10
	melee_damage_upper = 35
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "царапает"
	eng_attacktext = "scratches"
	attack_sound = "punch"

	XP = 7

/mob/living/simple_animal/hostile/ghoul/death(gibbed)
	if(murder)
		if(istype(murder, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = murder
			if(H.dna.species)
				if(H.dna.species.type == /datum/species/ghoul)
					H.faction -= "ghoul"

	..()

/mob/living/simple_animal/hostile/ghoul/Life()
	. = ..()
	if(!.)
		if(prob(0.1))
			visible_message("<span class='notice'>Тело [src] разлагается!</span>")
			gib(FALSE, FALSE, FALSE, TRUE)

/mob/living/simple_animal/hostile/ghoul/New()
	..()
	icon_state = "retro_ghoul-[rand(1,5)]"
	icon_living = "retro_ghoul-[rand(1,5)]"

/mob/living/simple_animal/hostile/ghoul/aggressive
	name = "Дикий гуль"
	desc = "Вы видели когда-нибудь голодного гуля?<br>Аналогично другим диким гулям, этот более агрессивен и уверенен в том, что ты являешься отличной едой. <br> У него отсутствует левая рука."
	eng_name = "feral ghoul"
	eng_desc = "Have you ever seen a hungry ghoul before?<br>Similar to other feral ghouls, it's more aggressive and confident about the fact that you are the best food around.<br>It is missing a left arm."
	icon_state = "angry_ghoul-1"
	icon_living = "angry_ghoul"
	icon_dead = "angry_ghoul_d"
	icon_gib = "gib"
	maxHealth = 80
	health = 80
	melee_damage_lower = 15
	melee_damage_upper = 25
	aggro_vision_range = 15
	idle_vision_range = 10
	attacktext = "жует"
	eng_attacktext = "chomps"

/mob/living/simple_animal/hostile/ghoul/aggressive/New()
	..()
	icon_state = "angry_ghoul-[rand(1,5)]"
	icon_living = "angry_ghoul-[rand(1,5)]"

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "Светящийся гуль"
	desc = "Вы видели когда-нибудь светящегося гуля??<br>Светящиеся гули, это практически мёртвые люди, гниющие и плохо пахнущие, прямо как зомби, и настолько облучённые что стали светиться в темноте."
	eng_name = "glowing ghoul"
	eng_desc = "Have you ever seen a glowing ghoul before?<br>Glowing ghouls are necrotic post-humans - rotting, zombie-like mutants, who are so irradiated they actually glow in the dark."
	icon_state = "retro_glowghoul-1"
	icon_living = "retro_glowghoul-1"
	icon_dead = "retro_glowghoul_d"
	icon_gib = "gib"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 25
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 2

/mob/living/simple_animal/hostile/ghoul/glowing/New()
	..()
	icon_state = "retro_glowghoul-[rand(1,5)]"
	icon_living = "retro_glowghoul-[rand(1,5)]"
	SSradiation.processing += src

/mob/living/simple_animal/hostile/ghoul/soldier
	name = "Дикий гуль-солдат"
	eng_name = "armored feral soldier ghoul"
	icon_state = "soldier_ghoul-1"
	icon_living = "soldier_ghoul-1"
	icon_dead = "soldier_ghoul_d"
	icon_gib = "gib"
	maxHealth = 90
	health = 90

/mob/living/simple_animal/hostile/ghoul/soldier/New()
	..()
	icon_state = "soldier_ghoul-[rand(1,5)]"
	icon_living = "soldier_ghoul-[rand(1,5)]"

/mob/living/simple_animal/hostile/ghoul/soldier/armored
	name = "Бронированный дикий гуль-солдат"
	eng_name = "armored feral soldier ghoul"
	icon_state = "soldier_ghoul_a-1"
	icon_living = "soldier_ghoul_a-1"
	icon_dead = "soldier_ghoul_a_d"
	icon_gib = "gib"
	maxHealth = 100
	health = 100

/mob/living/simple_animal/hostile/ghoul/soldier/armored/New()
	..()
	icon_state = "soldier_ghoul_a-[rand(1,5)]"
	icon_living = "soldier_ghoul_a-[rand(1,5)]"