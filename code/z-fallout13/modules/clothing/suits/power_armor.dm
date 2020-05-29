/datum/action/item_action/toggle/pa_cell
	button_icon_state = "pa_cell"

/datum/action/item_action/toggle/pa_toggle
	button_icon_state = "pa_onoff"

  ///////////////
 //POWER ARMOR//
/obj/item/clothing/suit/armor/f13/power_armor
	put_on_delay = 100
	strip_delay = 40
	self_weight = 200
	max_integrity = 10000
	throw_range = 0
	w_class = WEIGHT_CLASS_HUGE
	flags = STOPSPRESSUREDMAGE
	flags_inv = HIDEJUMPSUIT|HIDEBACKPACK|HIDEBELT
	resistance_flags = FIRE_PROOF | UNACIDABLE
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT

	actions_types = list(/datum/action/item_action/toggle/pa_cell, /datum/action/item_action/toggle/pa_toggle)

	var/obj/item/weapon/stock_parts/cell/power_cell = null
	var/mob/living/carbon/human/current_user = null

	var/default_power_usage = 10
	var/current_power_usage = null
	var/enabled = FALSE
	var/footstep = 1

/obj/item/clothing/suit/proc/step_action()

/obj/item/clothing/suit/armor/f13/power_armor/step_action()
	if(footstep > 1)
		playsound(src, "servostep", 50, 1)
		footstep = 0
	else
		footstep++

/obj/item/clothing/suit/armor/f13/power_armor/Initialize()
	current_power_usage = default_power_usage
	..()

/obj/item/clothing/suit/armor/f13/power_armor/emp_act()
	power_cell.emp_act()
	return

/obj/item/clothing/suit/armor/f13/power_armor/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/armor/f13/power_armor/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle/pa_cell))
		ejectInsertCell()
		return

	if(istype(actiontype, /datum/action/item_action/toggle/pa_toggle))
		onOffPA()
		return


/obj/item/clothing/suit/armor/f13/power_armor/verb/onOffPA()
	set name = "Вкл./Выкл. Силовую броню"
	set category = "Силовая Броня"
	set src in view(1)

	if(istype(usr, /mob/living/carbon))
		var/mob/living/carbon/C = usr
		if(C.special.getPoint("i") < 6 && !C.perks.have(/datum/perk_hidden/powerArmor))
			to_chat(usr, "<span class='boldwarning'>Три кнопки на силовой броне вгоняют вас в ступор, вы нажимаете одну из кнопок и ничего не происходит..</span>")
			playsound(src.loc, 'sound/f13items/lighter_off.ogg', 40, 0, 0)
			return

	if(!power_cell || power_cell.charge <= 0)
		to_chat(usr, "<span class='userdanger'>Питание отсутствует.</span>")
		return

	enabled = !enabled
	if(enabled)
		to_chat(usr, "<span class='green'>Силовая броня активирована.</span>")
		powerControl()
	else
		to_chat(usr, "<span class='notice'>Силовая броня деактивирована.</span>")

/obj/item/clothing/suit/armor/f13/power_armor/verb/ejectInsertCell()
	set name = "Изъять/Вставить Ядерную ячейку"
	set category = "Силовая Броня"
	set src in view(1)

	if(istype(usr, /mob/living/carbon))
		var/mob/living/carbon/C = usr
		if(C.special.getPoint("i") < 3 && !C.perks.have(/datum/perk_hidden/powerArmor))
			to_chat(usr, "<span class='boldwarning'>Эта дырка для батарейка вы-ыглядеть СЛИШКАМ сложна.</span>")
			playsound(src.loc, 'sound/f13effects/bruh.ogg', 40, 0, 0)
			return
	else
		to_chat(usr, "Иди нахуй, животное")
		return

	if(!power_cell)
		if(istype(usr.get_active_held_item(), /obj/item/weapon/stock_parts/cell))
			power_cell = usr.get_active_held_item()
			usr.drop_item()
			power_cell.forceMove(src)
			powerControl()
			to_chat(usr, "<span class='notice'>Вы подключили [power_cell.name] к [src].</span>")
			playsound(src.loc, 'sound/weapons/selector.ogg', 40, 0, 0)
			return
		to_chat(usr, "<span class='warning'>Ядерный блок отсутствует!</span>")
		return
	else
		to_chat(usr, "<span class='green'>Вы извлекли [power_cell.name] из [src].</span>")
		playsound(src.loc, 'sound/weapons/selector.ogg', 40, 0, 0)
		usr.put_in_hands(power_cell)
		power_cell = null

/obj/item/clothing/suit/armor/f13/power_armor/proc/powerControl()
	if(!power_cell || power_cell.charge <= 0)
		enabled = FALSE
		return

	START_PROCESSING(SSobj, src)
	playsound(src.loc, 'sound/weapons/flash.ogg', 40, 0, 0)

/obj/item/clothing/suit/armor/f13/power_armor/proc/checkUserSkills()
	current_power_usage = default_power_usage
	if(istype(loc, /mob/living/carbon/human) && enabled)
		current_user = loc

		if(current_user.perks.have(/datum/perk/power_armor_cell_economy))
			current_power_usage = round(current_power_usage / 2)

		if(current_user.perks.have(/datum/perk_hidden/powerArmor))
			current_power_usage = round(current_power_usage / 2)
	else
		current_user = null

/obj/item/clothing/suit/armor/f13/power_armor/process()
	checkUserSkills()
	if(!power_cell || !power_cell.use(current_power_usage) || !enabled)
		enabled = FALSE
		STOP_PROCESSING(SSobj, src)
		to_chat(usr, "<span class='boldwarning'>[src] отключилась!.</span>")


/obj/item/clothing/suit/armor/f13/power_armor/sierra
	name = "дырявая силовая броня Сиерра"
	desc = "The scorched Sierra power armor is a suit of T-45d power armor that has been modified by the NCR for its officers. The left shoulder pauldron has been replaced with a hairless, taxidermied bear's head held in place by a green mantle with two bronze star medallion clips. The back-mounted power cylinders have been replaced by a more streamlined box unit with glowing green panels which also appear on the forearms. The armor itself is slightly blackened due to the nuclear detonation. The bolts on the armor appear to have once been plated in gold-flake, along with gold trim all around the armor."
	icon_state = "sierra"
	item_state = "sierra"
	armor = list(melee = 70, bullet = 70, laser = 45, energy = 20, bomb = 75, bio = 100, rad = 100, fire = 100, acid = 50)
	self_weight = 35

/obj/item/clothing/suit/armor/f13/power_armor/ncr
	name = "salvaged power armor"
	desc = "A set of T-45d power armor recovered by the NCR during the NCR-Brotherhood War.<br>NCR technicians have restored it to working order by replacing the back-mounted cylinders with a custom air conditioning module and stripping out the joint servomotors.<br>Due to the lack of servomotors in the limbs, this armor is so heavy that it feels like you're carrying a brahmin on your back!"
	icon_state = "t45bpowerarmor"
	item_state = "t45bpowerarmor"
	armor = list(melee = 70, bullet = 70, laser = 45, energy = 20, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 50)
	self_weight = 45

/obj/item/clothing/suit/armor/f13/power_armor/t45d
	name = "T-45d power armor"
	desc = "Originally developed and manufactured for the United States Army by American defense contractor West Tek, the T-45d power armor was the first version of power armor to be successfully deployed in battle."
	icon_state = "t45dpowerarmor"
	item_state = "t45dpowerarmor"
	armor = list(melee = 85, bullet = 85, laser = 50, energy = 25, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 50)

/obj/item/clothing/suit/armor/f13/power_armor/t51b
	name = "T-51b power armor"
	desc = "A mass-produced pinnacle of pre-War engineering.<br>Developed in the laboratories of the West Tek Research Facility, the T-51b was deployed at the end of the Anchorage Reclamation, and by January 2077, the armor had become standard issue for American soldiers in the Army's Mechanized Cavalry Regiments."
	icon_state = "t51bpowerarmor"
	item_state = "t51bpowerarmor"
	armor = list(melee = 90, bullet = 90, laser = 55, energy = 30, bomb = 80, bio = 100, rad = 100, fire = 100, acid = 60)

/obj/item/clothing/suit/armor/f13/power_armor/t60
	name = "T-60 power armor"
	desc = "Developed in early 2077 after the Anchorage Reclamation, the T-60 series of power armor was designed to eventually replace the T-51b power armor as the pinnacle of powered armor technology in the U.S. military arsenal.<br>Incorporating design elements from the earlier T-45, the T-60 was deployed domestically among U.S. Army units just prior to the dropping of the bombs."
	icon_state = "t60powerarmor"
	item_state = "t60powerarmor"
	armor = list(melee = 95, bullet = 95, laser = 60, energy = 35, bomb = 85, bio = 100, rad = 100, fire = 100, acid = 60)

/obj/item/clothing/suit/armor/f13/power_armor/advanced
	name = "advanced power armor mark I"
	desc = "An advanced suit of armor typically used by the Enclave.<br>It is composed of lightweight metal alloys, reinforced with ceramic castings at key stress points.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "mk1"
	item_state = "mk1"
	armor = list(melee = 95, bullet = 90, laser = 70, energy = 40, bomb = 90, bio = 100, rad = 100, fire = 100, acid = 30)
	self_weight = 40

/obj/item/clothing/suit/armor/f13/power_armor/tesla
	name = "tesla power armor"
	desc = "A variant of the Enclave's advanced power armor Mk I, jury-rigged with a Tesla device that is capable of dispersing a large percentage of the damage done by directed-energy attacks.<br>As it's made of complex composite materials designed to block most of energy damage - it's notably weaker against kinetic impacts."
	icon_state = "mk1-tesla"
	item_state = "mk1-tesla"
	self_weight = 40
	armor = list(melee = 95, bullet = 90, laser = 80, energy = 40, bomb = 90, bio = 100, rad = 100, fire = 100, acid = 50)

/obj/item/clothing/suit/armor/f13/power_armor/superadvanced
	name = "advanced power armor mark II"
	desc = "An improved model of advanced power armor used exclusively by the Enclave military forces, developed after the Great War.<br>Like its older brother, the standard advanced power armor, it's matte black with a menacing appearance, but with a few significant differences - it appears to be composed entirely of lightweight ceramic composites rather than the usual combination of metal and ceramic plates.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "mk2"
	item_state = "mk2"
	self_weight = 30
	armor = list(melee = 100, bullet = 100, laser = 90, energy = 65, bomb = 100, bio = 100, rad = 100, fire = 100, acid = 100)

	//armor = list(melee = 80, bullet = 80, laser = 50, energy = 50, bomb = 80, bio = 100, rad = 100, fire = 100, acid = 30)

/obj/item/clothing/suit/armor/f13/power_armor/shocktrooper
	name = "shocktrooper power armor"
	desc = "A \"Black Devil\" power armor - a high-end model used exclusively by the Enclave's Department of the Army and developed after the Great War and the destruction of the Enclave Oil Rig in 2241.<br>It is composed entirely of lightweight composites rather than the usual combination of metal and composite plates found on the previous designations of advanced power armor, the mark I and II."
	icon_state = "shocktrooper"
	item_state = "shocktrooper"
	armor = list(melee = 80, bullet = 80, laser = 60, energy = 60, bomb = 80, bio = 100, rad = 100, fire = 100, acid = 50)



/obj/item/clothing/suit/armor/f13/power_armor/badmin
	name = "advanced power armor Mk III"
	desc = "A group of Enclave mad scientists lead by Administrator Badmin, have spent a decade working on the super weapon you see in front of you."
	icon_state = "badmin"
	item_state = "badmin"
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 100, bio = 100, rad = 100, fire = 100, acid = 100) //Burn baby, burn!
	self_weight = 1



  ///////////////////////
 //POWER ARMOR HELMETS//
/obj/item/clothing/head/helmet/power_armor
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	heat_protection = HEAD
	cold_protection = HEAD
	max_integrity = 10000
	var/brightness_on = 4 //luminosity when the light is on
	var/on = 0
	light_color = LIGHT_COLOR_YELLOW
	icon = 'icons/fallout/clothing/hats.dmi'

/datum/action/item_action/toggle_helmet_light
	button_icon_state = "pa_helmet"

/obj/item/clothing/head/helmet/power_armor/proc/toogle_light(mob/user)
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


/obj/item/clothing/head/helmet/power_armor/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_helmet_light))
		toogle_light(user)
		return 1
	return ..()

/obj/item/clothing/head/helmet/power_armor/badmin
	name = "advanced mark III power helmet"
	desc = "A group of Enclave mad scientists lead by Administrator Badmin, have spent a decade working on the incredible creation you see in front of you."
	icon_state = "badmin"
	item_state = "badmin"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 100, bio = 100, rad = 100, fire = 100, acid = 100)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	put_on_delay = 50
	strip_delay = 100
	resistance_flags = FIRE_PROOF | UNACIDABLE
	self_weight = 3

	darkness_view = 8
	invis_view = SEE_INVISIBLE_MINIMUM
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	can_toggle = 1

/obj/item/clothing/head/helmet/power_armor/badmin/New()
	..()
	visor_toggling()

/obj/item/clothing/head/helmet/power_armor/badmin/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You [up ? "enabled" : "disabled"] [src].</span>")
	sleep(5)
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/power_armor/shocktrooper
	name = "shocktrooper power helmet"
	desc = "A 'black devil' power armor helmet used exclusively by Enclave military forces, developed after the Great War and the destruction of the Enclave Oil Rig in 2241.<br>You can't lie, it looks pretty badass."
	icon_state = "shocktrooper"
	item_state = "shocktrooper"
	put_on_delay = 50
	strip_delay = 100
	self_weight = 4
	darkness_view = 8
	can_toggle = 1
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle)
	armor = list(melee = 70, bullet = 70, laser = 60, energy = 60, bomb = 80, bio = 100, rad = 100, fire = 100, acid = 50)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	resistance_flags = FIRE_PROOF | UNACIDABLE
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	heat_protection = HEAD
	invis_view = SEE_INVISIBLE_MINIMUM
	var/obj/machinery/camera/portable/builtInCamera

/obj/item/clothing/head/helmet/power_armor/shocktrooper/New()
	..()

	if(loc)
		builtInCamera = new /obj/machinery/camera/portable(src)
		builtInCamera.network = list("enclave")
		builtInCamera.c_tag = "[src.name]-[rand(1000,9999)]"

	visor_toggling()


/obj/item/clothing/head/helmet/power_armor/shocktrooper/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You [up ? "enabled" : "disabled"] [src].</span>")
	sleep(5)
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/power_armor/superadvanced
	name = "advanced mark II power helmet"
	desc = "An improved model of advanced power armor used exclusively by Enclave military forces, developed after the Great War.<br>It looks rather threatening."
	icon_state = "mk2"
	item_state = "mk2"
	put_on_delay = 50
	strip_delay = 100
	self_weight = 4
	darkness_view = 8
	can_toggle = 1
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle)
	armor = list(melee = 90, bullet = 90, laser = 70, energy = 65, bomb = 80, bio = 100, rad = 100, fire = 100, acid = 30)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	resistance_flags = FIRE_PROOF | UNACIDABLE
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	heat_protection = HEAD
	invis_view = SEE_INVISIBLE_MINIMUM
	var/obj/machinery/camera/portable/builtInCamera

/obj/item/clothing/head/helmet/power_armor/superadvanced/New()
	..()

	if(loc)
		builtInCamera = new /obj/machinery/camera/portable(src)
		builtInCamera.network = list("enclave")
		builtInCamera.c_tag = "[src.name]-[rand(1000,9999)]"

	visor_toggling()

/obj/item/clothing/head/helmet/power_armor/superadvanced/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You [up ? "enabled" : "disabled"] [src].</span>")
	sleep(5)
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/power_armor/tesla
	name = "tesla power helmet"
	desc = "A helmet typically used by Enclave special forces.<br>There are three orange energy capacitors on the side."
	icon_state = "mk1-tesla"
	item_state = "mk1-tesla"
	put_on_delay = 50
	strip_delay = 100
	self_weight = 6
	darkness_view = 6
	can_toggle = 1
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle)
	armor = list(melee = 95, bullet = 90, laser = 80, energy = 60, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 30)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	resistance_flags = FIRE_PROOF | UNACIDABLE
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	heat_protection = HEAD
	invis_view = SEE_INVISIBLE_MINIMUM
	var/obj/machinery/camera/portable/builtInCamera

/obj/item/clothing/head/helmet/power_armor/tesla/New()
	..()

	if(loc)
		builtInCamera = new /obj/machinery/camera/portable(src)
		builtInCamera.network = list("enclave")
		builtInCamera.c_tag = "[src.name]-[rand(1000,9999)]"

	visor_toggling()

/obj/item/clothing/head/helmet/power_armor/tesla/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You [up ? "enabled" : "disabled"] [src].</span>")
	sleep(5)
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/power_armor/advanced
	name = "advanced mark I power helmet"
	desc = "A helmet typically used by Enclave regular troops.<br>It looks somewhat threatening."
	icon_state = "mk1"
	item_state = "mk1"
	put_on_delay = 50
	strip_delay = 100
	self_weight = 4
	darkness_view = 6
	can_toggle = 1
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle)
	armor = list(melee = 95, bullet = 90, laser = 70, energy = 60, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 30)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	resistance_flags = FIRE_PROOF | UNACIDABLE
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	heat_protection = HEAD
	invis_view = SEE_INVISIBLE_MINIMUM
	var/obj/machinery/camera/portable/builtInCamera

/obj/item/clothing/head/helmet/power_armor/advanced/New()
	..()

	if(loc)
		builtInCamera = new /obj/machinery/camera/portable(src)
		builtInCamera.network = list("enclave")
		builtInCamera.c_tag = "[src.name]-[rand(1000,9999)]"

	visor_toggling()

/obj/item/clothing/head/helmet/power_armor/advanced/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You [up ? "enabled" : "disabled"] [src].</span>")
	sleep(5)
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/power_armor/t60
	name = "T-60 power helmet"
	desc = "An old pre-War power armor helmet.<br>It's very comfy."
	icon_state = "t60helmet"
	item_state = "t60helmet"
	put_on_delay = 50
	strip_delay = 100
	self_weight = 5
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	armor = list(melee = 95, bullet = 95, laser = 60, energy = 45, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 60)
	resistance_flags = FIRE_PROOF | UNACIDABLE
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	cold_protection = HEAD
	heat_protection = HEAD

/obj/item/clothing/head/helmet/power_armor/t51b
	name = "T-51b power helmet"
	desc = "An old pre-War power armor helmet.<br>It's fairly comfy."
	icon_state = "t51bhelmet"
	item_state = "t51bhelmet"
	put_on_delay = 50
	strip_delay = 100
	self_weight = 5
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	armor = list(melee = 90, bullet = 90, laser = 55, energy = 35, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 60)
	resistance_flags = FIRE_PROOF | UNACIDABLE
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	cold_protection = HEAD
	heat_protection = HEAD

/obj/item/clothing/head/helmet/power_armor/t45d
	name = "T-45d power helmet"
	desc = "An old pre-War power armor helmet.<br>The inside is stuffy and hot."
	icon_state = "t45dhelmet"
	item_state = "t45dhelmet"
	put_on_delay = 50
	strip_delay = 100
	self_weight = 5
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	armor = list(melee = 100, bullet = 95, laser = 40, energy = 30, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF | UNACIDABLE
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	cold_protection = HEAD

/obj/item/clothing/head/helmet/power_armor/ncr
	name = "salvaged power helmet"
	desc = "A pre-War power armor helmet, recovered and maintained by NCR engineers.<br>The inside is aggravatingly stuffy and hot."
	icon_state = "t45bhelmet"
	item_state = "t45bhelmet"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 70, bullet = 65, laser = 30, energy = 25, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 40)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 50
	strip_delay = 100
	resistance_flags = FIRE_PROOF | UNACIDABLE
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	self_weight = 5