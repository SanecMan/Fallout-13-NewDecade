/client/proc/select_lang(var/rus_msg, var/eng_msg)
	if(mob.client)
		switch(language)
			if("Russian")
				return rus_msg
			if("English")
				return eng_msg
	else
		return eng_msg

/client/verb/change_lang()
    set name = "Change Language"
    set category = "OOC"

    if(user.client.language == "English")
        user.client.language = "Russian"
        user << "Теперь ваш язык Русский"
    else if(user.client.language == "Russian")
        user.client.language = "English"
        user << "Now your language is English"