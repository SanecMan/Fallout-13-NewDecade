var/global/datum/getrev/revdata = new()

/datum/getrev
	var/parentcommit
	var/commit
	var/list/testmerge = list()
	var/date

/datum/getrev/New()
	var/head_file = return_file_text(".git/logs/HEAD")
	if(SERVERTOOLS && fexists("..\\prtestjob.lk"))
		testmerge = file2list("..\\prtestjob.lk")
	var/testlen = max(testmerge.len - 1, 0)
	var/regex/head_log = new("(\\w{40}) .+> (\\d{10}).+(?=(\n.*(\\w{40}).*){[testlen]}\n*\\Z)")
	head_log.Find(head_file)
	parentcommit = head_log.group[1]
	date = unix2date(text2num(head_log.group[2]))
	commit = head_log.group[4]
	world.log << "Running /tg/ revision:"
	world.log << "[date]"
	if(testmerge.len)
		world.log << commit
		for(var/line in testmerge)
			if(line)
				world.log << "Test merge active of PR #[line]"
		world.log << "Based off master commit [parentcommit]"
	else
		world.log << parentcommit
	world.log << "Current map - [MAP_NAME]" //can't think of anywhere better to put it
