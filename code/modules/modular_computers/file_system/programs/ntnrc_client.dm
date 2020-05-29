/datum/computer_file/program/chatclient
	filename = "ntnrc_client"
	filedesc = "РобКо чат - клиент"
	program_icon_state = "command"
	extended_desc = "Эта программа используется как чат-клиент между терминалами"
	size = 8
	requires_ntnet = 1
	requires_ntnet_feature = NTNET_COMMUNICATION
	network_destination = "РобКо сервер"
	ui_header = "ntnrc_idle.gif"
	available_on_ntnet = 1
	var/last_message = null				// Used to generate the toolbar icon
	var/username
	var/datum/ntnet_conversation/channel = null
	var/operator_mode = 0		// Channel operator mode
	var/netadmin_mode = 0		// Administrator mode (invisible to other users + bypasses passwords)

/datum/computer_file/program/chatclient/New()
	username = "Пользователь #[rand(100, 999)]"

/datum/computer_file/program/chatclient/ui_act(action, params)
	if(..())
		return 1

	switch(action)
		if("PRG_speak")
			. = 1
			if(!channel)
				return 1
			var/mob/living/user = usr
			var/message = reject_bad_text(input(user, "Введите сообщение или оставьте поле пустым для отмены: "))
			if(!message || !channel)
				return
			channel.add_message(message, username)
			log_chat("[user]/([user.ckey]) он же [username] отправил сообщение в [channel.title]: [message]")

		if("PRG_joinchannel")
			. = 1
			var/datum/ntnet_conversation/C
			for(var/datum/ntnet_conversation/chan in ntnet_global.chat_channels)
				if(chan.id == text2num(params["id"]))
					C = chan
					break

			if(!C)
				return 1

			if(netadmin_mode)
				channel = C		// Bypasses normal leave/join and passwords. Technically makes the user invisible to others.
				return 1

			if(C.password)
				var/mob/living/user = usr
				var/password = reject_bad_text(input(user,"Доступ запрещён: Введите пароль:"))
				if(C && (password == C.password))
					C.add_client(src)
					channel = C
				return 1
			C.add_client(src)
			channel = C
		if("PRG_leavechannel")
			. = 1
			if(channel)
				channel.remove_client(src)
			channel = null
		if("PRG_newchannel")
			. = 1
			var/mob/living/user = usr
			var/channel_title = reject_bad_text(input(user,"Введите название канала или оставьте поле пустым для отмены: "))
			if(!channel_title)
				return
			var/datum/ntnet_conversation/C = new/datum/ntnet_conversation()
			C.add_client(src)
			C.operator = src
			channel = C
			C.title = channel_title
		if("PRG_toggleadmin")
			. = 1
			if(netadmin_mode)
				netadmin_mode = 0
				if(channel)
					channel.remove_client(src) // We shouldn't be in channel's user list, but just in case...
					channel = null
				return 1
			var/mob/living/user = usr
			if(can_run(usr, 1, access_network))
				if(channel)
					var/response = alert(user, "Действительно ли переключить админ-режим? Вы будете отключены от вашего текущего канала!", "РобКо Админ Панель", "Да", "Нет")
					if(response == "Да")
						if(channel)
							channel.remove_client(src)
							channel = null
					else
						return
				netadmin_mode = 1
		if("PRG_changename")
			. = 1
			var/mob/living/user = usr
			var/newname = sanitize(input(user,"Введите ваш новый никнейм или оставьте поле пустым для отмены: "))
			if(!newname)
				return 1
			if(channel)
				channel.add_status_message("[username] сменил свой никнейм на [newname].")
			username = newname

		if("PRG_savelog")
			. = 1
			if(!channel)
				return
			var/mob/living/user = usr
			var/logname = input(user,"Введите желаемое имя файла журнала (.log) или оставить пустым для отмены:")
			if(!logname || !channel)
				return 1
			var/datum/computer_file/data/logfile = new/datum/computer_file/data/logfile()
			// Now we will generate HTML-compliant file that can actually be viewed/printed.
			logfile.filename = logname
			logfile.stored_data = "\[b\]Дамп журнала РобКо [channel.title]\[/b\]\[BR\]"
			for(var/logstring in channel.messages)
				logfile.stored_data += "[logstring]\[BR\]"
			logfile.stored_data += "\[b\]Завершено.\[/b\]"
			logfile.calculate_size()
			var/obj/item/weapon/computer_hardware/hard_drive/hard_drive = computer.all_components[MC_HDD]
			if(!computer || !hard_drive || !hard_drive.store_file(logfile))
				if(!computer)
					// This program shouldn't even be runnable without computer.
					CRASH("Значение компьютера не определено!")
					return 1
				if(!hard_drive)
					computer.visible_message("\ [computer] вывел на экран \"Ошибка: Невозможно подключиться к диску\".")
				else	// In 99.9% cases this will mean our HDD is full
					computer.visible_message("\ [computer] вывел на экран \"Ошибка: Необходимо [logfile.size]GQ для скачивания логов\".")
		if("PRG_renamechannel")
			. = 1
			if(!operator_mode || !channel)
				return 1
			var/mob/living/user = usr
			var/newname = reject_bad_text(input(user, "Введите новое название канала или оставьте пустым для отмены: "))
			if(!newname || !channel)
				return
			channel.add_status_message("Канал [channel.title] переименован [newname] оператором.")
			channel.title = newname
		if("PRG_deletechannel")
			. = 1
			if(channel && ((channel.operator == src) || netadmin_mode))
				qdel(channel)
				channel = null
		if("PRG_setpassword")
			. = 1
			if(!channel || ((channel.operator != src) && !netadmin_mode))
				return 1

			var/mob/living/user = usr
			var/newpassword = sanitize(input(user, "Введите новый пароль для канала или введите 'nopassword' для снятия пароля:"))
			if(!channel || !newpassword || ((channel.operator != src) && !netadmin_mode))
				return 1

			if(newpassword == "nopassword")
				channel.password = ""
			else
				channel.password = newpassword

/datum/computer_file/program/chatclient/process_tick()
	..()
	if(program_state != PROGRAM_STATE_KILLED)
		ui_header = "ntnrc_idle.gif"
		if(channel)
			// Remember the last message. If there is no message in the channel remember null.
			last_message = channel.messages.len ? channel.messages[channel.messages.len - 1] : null
		else
			last_message = null
		return 1
	if(channel && channel.messages && channel.messages.len)
		ui_header = last_message == channel.messages[channel.messages.len - 1] ? "ntnrc_idle.gif" : "ntnrc_new.gif"
	else
		ui_header = "ntnrc_idle.gif"

/datum/computer_file/program/chatclient/kill_program(forced = FALSE)
	if(channel)
		channel.remove_client(src)
		channel = null
	..()

/datum/computer_file/program/chatclient/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = 0, datum/tgui/master_ui = null, datum/ui_state/state = default_state)

	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if (!ui)


		var/datum/asset/assets = get_asset_datum(/datum/asset/simple/headers)
		assets.send(user)


		ui = new(user, src, ui_key, "ntnet_chat", "РобКо чат - клиент", 575, 700, state = state)
		ui.open()
		ui.set_autoupdate(state = 1)


/datum/computer_file/program/chatclient/ui_data(mob/user)
	if(!ntnet_global || !ntnet_global.chat_channels)
		return

	var/list/data = list()

	data = get_header_data()


	data["adminmode"] = netadmin_mode
	if(channel)
		data["title"] = channel.title
		var/list/messages[0]
		for(var/M in channel.messages)
			messages.Add(list(list(
				"msg" = M
			)))
		data["messages"] = messages
		var/list/clients[0]
		for(var/C in channel.clients)
			var/datum/computer_file/program/chatclient/cl = C
			clients.Add(list(list(
				"name" = cl.username
			)))
		data["clients"] = clients
		operator_mode = (channel.operator == src) ? 1 : 0
		data["is_operator"] = operator_mode || netadmin_mode

	else // Channel selection screen
		var/list/all_channels[0]
		for(var/C in ntnet_global.chat_channels)
			var/datum/ntnet_conversation/conv = C
			if(conv && conv.title)
				all_channels.Add(list(list(
					"chan" = conv.title,
					"id" = conv.id
				)))
		data["all_channels"] = all_channels

	return data