// Events are sent to the program by the computer.
// Always include a parent call when overriding an event.

// Called when the ID card is removed from computer. ID is removed AFTER this proc.
/datum/computer_file/program/proc/event_idremoved(background, slot)
	return

// Called when the computer fails due to power loss. Override when program wants to specifically react to power loss.
/datum/computer_file/program/proc/event_powerfailure(background)
	kill_program(forced = TRUE)

// Called when the network connectivity fails. Computer does necessary checks and only calls this when requires_ntnet_feature and similar variables are not met.
/datum/computer_file/program/proc/event_networkfailure(background)
	kill_program(forced = TRUE)
	if(background)
		computer.visible_message("<span class='danger'> Экран [computer] вывел сообщение \"Процесс [filename].[filetype] (UID [rand(100,999)]) снят - Сбой Сети\" error</span>")
	else
		computer.visible_message("<span class='danger'> Экран [computer] вывел сообщение \"Ошибка сети - Невозможно подключиться к другим терминалам\" и завис.</span>")
