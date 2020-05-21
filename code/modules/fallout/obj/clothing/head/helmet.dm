//Fallout 13 protective helmets directory

/obj/item/clothing/head/helmet/f13
	icon = 'icons/fallout/clothing/hats.dmi'

/obj/item/clothing/head/helmet/f13/ssthelmet
	name = "M.I combat helmet"
	desc = "A pre-War ballistic assembly, designed to provide moderate protection in combat.<br>Overtime the model became significantly less effective, and was replaced with reinforced combat helmet mark I."
	icon_state = "ssthelmet"
	item_state = "marine"
	armor = list(melee = 40, bullet = 45, laser = 25, energy = 15, bomb = 30, bio = 0, rad = 0, fire = 30, acid = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 20
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 3

/obj/item/clothing/head/helmet/f13/broken
	name = "broken power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it has ceased its primary function of protecting the wearer from harm.<br>It can still provide some very basic protection."
	icon_state = "broken"
	item_state = "broken"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 25, bullet = 15, laser = 5, energy = 0, bomb = 10, bio = 0, rad = 10, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 20
	self_weight = 5
	price = 3500

/obj/item/clothing/head/helmet/f13/tribal
	name = "tribal power helmet"
	desc = "This power armor helmet was salvaged by savages from the battlefield.<br>They believe that these helmets capture the spirits of their fallen wearers, so they painted some runes on to give it a more sacred meaning."
	icon_state = "tribal"
	item_state = "tribal"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 45, bullet = 35, laser = 20, energy = 10, bomb = 10, bio = 0, rad = 10, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 30
	self_weight = 10

/obj/item/clothing/head/helmet/f13/motorcycle
	name = "motorcycle helmet"
	desc = "A type of helmet used by motorcycle riders.<br>The primary goal of a motorcycle helmet is motorcycle safety - to protect the rider's head during impact, thus preventing or reducing head injury and saving the rider's life."
	icon_state = "motorcycle"
	item_state = "motorcycle"
	flags = HEADCOVERSEYES
	armor = list(melee = 25, bullet = 15, laser = 10, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 10
	self_weight = 1.5
	price = 1200

/obj/item/clothing/head/helmet/f13/firefighter
	name = "firefighter helmet"
	desc = "A firefighter's helmet worn on top of a fire-retardant covering and broken gas mask.<br>It smells heavily of sweat."
	icon_state = "firefighter"
	item_state = "firefighter"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 15, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 90, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	put_on_delay = 10
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 1.5
	price = 1150

/obj/item/clothing/head/helmet/f13/supaflyhelmet
	name = "supa-fly raider helmet"
	desc = "A makeshift raider helmet, made of leather.<br>It smells heavily of chems and sweat."
	icon_state = "supafly"
	item_state = "supafly"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 20
	self_weight = 1
	price = 400

/obj/item/clothing/head/helmet/f13/yankee
	name = "yankee raider helmet"
	desc = "A long time ago, this belonged to a football player, now it belongs to the wasteland."
	icon_state = "yankee"
	item_state = "yankee"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 30
	self_weight = 1.5
	price = 450

/obj/item/clothing/head/helmet/f13/eyebot
	name = "eyebot helmet"
	desc = "A dismantled eyebot, hollowed out to accommodate for a humanoid head."
	icon_state = "eyebot"
	item_state = "eyebot"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 60, acid = 20)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 4

/obj/item/clothing/head/helmet/f13/khan
	name = "Great Khan helmet"
	desc = "A piece of headwear commonly worn by the Great Khans that appears to resemble stereotypical traditional Mongolian helmets - likely adapted from a pre-War motorcycle helmet.<br>It is black with two horns on either side and a small spike jutting from the top, much like a pickelhaube.<br>A leather covering protects the wearer's neck and ears from sunburn."
	icon_state = "khan"
	item_state = "khan"
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 20
	self_weight = 1.5

/obj/item/clothing/head/helmet/f13/marine
	name = "combat helmet"
	desc = "A pre-War ballistic assembly, designed to provide moderate protection in combat.<br>Overtime the model became significantly less effective, and was replaced with reinforced combat helmet mark I."
	icon_state = "marine"
	item_state = "marine"
	armor = list(melee = 65, bullet = 60, laser = 25, energy = 15, bomb = 30, bio = 0, rad = 0, fire = 30, acid = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 20
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 2
	price = 2500

/obj/item/clothing/head/helmet/f13/combat_mk1
	name = "reinforced combat helmet mark I"
	desc = "A ballistic assembly, designed to protect the wearer from projectile and energy weapon impacts, bladed weapons, blunt trauma, and concussion."
	icon_state = "combat_mk1"
	item_state = "combat_mk1"
	armor = list(melee = 75, bullet = 65, laser = 30, energy = 20, bomb = 30, bio = 0, rad = 0, fire = 30, acid = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 20
	strip_delay = 40
	resistance_flags = FIRE_PROOF
	self_weight = 5
	price = 3500

/obj/item/clothing/head/helmet/f13/combat_mk2
	name = "reinforced combat helmet mark II"
	desc = "A complex ballistic assembly, designed to protect the wearer from projectile and energy weapon impacts, bladed weapons, blunt trauma, and concussion."
	icon_state = "combat_mk2"
	item_state = "combat_mk2"
	armor = list(melee = 80, bullet = 75, laser = 50, energy = 25, bomb = 50, bio = 0, rad = 0, fire = 50, acid = 40)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 20
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 7
	price = 4500

/obj/item/clothing/head/helmet/f13/brotherhood_helmet
	name = "Brotherhood combat helmet"
	desc = "A superior version of combat armor. The Brotherhood of Steel have made many improvements over the standard version."
	icon_state = "brotherhood_helmet"
	item_state = "brotherhood_helmet"
	armor = list(melee = 80, bullet = 75, laser = 50, energy = 25, bomb = 50, bio = 0, rad = 0, fire = 70, acid = 40)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 20
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 5

/obj/item/clothing/head/helmet/f13/trooper
	name = "шлем бойца"
	desc = "A dully-colored helmet designed to provide troopers a basic head protection.<br>It has a very rough \"mass-produced\" look to it, as it is issued to all NCR soldiers and MPs."
	icon_state = "trooper"
	item_state = "trooper"
	armor = list(melee = 45, bullet = 30, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 20, acid = 10)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 3

/obj/item/clothing/head/helmet/f13/ncr_helmet
	name = "NCR helmet"
	desc = "A dully-colored NCR helmet designed to provide troopers a basic head protection.<br>It has a very rough \"mass-produced\" look to it, as it is issued to all NCR soldiers and MPs."
	icon_state = "ncr_helmet"
	item_state = "ncr_helmet"
	armor = list(melee = 50, bullet = 35, laser = 15, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 20, acid = 10)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 5

/obj/item/clothing/head/helmet/f13/tesla_helmet
	name = "Tesla helmet"
	desc = "Tesla helmet it's a prototype, that has good protection against lasers and energy weapons."
	icon_state = "tesla_helmet"
	item_state = "tesla_helmet"
	armor = list(melee = 25, bullet = 25, laser = 60, energy = 45, bomb = 45, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 10

/obj/item/clothing/head/helmet/stealth/stealthhelmet
	desc = "A mask and visor meant to be worn with the Chinese Stealth Suit"
	name = "Stealth Helmet"
	icon_state = "stealthhelmet"
	item_state = "stealthhelmet"
	armor = list(melee = 30, bullet = 20, laser = 20,energy = 15, bomb = 30, bio = 30, rad = 25, fire = 100, acid = 100)
	strip_delay = 12
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	blockTracking = 1//Roughly the only unique thing about this helmet.
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/f13/ranger
	name = "шлем рейнджера"
	desc = "An old military helmet with a built-in night vision device, commonly worn by Veteran Rangers."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list(melee = 60, bullet = 50, laser = 35, energy = 25, bomb = 50, bio = 0, rad = 80, fire = 50, acid = 40)
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 1
	darkness_view = 8
	invis_view = SEE_INVISIBLE_MINIMUM
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	can_toggle = 1
	var/enabled = 1

/obj/item/clothing/head/helmet/f13/ranger/New()
	..()
	visor_toggling()

/obj/item/clothing/head/helmet/f13/ranger/attack_self(mob/user)
	to_chat(user, "<span class='notice'>Вы [up ? "включили" : "выключили"] [src].</span>")
	sleep(5)
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/f13/ranger/old
	name = "old ranger helmet"
	desc = "An old military helmet, commonly worn by Desert Rangers, that went through the fire and the flames, saving a single life amongst heavy bloodshed.<br>This particular helmet has a \"Forgive me mama\" inscription on the side."
	icon_state = "oldranger"
	item_state = "oldranger"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 40, fire = 30, acid = 10)
	self_weight = 1
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

/obj/item/clothing/head/helmet/f13/ranger/desert_ranger
	name = "Desert ranger helmet"
	desc = "An military helmet, commonly worn by Desert Rangers, that went through the fire and the flames, saving a single life amongst heavy bloodshed.<br>This particular helmet has a \"Forgive me mama\" inscription on the side."
	icon_state = "desert_ranger"
	item_state = "desert_ranger"
	armor = list(melee = 60, bullet = 50, laser = 35, energy = 30, bomb = 55, bio = 0, rad = 80, fire = 70, acid = 40)
	self_weight = 1
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

/obj/item/clothing/head/helmet/f13/ranger/elite_riot
	name = "Elite riot ranger helmet"
	desc = "The elite riot gear is a unique armor and the most advanced model of L.A.P.D. riot armor, superior to the pre-War 11th Armored Cavalry Regiment riot armor. Originally an 11th Armored Cavalry Regiment riot armor that was modified over time, it was the personal armor of an NCR riot control officer in the Divide, supervising the NCR riot operation in the Third Street Municipal Building before the destruction of the Divide."
	icon_state = "elite_riot"
	item_state = "elite_riot"
	armor = list(melee = 75, bullet = 70, laser = 45, energy = 40, bomb = 50, bio = 0, rad = 90, fire = 80, acid = 40)
	self_weight = 1.5
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

/obj/item/clothing/head/helmet/f13/legrecruit
	name = "recruit helmet"
	desc = "A Legion recruit helmet, made of fine molerat leather. Or was it gecko leather? Come to think of it, that other guy from Legion had a helmet made of brahmin leather..."
	icon_state = "legrecruit"
	item_state = "legrecruit"
	armor = list(melee = 30, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 10)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 30
	self_weight = 1

/obj/item/clothing/head/helmet/f13/legvet
	name = "Veteran helmet"
	desc = "The veteran helmet is comprised of several different pieces adjoined together: a baseball cap with an aluminum helmet, goggles for the eyes and a face wrap."
	icon_state = "legvet"
	item_state = "legvet"
	armor = list(melee = 50, bullet = 25, laser = 20, energy = 20, bomb = 15, bio = 0, rad = 0, fire = 0, acid = 10)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 30
	self_weight = 1.5

/obj/item/clothing/head/helmet/f13/legvexil
	name = "vexillarius hat"
	desc = "Vis gregis est lupus, ac vis lupi est grex.<br>100% of wolf."
	icon_state = "legvexil"
	item_state = "legvexil"
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	self_weight = 0.5

/obj/item/clothing/head/helmet/f13/legdecan
	name = "decanus helmet"
	desc = "A Legion decanus helmet, made of tanned leather and decorated with feathers."
	icon_state = "legdecan"
	item_state = "legdecan"
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 40
	self_weight = 0.5

/obj/item/clothing/head/helmet/f13/legdecan/alt //Variant with spiky feathers and pre-made goggles by Darkstalker_Darkfold.
	name = "decanus helmet"
	desc = "A Legion decanus helmet, made of tanned leather and decorated with pieces of biker goggles.<br>This one has particularly spiky feathers..."
	icon_state = "legdecanalt"
	item_state = "legdecanalt"
	flags = HEADCOVERSEYES
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/f13/legcenturion
	name = "centurion helmet"
	desc = "A metal helmet commonly worn by the Centurion, a ranked officer of Caesar's Legion."
	icon_state = "legcenturion"
	item_state = "legcenturion"
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 0, rad = 30, fire = 30, acid = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	self_weight = 2

/obj/item/clothing/head/helmet/f13/leglegate
	name = "legate helmet"
	desc = "A metal helmet destined to adorn the head of the Legate, a ranked officer of Caesar's Legion."
	icon_state = "leglegate"
	item_state = "leglegate"
	armor = list(melee = 60, bullet = 40, laser = 30, energy = 30, bomb = 40, bio = 0, rad = 40, fire = 50, acid = 20)
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 3

/obj/item/clothing/head/f13/strange
	name = "strange helmet"
	desc = "A very strange metal helmet...<br>I want to believe."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "strange"
	item_state = "helmet"
	armor = list(melee = 40, bullet = 20, laser = 40, energy = 40, bomb = 20, bio = 100, rad = 50, fire = 90, acid = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 3

/obj/item/clothing/head/helmet/f13/magneto
	name = "magneto's helmet"
	desc = "This helmet allows its wearer to resist all but the strongest or most unexpected telepathic attacks.<br>This is achieved due to technology wired into the helmet itself."
	icon_state = "magneto"
	item_state = "magneto"
	armor = list(melee = 60, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100, fire = 30, acid = 100)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = UNACIDABLE
	self_weight = 0.5


//Knights of the Apocalypse

/obj/item/clothing/head/helmet/knight
	name = "medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era."
	icon_state = "knight_green"
	item_state = "knight_green"
	armor = list(melee = 60, bullet = 55, laser = 15, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	flags = null
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null
	self_weight = 5

/obj/item/clothing/head/helmet/knight/blue
	name = "blue medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era.<br>This one is painted blue."
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/head/helmet/knight/yellow
	name = "yellow medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era.<br>This one is painted yellow."
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/head/helmet/knight/red
	name = "red medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era.<br>This one is painted red."
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/head/helmet/knight/templar
	name = "crusader helmet"
	desc = "Deus Vult."
	icon_state = "knight_templar"
	item_state = "knight_templar"

/obj/item/clothing/head/helmet/knight/f13/metal
	name = "metal helmet"
	desc = "A metal helmet forged in fire.<br>Specially designed for the most fearsome and strongest warriors of the wasteland."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "metalhelmet"
	item_state = "metalhelmet"

/obj/item/clothing/head/helmet/knight/f13/rider
	name = "rider helmet" //Not raider. Rider.
	desc = "A fancy dark metal helmet with orange spray-painted flames."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "rider"
	item_state = "rider"
	self_weight = 1

/obj/item/clothing/head/helmet/f13/fluff/m35
	name = "M35 helmet"
	desc = "Meine language INTERNATIONAL"
	icon_state = "m35"
	item_state = "m35"
	armor = list(melee = 40, bullet = 30, laser = 30, energy = 20, bomb = 30, bio = 0, rad = 0, fire = 30, acid = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 20
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 3

/obj/item/clothing/head/helmet/f13/doom
	name = "marine helmet"
	desc = "A helmet made of an unknown alloy.<br>You feel like this helmet would allow you to survive through Hell on Mars... er, Earth."
	icon_state = "doom"
	item_state = "doom"
	armor = list(melee = 75, bullet = 75, laser = 65, energy = 65, bomb = 50, bio = 100, rad = 100, fire = 100, acid = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 30
	strip_delay = 10
	resistance_flags = UNACIDABLE
	self_weight = 20

/obj/item/clothing/head/hardhat/f13/headlamp
	name = "налобный фонарик"
	icon_state = "hardhat0_head"
	item_state = "hardhat0_head"
	light_color = LIGHT_COLOR_YELLOW
	brightness_on = 3 //luminosity when on
	on = 0
	item_color = "head" //Determines used sprites: hardhat[on]_[item_color] and hardhat[on]_[item_color]2 (lying down sprite)
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = 0
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	resistance_flags = ACID_PROOF
	price = 850

/* /obj/item/clothing/head/helmet/f13/headlamp/proc/toogle_light(mob/user)
	on = !on
	icon_state = "[initial(icon_state)][on ? "-light" : ""]"
	item_state = "[initial(item_state)][on ? "-light" : ""]"
	user.update_inv_head()
	if(on)
		set_light(brightness_on)
	else
		set_light(0)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/f13/headlamp/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_helmet_light))
		toogle_light(user)
		return 1
	return ..() */