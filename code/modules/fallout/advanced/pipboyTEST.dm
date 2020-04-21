/obj/item/device/pipboy
	name = "My lovely Pipboy"
	desc = "Наручный компьютер. А дум запустить выйдет?"
	icon = 'icons/obj/pda.dmi'
	icon_state = "pda"
	item_state = "electronic"
	w_class = 1
	var/show_title = 0
	var/mainhtml = ""
	slot_flags = SLOT_ID | SLOT_BELT

/obj/item/device/pipboy/New()
	..()
	return

/obj/item/device/pipboy/attack_self(mob/user)
	user.set_machine(src)

	mainhtml = "<html><meta charset=UTF-8> \
	\
	<style>\
	a:link {color: #607D8B;}\
	a:visited {color: #607D8B;}\
	a:active {color: #607D8B;}\
	a:hover {background-color: #9E9E9E;}\
	a {text-decoration: none;}\
	body {\
	background: #000000;\
	}\
	table {\
	    background: #131416;\
	    padding: 15px;\
	    margin-bottom: 10px;\
	    color: #afb2a1;\
	}\
	\
	#table-bottom1 {\
		background: #2e2e38;\
		padding-top: 5px;\
		padding-bottom: 5px;\
	}\
	</style>\
	\
	\
	<body>\
	\
	<table border=0 height=\"250\" width=\"600\">\
	<tr>\
	<td align=\"left\" width=200>\
	<div style=\"overflow: hidden; height: 200px; width: 180px;\" ><img height=200 width=200 src=\"http://www.clubstalker.ru/images/resize/photo/640x480/de573c3358fd4160fe545f04b864fd69.jpg\"></div>\
	</td>\
	<td valign=\"top\" align=\"left\">\
	 <div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div><br>\
	 <b>Ei&#x44F;:</b> [user.name]<br><br>\
	 <b>?aia:</b> Yenia?o<br><br>\
	 <b>A?oiie?iaea:</b> Noaeea?<br><br>\
	 <b>?aiooaoe&#x44F;:</b> <font color=\"green\">Aia?iaooiue</font>\
	</td>\
	</tr>\
	\
	<tr>\
	<td colspan=\"2\" align=\"center\" id=\"table-bottom1\" height=60>\
			| <a href=\"\">Niiauaie&#x44F;</a> | <a href=\"\">Oiia?u</a>(<font color=\"#ff5722\">Off</font>) | <a href=\"\">Caiaoee</a> | <a href=\"\">?aeoeia</a> | <a href=\"\">Eaioa</a> | <a href=\"\">Ea?oa</a> |<br>\
	<div align=\"center\"><a href='byond://?src=\ref[src];choice=close'>\[ Aueoe \]</a></div>\
	</td>\
	</tr>\
	\
	</table>\
	\
	</body>\
	\
	</html>"
	user << browse(mainhtml, "window=mainhtml;size=625x305;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=0")


/obj/item/device/pipboy/Topic(href, href_list)
	..()

	var/mob/living/U = usr

	switch(href_list["choice"])
		if("title")
			if(show_title)
				U << browse(mainhtml, "window=mainhtml;size=625x305;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=0")
				show_title = 0
			else
				U << browse(mainhtml, "window=mainhtml;size=625x305;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=1")
				show_title = 1
		if("close")
			U << browse(null, "window=mainhtml")
	return