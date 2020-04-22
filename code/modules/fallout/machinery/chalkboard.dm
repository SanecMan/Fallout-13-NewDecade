#define CB_CLEAN 0
#define CB_WET 1
#define CB_CONTENT 2
#define CB_MESS 3

/obj/structure/chalkboard
	name = "chalkboard"
	desc = "Классическая доска для рисования всяких штук и научных диограмм.<br>Пожалуйста, не ешьте мел."
	icon = 'icons/fallout/machines/64x32.dmi'
	icon_state = "board_clean"
	flags = FPRINT
	density = 0
	anchored = 1
	var/status = CB_CLEAN
	var/content

/obj/structure/chalkboard/verb/honk()
	set src in oview(1)
	set name = "Рисовать"
	set desc = "Рисовашки это весело."
	set category = "Object"

	if (usr.stat != 0)
		return

	if(!ishuman(usr))
		usr << "\red Ты хочешь, но не можешь. Ты пытаешься, но нет."
		return

	if(content)
		usr << "\blue Доска вся изрисована, помойте чтобы использовать вновь."
		return

	add_fingerprint(usr)
	status = CB_MESS
	update()

/proc/count_occurrences(string, substring)
	var/count = 0
	var/found = 0
	var/length = length(substring)

	found = findtext_char(string, substring)

	while(found)
		count++
		found += length
		found = findtext_char(string, substring, found)

	return count

/obj/structure/chalkboard/verb/wrtite()
	set src in oview(1)
	set name = "Писать"
	set desc = "Не пялься, пиши давай."
	set category = "Object"

	if (usr.stat != 0)
		return


	if(!ishuman(usr))
		usr << "\red Ты хочешь, но не можешь. Ты пытаешься, но нет."
		return

	if(content)
		usr << "\blue Доска вся изрисована, помойте чтобы использовать вновь."
		return

	//part wrom paper/write
	var/t =  input("Что ты хочешь написать тут? максимум 2000 символов.", "Написать", null, null) as message

	if(length(t) > 2048)
		usr << "\blue Твоя писанина не влезла на доску!"
		return

	//t = checkhtml(t)
	t = sanitize(t, list("\n"="\[br\]")) //"?"=LETTER_255

	//t = replacetext_char(t, "\n", "<BR>")
	t = parsepencode(t) // Encode everything from pencode to html

	if(!t)
		return
	if(count_occurrences(t, "<BR>") > 20)
		usr << "\blue Вы не можете уместить всё на доске!"
		return

	content = t
	add_fingerprint(usr)
	status = CB_CONTENT
	update()



/obj/structure/chalkboard/verb/cleanup()
	set src in oview(1)
	set name = "Cleanup"
	set desc = "Make the board clean"
	set category = "Object"
//	set src in usr

	if (usr.stat != 0)
		return

	if(!ishuman(usr))
		usr << "\red You want, but you don't. You try, but you can't."
		return

	if(status != CB_WET)
		status = CB_WET

	else
		status = CB_CLEAN

	add_fingerprint(usr)
	update()

/obj/structure/chalkboard/proc/update()

	switch (status)
		if(CB_CLEAN)
			desc = "A classic chalkboard for various activities involving writing and drawing.<br>Don't eat the chalk."
			icon_state = "board_clean"
			content = null

		if(CB_WET)
			desc = "Dirty chalkboard."
			icon_state = "board_wet"
			content = null

		if(CB_CONTENT)
			desc = "A classic chalkboard for various activities involving writing and drawing.<br>Something is written on it, you start reading..."
			desc += "<HR>"
			desc +=	content
			desc += "<HR>"
			icon_state = "board_text[rand(1, 9)]"

		if(CB_MESS)
			desc = "A classic chalkboard for various activities involving writing and drawing.<br>It seems someone decided to have some fun."
			icon_state = "board_mess[rand(1, 9)]"
			content = "Draw"

/obj/structure/chalkboard/proc/parsepencode(var/t)

	t = replacetext_char(t, "\[center\]", "<center>")
	t = replacetext_char(t, "\[/center\]", "</center>")
	t = replacetext_char(t, "\[br\]", "<BR>")
	t = replacetext_char(t, "\[b\]", "<B>")
	t = replacetext_char(t, "\[/b\]", "</B>")
	t = replacetext_char(t, "\[i\]", "<I>")
	t = replacetext_char(t, "\[/i\]", "</I>")
	t = replacetext_char(t, "\[u\]", "<U>")
	t = replacetext_char(t, "\[/u\]", "</U>")
	t = replacetext_char(t, "\[large\]", "<font size=\"4\">")
	t = replacetext_char(t, "\[/large\]", "</font>")
	t = replacetext_char(t, "\[*\]", "<li>")
	t = replacetext_char(t, "\[small\]", "<font size = \"1\">")
	t = replacetext_char(t, "\[/small\]", "</font>")
	t = replacetext_char(t, "\[list\]", "<ul>")
	t = replacetext_char(t, "\[/list\]", "</ul>")

	return t

#undef CB_CLEAN
#undef CB_WET
#undef CB_CONTENT
#undef CB_MESS