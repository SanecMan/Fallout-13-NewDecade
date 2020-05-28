/datum/computer_file/program/revelation
	filename = "revelation"
	filedesc = "Dream.Maker.Crash.All"
	program_icon_state = "hostile"
	extended_desc = "Этот вирус может уничтожить жесткий диск системы, на которой он выполняется. Он может быть переименован, чтобы выглядеть как другая не вредоносная программа. Будучи запущеным, он уничтожит систему при следующем запуске."
	size = 13
	requires_ntnet = 0
	available_on_ntnet = 0
	available_on_syndinet = 1
	var/armed = 0

/datum/computer_file/program/revelation/run_program(var/mob/living/user)
	. = ..(user)
	if(armed)
		activate()

/datum/computer_file/program/revelation/proc/activate()
	if(computer)
		computer.visible_message("<span class='notice'>\ [computer] мигает</span>")
		computer.enabled = 0
		computer.update_icon()
		var/obj/item/weapon/computer_hardware/hard_drive/hard_drive = computer.all_components[MC_HDD]
		var/obj/item/weapon/computer_hardware/battery/battery_module = computer.all_components[MC_CELL]
		var/obj/item/weapon/computer_hardware/recharger/recharger = computer.all_components[MC_CHARGE]
		qdel(hard_drive)
		computer.take_damage(25, BRUTE, 0, 0)
		if(battery_module && prob(25))
			qdel(battery_module)
			computer.visible_message("<span class='notice'>\ [computer] неожиданно взорвался выплёвывая ошмётки батареи.</span>")
			var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
			spark_system.start()

		if(recharger && prob(50))
			qdel(recharger)
			computer.visible_message("<span class='notice'>\ [computer] вывел сообщ...</span>")
			var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
			spark_system.start()


/datum/computer_file/program/revelation/ui_act(action, params)
	if(..())
		return 1
	switch(action)
		if("PRG_arm")
			armed = !armed
		if("PRG_activate")
			activate()
		if("PRG_obfuscate")
			var/mob/living/user = usr
			var/newname = sanitize(input(user, "Введите новое название программы: "))
			if(!newname)
				return
			filedesc = newname


/datum/computer_file/program/revelation/clone()
	var/datum/computer_file/program/revelation/temp = ..()
	temp.armed = armed
	return temp

/datum/computer_file/program/revelation/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = 0, datum/tgui/master_ui = null, datum/ui_state/state = default_state)

	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "revelation", "Вирус", 400, 250, state = state)
		ui.set_style("syndicate")
		ui.set_autoupdate(state = 1)
		ui.open()


/datum/computer_file/program/revelation/ui_data(mob/user)
	var/list/data = get_header_data()

	data["armed"] = armed

	return data