/client/proc/select_lang(var/rus_msg, var/eng_msg)
	if(mob.client)
		switch(language)
			if("English")
				return eng_msg
			if("Russian")
				return rus_msg
	else
		return eng_msg

/client/verb/change_lang()
	set name = "Change Language"
	set category = "CHANGE LANGUAGE"
	set desc = "Changes game language."

	if(usr.client.language == "English")
		usr.client.language = "Russian"
		to_chat(src, "<span class='notice'>Теперь ваш язык Русский</span>")
	else if(usr.client.language == "Russian")
		usr.client.language = "English"
		to_chat(src, "<span class='notice'>Now your language is English</span>")