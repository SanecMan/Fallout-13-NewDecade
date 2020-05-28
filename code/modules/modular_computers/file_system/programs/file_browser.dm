/datum/computer_file/program/filemanager
	filename = "filemanager"
	filedesc = "РобКо Менеджер Файлов"
	extended_desc = "Основная программа для просмотра и редактирования файлов."
	program_icon_state = "generic"
	size = 8
	requires_ntnet = 0
	available_on_ntnet = 0
	undeletable = 1
	var/open_file
	var/error

/datum/computer_file/program/filemanager/ui_act(action, params)
	if(..())
		return 1

	var/obj/item/weapon/computer_hardware/hard_drive/HDD = computer.all_components[MC_HDD]
	var/obj/item/weapon/computer_hardware/hard_drive/RHDD = computer.all_components[MC_HDD]
	var/obj/item/weapon/computer_hardware/printer/printer = computer.all_components[MC_PRINT]

	switch(action)
		if("PRG_openfile")
			. = 1
			open_file = params["name"]
		if("PRG_newtextfile")
			. = 1
			var/newname = sanitize(input(usr, "Введите новое название файла или ничего для отмены:", "Переименовать"))
			if(!newname)
				return 1
			if(!HDD)
				return 1
			var/datum/computer_file/data/F = new/datum/computer_file/data()
			F.filename = newname
			F.filetype = "TXT"
			HDD.store_file(F)
		if("PRG_deletefile")
			. = 1
			if(!HDD)
				return 1
			var/datum/computer_file/file = HDD.find_file_by_name(params["name"])
			if(!file || file.undeletable)
				return 1
			HDD.remove_file(file)
		if("PRG_usbdeletefile")
			. = 1
			if(!RHDD)
				return 1
			var/datum/computer_file/file = RHDD.find_file_by_name(params["name"])
			if(!file || file.undeletable)
				return 1
			RHDD.remove_file(file)
		if("PRG_closefile")
			. = 1
			open_file = null
			error = null
		if("PRG_clone")
			. = 1
			if(!HDD)
				return 1
			var/datum/computer_file/F = HDD.find_file_by_name(params["name"])
			if(!F || !istype(F))
				return 1
			var/datum/computer_file/C = F.clone(1)
			HDD.store_file(C)
		if("PRG_rename")
			. = 1
			if(!HDD)
				return 1
			var/datum/computer_file/file = HDD.find_file_by_name(params["name"])
			if(!file || !istype(file))
				return 1
			var/newname = sanitize(input(usr, "Введите новое имя файла:", "Переименовать", file.filename))
			if(file && newname)
				file.filename = newname
		if("PRG_edit")
			. = 1
			if(!open_file)
				return 1
			if(!HDD)
				return 1
			var/datum/computer_file/data/F = HDD.find_file_by_name(open_file)
			if(!F || !istype(F))
				return 1
			if(F.do_not_edit && (alert("Предупреждение: этот файл не совместим с редактором. Его редактирование может привести к необратимому повреждению данных или нарушению работоспособности. Продолжить?", "Обнаруженна Несовместимость", "Нет", "Да") == "Нет"))
				return 1
			// 16384 is the limit for file length in characters. Currently, papers have value of 2048 so this is 8 times as long, since we can't edit parts of the file independently.
			var/newtext = sanitize(html_decode(input(usr, "Редактирование [open_file]. Вы можете использовать большинство тегов, используемых при написании бумаги::", "Текстовый Редактор", F.stored_data) as message|null), 16384)
			if(!newtext)
				return
			if(F)
				var/datum/computer_file/data/backup = F.clone()
				HDD.remove_file(F)
				F.stored_data = newtext
				F.calculate_size()
				// We can't store the updated file, it's probably too large. Print an error and restore backed up version.
				// This is mostly intended to prevent people from losing texts they spent lot of time working on due to running out of space.
				// They will be able to copy-paste the text from error screen and store it in notepad or something.
				if(!HDD.store_file(F))
					error = "Невозможно перезаписать файл. Возможно переполнен диск. Хотите сделать резервную копию:<br><br>[F.stored_data]<br><br>"
					HDD.store_file(backup)
		if("PRG_printfile")
			. = 1
			if(!open_file)
				return 1
			if(!HDD)
				return 1
			var/datum/computer_file/data/F = HDD.find_file_by_name(open_file)
			if(!F || !istype(F))
				return 1
			if(!printer)
				error = "Ошибка: на вашем компьютере нет необходимого оборудования для выполнения этой операции."
				return 1
			if(!printer.print_text(parse_tags(F.stored_data)))
				error = "Ошибка: нет модуля принтера или бумаги в нём."
				return 1
		if("PRG_copytousb")
			. = 1
			if(!HDD || !RHDD)
				return 1
			var/datum/computer_file/F = HDD.find_file_by_name(params["name"])
			if(!F || !istype(F))
				return 1
			var/datum/computer_file/C = F.clone(0)
			RHDD.store_file(C)
		if("PRG_copyfromusb")
			. = 1
			if(!HDD || !RHDD)
				return 1
			var/datum/computer_file/F = RHDD.find_file_by_name(params["name"])
			if(!F || !istype(F))
				return 1
			var/datum/computer_file/C = F.clone(0)
			HDD.store_file(C)


/datum/computer_file/program/filemanager/proc/parse_tags(t)
	t = replacetext_char(t, "\[center\]", "<center>")
	t = replacetext_char(t, "\[/center\]", "</center>")
	t = replacetext_char(t, "\[br\]", "<BR>")
	t = replacetext_char(t, "\[b\]", "<B>")
	t = replacetext_char(t, "\[/b\]", "</B>")
	t = replacetext_char(t, "\[i\]", "<I>")
	t = replacetext_char(t, "\[/i\]", "</I>")
	t = replacetext_char(t, "\[u\]", "<U>")
	t = replacetext_char(t, "\[/u\]", "</U>")
	t = replacetext_char(t, "\[time\]", "[worldtime2text()]")
	t = replacetext_char(t, "\[date\]", "[time2text(world.realtime, "MMM DD")] [year_integer+540]")
	t = replacetext_char(t, "\[large\]", "<font size=\"4\">")
	t = replacetext_char(t, "\[/large\]", "</font>")
	t = replacetext_char(t, "\[h1\]", "<H1>")
	t = replacetext_char(t, "\[/h1\]", "</H1>")
	t = replacetext_char(t, "\[h2\]", "<H2>")
	t = replacetext_char(t, "\[/h2\]", "</H2>")
	t = replacetext_char(t, "\[h3\]", "<H3>")
	t = replacetext_char(t, "\[/h3\]", "</H3>")
	t = replacetext_char(t, "\[*\]", "<li>")
	t = replacetext_char(t, "\[hr\]", "<HR>")
	t = replacetext_char(t, "\[small\]", "<font size = \"1\">")
	t = replacetext_char(t, "\[/small\]", "</font>")
	t = replacetext_char(t, "\[list\]", "<ul>")
	t = replacetext_char(t, "\[/list\]", "</ul>")
	t = replacetext_char(t, "\[table\]", "<table border=1 cellspacing=0 cellpadding=3 style='border: 1px solid black;'>")
	t = replacetext_char(t, "\[/table\]", "</td></tr></table>")
	t = replacetext_char(t, "\[grid\]", "<table>")
	t = replacetext_char(t, "\[/grid\]", "</td></tr></table>")
	t = replacetext_char(t, "\[row\]", "</td><tr>")
	t = replacetext_char(t, "\[tr\]", "</td><tr>")
	t = replacetext_char(t, "\[td\]", "<td>")
	t = replacetext_char(t, "\[cell\]", "<td>")
	t = replacetext_char(t, "\[logo\]", "<img src = ntlogo.png>")
	return t


/datum/computer_file/program/filemanager/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = 0, datum/tgui/master_ui = null, datum/ui_state/state = default_state)

	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if (!ui)

		var/datum/asset/assets = get_asset_datum(/datum/asset/simple/headers)
		assets.send(user)

		ui = new(user, src, ui_key, "file_manager", "РобКо Файловая Система", 575, 700, state = state)
		ui.open()
		ui.set_autoupdate(state = 1)

/datum/computer_file/program/filemanager/ui_data(mob/user)
	var/list/data = get_header_data()

	var/obj/item/weapon/computer_hardware/hard_drive/HDD = computer.all_components[MC_HDD]
	var/obj/item/weapon/computer_hardware/hard_drive/portable/RHDD = computer.all_components[MC_SDD]
	if(error)
		data["error"] = error
	if(open_file)
		var/datum/computer_file/data/file

		if(!computer || !HDD)
			data["error"] = "Ошибка: Жёсткий диск не читаем"
		else
			file = HDD.find_file_by_name(open_file)
			if(!istype(file))
				data["error"] = "Ошибка: Не удаётся открыть файл"
			else
				data["filedata"] = parse_tags(file.stored_data)
				data["filename"] = "[file.filename].[file.filetype]"
	else
		if(!computer || !HDD)
			data["error"] = "Ошибка: Жёсткий диск не читаем"
		else
			var/list/files[0]
			for(var/datum/computer_file/F in HDD.stored_files)
				files.Add(list(list(
					"name" = F.filename,
					"type" = F.filetype,
					"size" = F.size,
					"undeletable" = F.undeletable
				)))
			data["files"] = files
			if(RHDD)
				data["usbconnected"] = 1
				var/list/usbfiles[0]
				for(var/datum/computer_file/F in RHDD.stored_files)
					usbfiles.Add(list(list(
						"name" = F.filename,
						"type" = F.filetype,
						"size" = F.size,
						"undeletable" = F.undeletable
					)))
				data["usbfiles"] = usbfiles

	return data