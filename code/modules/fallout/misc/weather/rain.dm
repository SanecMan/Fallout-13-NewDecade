#define RAIN_CHANNEL 15
/datum/weather_controller/rain
	name = "Дождь"
	id = "Rain_acid"
	desc = "Simple rain."

	overlay = "Rain_acid"//"rain"
	chance = 40
	duration_min = 1 MINUTE
	duration_max = 3 MINUTE
	var/power = "normal"
	var/outside_sound
	var/inside_sound

	var/list/mobs = list()
	var/list/currentrun = list()

/datum/weather_controller/rain/on_start()
	power = pick("normal", "storm")
	switch(power)
		if("normal")
			overlay = "Rain_acid"//"rain"
			outside_sound = 'sound/f13effects/rain_new_2.ogg'
			inside_sound = 'sound/f13effects/rain_houses_high.ogg'
		if("storm")
			overlay = "storm_acid" //storm
			outside_sound = 'sound/f13effects/rain_new_1.ogg'
			inside_sound = 'sound/f13effects/rain_houses_high.ogg'
	. = ..()
	if(SSplanter)
		SSplanter.wait /= 3

/datum/weather_controller/rain/on_end()
	. = ..()
	if(SSplanter)
		SSplanter.wait = initial(SSplanter.wait)

/datum/weather_controller/rain/on_mob_enter(mob/mob, area/area = locate(/area/f13/wasteland))
	if(area.open_space)
		mob.playsound_local(get_turf(mob), outside_sound, vol = 15, channel = RAIN_CHANNEL, repeat = 1)
	else if(area.roof)
		mob.playsound_local(get_turf(mob), inside_sound, vol = 15, channel = RAIN_CHANNEL, repeat = 1)
	. = ..()

/datum/weather_controller/rain/can_start()
	if((SSweather.controllers["sandstorm"] in SSweather.active))
		return FALSE
	return TRUE

/datum/weather_controller/rain/on_mob_exit(mob/mob, area/area)
	mob.playsound_local(get_turf(mob), null, vol = 0, channel = RAIN_CHANNEL, repeat = 1)
	. = ..()

/datum/weather_controller/rain/process()
	if(TICK_CHECK)
		return
	if(prob(5))
		var/turf/open/turf = locate(rand(1,world.maxx), rand(1,world.maxy), rand(1,world.maxz))
		var/area/A = turf.loc
		if(!A.open_space)
			return
		for(var/mob/living/carbon/human/H in A)
			if(H?.wear_mask.flags_inv & HIDEFACE || H?.head.flags_inv & HIDEFACE)
				continue
			H.adjustToxLoss(0.5)

/*	if(!started)
		return
	if(prob(5))
		var/turf/open/turf = locate(rand(1,world.maxx), rand(1,world.maxy), rand(1,world.maxz))
		var/area/A = turf.loc
		if(!A.open_space)
			return
		if(!currentrun.len)
			currentrun = mobs.Copy()
		while(currentrun.len)
			var/mob/living/M = currentrun[currentrun.len]
			currentrun.len--
			if(istype(M, /mob/living/carbon/human))
				//if(prob(5))
					//lightningstrike(get_turf(M))
				var/mob/living/carbon/human/H = M
				H.adjustBruteLoss(2)
				H.adjustFireLoss(2)
				H.adjustToxLoss(2)
				M.adjustFireLoss(2)
			if (TICK_CHECK)
				return
		currentrun.Cut()
*/