

//Sets our luminosity.
//If we have no light it will create one.
//If we are setting luminosity to 0 the light will be cleaned up by the controller and garbage collected once all its
//queues are complete.
//if we have a light already it is merely updated, rather than making a new one.
//The second arg allows you to scale the light cap for calculating falloff.

/datum/light_source/proc/UpdateLuminosity(new_luminosity, new_cap)
	if(new_luminosity < 0)
		new_luminosity = 0

/atom/proc/SetLuminosity(new_luminosity, new_cap)
	if (!light)
		if (new_luminosity <= 0)
			return
		light = new(src)

	light.UpdateLuminosity(new_luminosity, new_cap)

/atom/proc/AddLuminosity(delta_luminosity)
	if(light)
		SetLuminosity(light.luminosity + delta_luminosity)
	else
		SetLuminosity(delta_luminosity)

/area/SetLuminosity(new_luminosity)			//we don't want dynamic lighting for areas
	luminosity = !!new_luminosity
